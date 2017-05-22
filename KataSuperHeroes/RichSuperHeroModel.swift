//
//  RichSuperHeroModel.swift
//  KataSuperHeroes
//
//  Created by Some Guy on 18/3/17.
//  Copyright © 2017 GoKarumi. All rights reserved.
//

import Foundation

struct RichSuperHeroModel {
    
    internal let superHeroesRepository: SuperHeroesRepository
    
    func getAll(completion: @escaping SuperHeroesResponse) {
        
        self.superHeroesRepository.getAll { (superHeroResult) in
            
            if var superHeroes = superHeroResult.value {
                
                superHeroes = superHeroes.enumerated().map({ (index, superHero) in
                
                    (index % 3 == 2) ? superHero.asAvenger(isAvenger: true) : superHero
                })
                
                completion(SuperHeroesResult(value: superHeroes))
            }
            else {
                completion(SuperHeroesResult(value: [SuperHero]()))
            }
        }
    }
    
}
