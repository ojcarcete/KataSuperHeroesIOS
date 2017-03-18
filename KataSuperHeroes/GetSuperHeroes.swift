//
//  GetSuperheroes.swift
//  KataSuperHeroes
//
//  Created by Some Guy on 18/3/17.
//  Copyright © 2017 GoKarumi. All rights reserved.
//

import Foundation

typealias SuperHeroesResult = (_ superHeroes: [SuperHero]) -> ()

struct GetSuperHeroes {
    
    internal let superHeroesRepository: SuperHeroesRepository
    
    func execute(completion: @escaping SuperHeroesResult) {

        self.superHeroesRepository.getAll(completion: completion)
    }
    
}
