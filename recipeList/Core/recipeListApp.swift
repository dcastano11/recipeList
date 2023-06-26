//
//  recipeListApp.swift
//  recipeList
//
//  Created by david on 19/06/23.
//

import SwiftUI
import MapKit

@main
struct recipeListApp: App {
    init() {
        //@Provider var recipeService = RecipeServiceImpl(serviceUrl: "https://demo4792793.mockable.io/recipes") as RecipeService
        @Provider var recipeService = RecipeServiceMock(serviceUrl: "https://demo4792793.mockable.io/recipes") as RecipeService
        
        @Provider var recipeRepository = RecipeRepositoryImpl() as RecipeRepository
        @Provider var fetchRecipeUseCase = FetchRecipesUseCaseImpl() as FetchRecipesUseCase
        @Provider var recipeListViewModel = RecipeListViewModel()
    }
    var body: some Scene {
        
        WindowGroup {
            
            RecipeListView()
            //MapView()
            
        }
    }
}


