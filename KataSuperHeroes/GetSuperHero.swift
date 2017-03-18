//
//  GetSuperHero.swift
//  KataSuperHeroes
//
//  Created by Some Guy on 18/3/17.
//  Copyright © 2017 GoKarumi. All rights reserved.
//

import Foundation

typealias SuperHeroResult = (_ superHeroes: SuperHero?) -> ()

struct GetSuperHero {
    
    internal let superHeroesRepository: SuperHeroesRepository
    
    func execute(superHeroId: String, completion: @escaping SuperHeroResult) {
        
        self.superHeroesRepository.get(id: superHeroId, completion: completion)
    }
    
}
