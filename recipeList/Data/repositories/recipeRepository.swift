//
//  recipeRepository.swift
//  recipeList
//
//  Created by david on 22/06/23.
//

import Foundation
import Combine

protocol RecipeRepository {
    func fetchRecipes() -> AnyPublisher<[Recipe], Error>
}

class RecipeRepositoryImpl: RecipeRepository {

    @Inject var recipeService: RecipeService
    
    func fetchRecipes() -> AnyPublisher<[Recipe], Error> {
        return recipeService.fetchRecipes()
    }
}
