//
//  SuperHeroesRepository.swift
//  KataSuperHeroes
//
//  Created by Some Guy on 18/3/17.
//  Copyright © 2017 GoKarumi. All rights reserved.
//

import Foundation
import MarvelAPIClient

struct SuperHeroesRepository {
    
    init() {
        
        MarvelAPIClient.configureCredentials(
            publicKey: "bf1f5d5f088f59478a3f68324fd1face",
            privateKey: "d3fa0b1bad53d48b8bac7b9d4a02a860d24caca0")
    }
    
    func getAll(completion: @escaping SuperHeroesResult) {
        
        MarvelAPIClient.charactersAPIClient.getAll(offset: 0, limit: 100) { response in
            
            var superHeroes = [SuperHero]()
            
            if let characters = response.value?.characters {
                
                superHeroes = characters.map({ character in
                    
                    self.superHeroFromCharacter(character: character)
                })
            }
                
            DispatchQueue.main.async {
                
                completion(superHeroes)
            }
        }
    }
    
    func get(id: String, completion: @escaping SuperHeroResult) {
        
        MarvelAPIClient.charactersAPIClient.getById(id: id) { response in
            
            var superHero: SuperHero? = nil
            
            if let character = response.value {
                
                superHero = self.superHeroFromCharacter(character: character)
            }
            
            DispatchQueue.main.async {
                
                completion(superHero)
            }
        }
    }
    
    private func superHeroFromCharacter(character: CharacterDTO) -> SuperHero {
        
        let superHeroId = character.id
        let name = character.name ?? ""
        let photoUrl = character.thumbnail?.URL(variant: .fullSize) as URL?
        let description = character.description ?? ""
        
        return SuperHero(superHeroId: superHeroId, name: name, photo: photoUrl, description: description)
    }
    
}
