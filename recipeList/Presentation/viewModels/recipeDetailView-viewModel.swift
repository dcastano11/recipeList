//
//  recipeDetailView-viewModel.swift
//  recipeList
//
//  Created by david on 21/06/23.
//

import Foundation

class RecipeDetailViewModel: ObservableObject{
    
   
    @Published var coord:Coordinates
    @Published var imageUrl: String = "https://www.corriecooks.com/wp-content/uploads/2019/10/instant-pot-beef-and-broccoli-new-e1573401783989.jpg"
    @Published var title: String = "Instant Pot Broccolli"
    @Published var description: String =
                    """
                    This recipe requires thin-sliced beef (so it will release all its flavor during the saute step).
                            
                    My best advice is just ask your butcher to do it for you :]
                            
                    But if you wanna do it yourself, here are a few tricks: First, make sure to cut against the grain - this cuts the muscle fibers and makes the meat less chewy. If you feel your slices won’t be even or that the cut won’t be as clean as you want it to be, stick the meat in the freezer for 15 to 20 minutes. Cold meat cuts better than meat at room temperature.)
                    """
    @Published var isShowingMap: Bool = false
    //@Published var recipe: Recipe
    
    init(recipe: Recipe/*,imageUrl:String, title:String, description: String*/) {
        
        self.imageUrl = recipe.imageUrl
        self.title = recipe.name
        self.description = recipe.description
        self.coord = recipe.location
        
    }
    
    func showMap(){
        isShowingMap = true
    }
    
    func dismissMap(){
        isShowingMap = false
    }
    
}
