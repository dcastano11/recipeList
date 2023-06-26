//
//  UseCases.swift
//  recipeList
//
//  Created by david on 22/06/23.
//

import Foundation
import Combine

protocol FetchRecipesUseCase {
    func fetchRecipes() -> AnyPublisher<[Recipe], Error>
}

class FetchRecipesUseCaseImpl: FetchRecipesUseCase {
    @Inject private var recipeRepository: RecipeRepository
    
    func fetchRecipes() -> AnyPublisher<[Recipe], Error> {
        return recipeRepository.fetchRecipes()
    }
}

