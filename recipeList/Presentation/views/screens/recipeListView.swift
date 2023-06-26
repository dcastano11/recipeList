//
//  ListItemView.swift
//  recipeList
//
//  Created by david on 19/06/23.
//

import SwiftUI

struct RecipeListView: View {
    
    @Inject var viewModel: RecipeListViewModel
    @ObservedObject var listViewModel: RecipeListViewModel = RecipeListViewModel()
    @State var isPresented:Bool = false
    
    init() {
        self.listViewModel = viewModel
    }
    
    var body: some View {
        
        NavigationStack{
            ZStack {
                Color.mint.opacity(0.5)
                VStack (spacing:20.0){
                    searchField
                    recipeList
                }.padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 10))
            }.navigationTitle("Recetas").background(Color.mint.opacity(0.5))
            
        }.onAppear{
            listViewModel.fetchRecipes()
        }
    }
}

extension RecipeListView{
    
    var searchField: some View{
        
        TextField(text: $listViewModel.textFieldBuffer) {
            Text("Escribe para buscar una receta")
        }.padding().background(in: RoundedRectangle(cornerRadius: 10.0))
    }
    
    
    var recipeList: some View {
        
        ScrollView {
            VStack (spacing:20){
                ForEach(listViewModel.filteredRecipes, id: \.self){recipe in
                    NavigationLink(value: recipe) {
                        RecipeListItemView(imageUrl: recipe.imageUrl, title: recipe.name)
                    }
                }
            }.padding(10).navigationDestination(for: Recipe.self) {
                recipe in
                
                
                RecipeDetailView(viewModel: RecipeDetailViewModel(recipe:recipe))
            }.frame(maxWidth: .infinity)
        }
        
    }
}

struct ListItemView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
    }
    
}
