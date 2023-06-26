//
//  DetailView.swift
//  recipeList
//
//  Created by david on 20/06/23.
//

import SwiftUI

struct RecipeDetailView: View {
    
    @ObservedObject var viewModel: RecipeDetailViewModel
    
    init(viewModel: RecipeDetailViewModel) {
        self.viewModel = viewModel
        
    }
    
    var body: some View {
        ZStack {
            Color.mint.ignoresSafeArea().opacity(0.5)
            VStack {
                ScrollView {
                    VStack{
                        Spacer().frame(height:20)
                        Text(viewModel.title).font(.largeTitle)
                        Spacer().frame(height:5)
                        picture
                        showMapButton
                        description
                        Spacer()
                    }
                }
            }.padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
        }.sheet(isPresented: $viewModel.isShowingMap) {
            ZStack {
                
                MapView(lat: viewModel.coord.lat, lng: viewModel.coord.lng)
                closeButtonBar
            }
        }
    }
    
}
    
    
extension RecipeDetailView{
    
    var picture: some View {AsyncImage(url: URL(string: viewModel.imageUrl)) { image in
        image.resizable()
            .cornerRadius(8)
            .aspectRatio(contentMode: .fill)
    } placeholder: {
        ProgressView()
        
    }.padding()}
    
    var description: some View  {ZStack {
        Color.white.opacity(0.5)
        
        Text(viewModel.description).padding()
        
    }.padding()}
    
    var showMapButton: some View {
//        NavigationLink {
//            MapView()
//
//
//        } label: {
//
//                        ZStack {
//                            Color.purple
//                            Text("Ubicar en el Mapa").font(.title).bold().foregroundColor(.white)
//                        }.frame(height: 50).cornerRadius(10).padding(.horizontal,30)
//
//        }

        Button {

            viewModel.showMap()
        } label: {
            ZStack {
                Color.purple
                Text("Ubicar en el Mapa").font(.title).bold().foregroundColor(.white)
            }.frame(height: 50).cornerRadius(10).padding(.horizontal,30)
        }
    
    }
    
    var closeButtonBar: some View{
        VStack{
            HStack{
                Spacer()
                Button {
                    viewModel.dismissMap()
                } label: {
                    Image(systemName: "xmark.square.fill")
                        .resizable()
                        .foregroundColor(.purple)
                    
                        .frame(width:40.0, height: 40.0)
                        .padding()
                }
            }
            
            Spacer()
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailView(viewModel: RecipeDetailViewModel(recipe: Recipe(name: "String", imageUrl: "String", description: "String", location: Coordinates(lat: 51.1, lng: -0.17))))
    }
}
