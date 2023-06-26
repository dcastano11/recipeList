//
//  ListViewModel.swift
//  recipeList
//
//  Created by david on 20/06/23.
//

import Foundation
import Combine

class RecipeListViewModel: ObservableObject{
    
    @Inject private var fetchRecipesUseCase: FetchRecipesUseCase
    private var cancellables = Set<AnyCancellable>()
   
    @Published var filteredRecipes = [Recipe]()
    @Published var recipes:[Recipe] = []
    @Published var textFieldBuffer:String = ""
    {didSet{filterRecipes(searchWord: textFieldBuffer)}}
      
    func filterRecipes(searchWord:String?){
        if let word = searchWord, word != "" {
            filteredRecipes = recipes.filter { recipe in
                recipe.name.lowercased().contains(word.lowercased())
            }
        }
        else{filteredRecipes = recipes}
    }
    
    func fetchRecipes() {
        fetchRecipesUseCase.fetchRecipes()
            .sink(receiveCompletion: { completion in
                switch(completion){
                    case .finished:
                        print(completion)
                    case .failure(let error):
                        print(error)
                }
                // Handle completion if needed
            }, receiveValue: { [weak self] recipes in
                self?.recipes = recipes
                self?.filterRecipes(searchWord: "")
            })
            .store(in: &cancellables)
    }
}
