//
//  GetSuperheroes.swift
//  KataSuperHeroes
//
//  Created by Some Guy on 18/3/17.
//  Copyright © 2017 GoKarumi. All rights reserved.
//

import Foundation
import Result

typealias SuperHeroesResult = Result<[SuperHero], SuperHeroError>
typealias SuperHeroesResponse = (_ superHeroesResult: SuperHeroesResult) -> ()

struct GetSuperHeroes {
    
    internal let richSuperHeroModel: RichSuperHeroModel
    
    func execute(completion: @escaping SuperHeroesResponse) {

        self.richSuperHeroModel.getAll(completion: completion)
    }
    
}
