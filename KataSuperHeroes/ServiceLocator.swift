//
//  RootWireframe.swift
//  KataSuperHeroes
//
//  Created by Pedro Vicente Gomez on 12/01/16.
//  Copyright © 2016 GoKarumi. All rights reserved.
//

import Foundation
import UIKit
import BothamUI

class ServiceLocator {

    let superHeroesRepository = SuperHeroesRepository()
    
    func provideRootViewController() -> UIViewController {
        let navigationController: UINavigationController = storyBoard.initialViewController()
        navigationController.viewControllers = [provideSuperHeroesViewController()]
        return navigationController
    }

    func provideSuperHeroesViewController() -> UIViewController {
        let getSuperHeroes = GetSuperHeroes(superHeroesRepository: self.superHeroesRepository)
        
        let superHeroesViewController: SuperHeroesViewController =
        storyBoard.instantiateViewController("SuperHeroesViewController")
        
        let dataSource = provideSuperHeroesDataSource()
        superHeroesViewController.dataSource = dataSource
        
        let presenter = SuperHeroesPresenter(ui: superHeroesViewController, getSuperHeroes: getSuperHeroes)
        superHeroesViewController.presenter = presenter
        
        superHeroesViewController.delegate =
            BothamTableViewNavigationDelegate(dataSource: dataSource, presenter: presenter)
    
        return superHeroesViewController
    }

    func provideSuperHeroDetailViewController(_ superHeroId: String) -> UIViewController {
        let getSuperHero = GetSuperHero(superHeroesRepository: superHeroesRepository)
        
        let viewController: SuperHeroDetailViewController =
        storyBoard.instantiateViewController("SuperHeroDetailViewController")
        viewController.presenter = SuperHeroDetailPresenter(ui: viewController, superHeroId: superHeroId, getSuperHero: getSuperHero)
        return viewController
    }

    fileprivate func provideSuperHeroesDataSource() -> BothamTableViewDataSource<SuperHero, SuperHeroTableViewCell> {
        return BothamTableViewDataSource<SuperHero, SuperHeroTableViewCell>()
    }

    fileprivate lazy var storyBoard: BothamStoryboard = {
        return BothamStoryboard(name: "SuperHeroes")
    }()

}
