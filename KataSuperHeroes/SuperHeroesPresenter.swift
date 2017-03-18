//
//  SuperHeroesPresenter.swift
//  KataSuperHeroes
//
//  Created by Pedro Vicente Gomez on 09/03/2017.
//  Copyright © 2017 GoKarumi. All rights reserved.
//

import Foundation
import BothamUI

class SuperHeroesPresenter: BothamPresenter, BothamNavigationPresenter {

    weak var ui: SuperHeroesView?
    let getSuperHeroes: GetSuperHeroes
    
    init(ui: SuperHeroesView, getSuperHeroes: GetSuperHeroes) {
        
        self.ui = ui
        self.getSuperHeroes = getSuperHeroes
    }
    
    func viewDidLoad() {
        
        self.ui?.showLoader()
        
        self.getSuperHeroes.execute { (superHeroesResult) in
        
            self.ui?.hideLoader()
            
            if let superHeroes = superHeroesResult.value {
                
                if superHeroes.isEmpty {
                    
                    self.ui?.showEmptyCase()
                }
                else {
                    
                    self.ui?.showSuperHeroes(superHeroes: superHeroes)
                }
            }
        }
    }
    
    func itemWasTapped(_ item: SuperHero) {
    
        let superHeroDetailViewController = ServiceLocator().provideSuperHeroDetailViewController(item.superHeroId) as! SuperHeroDetailViewController
        self.ui?.openSuperHeroDetailScreen(superHeroDetailViewController)        
    }
    
}

protocol SuperHeroesView: BothamLoadingUI {

    func showEmptyCase()
    
    func showSuperHeroes(superHeroes: [SuperHero])
    
    func openSuperHeroDetailScreen(_ superHeroDetailViewController: UIViewController)
        
}
