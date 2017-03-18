//
//  SuperHeroDetailPresenter.swift
//  KataSuperHeroes
//
//  Created by Pedro Vicente Gomez on 09/03/2017.
//  Copyright © 2017 GoKarumi. All rights reserved.
//

import Foundation

import BothamUI

class SuperHeroDetailPresenter: BothamPresenter {

    weak var ui: SuperHeroeDetailView?
    
    let getSuperHero: GetSuperHero
    let superHeroId: String
    
    init(ui: SuperHeroeDetailView, superHeroId: String, getSuperHero: GetSuperHero) {
        
        self.ui = ui
        self.superHeroId = superHeroId
        self.getSuperHero = getSuperHero
    }
    
    func viewDidLoad() {
    
        self.ui?.showLoader()
        
        self.getSuperHero.execute(superHeroId: self.superHeroId) { (superHero) in
         
            self.ui?.hideLoader()
            self.ui?.show(superHero: superHero)
        }
    }

}

protocol SuperHeroeDetailView: BothamLoadingUI {
    
    func show(superHero: SuperHero?)
    
}
