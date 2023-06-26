//
//  RecipeListItemView.swift
//  recipeList
//
//  Created by david on 20/06/23.
//

import SwiftUI


struct RecipeListItemView: View {
    
    let imageUrl: String
    let title: String
    @State private var textSize:CGSize = CGSize(width: 200, height: 200)
    
    
    var body: some View{
        
        return ZStack {
            GeometryReader { metrics in
                Color.white
                Color.orange.opacity(0.3)
                VStack (alignment:.center){
                    //Spacer()
                    image.frame(height: metrics.size.height * 0.7)
                    //Spacer().frame(height:  metrics.size.height * 0.1)
                    titleWidget.frame(width: .infinity, height: metrics.size.height * 0.25)
                    //Spacer().frame(height:  metrics.size.height * 0.1)
                }.frame(width: metrics.size.width)
            }.frame(height: UIScreen.main.bounds.size.width * 0.7).cornerRadius(10).shadow(radius: 3)
        }
    }
    
    var titleWidget: some View {
        VStack {
            
            Spacer()
            
            if UIDevice.current.userInterfaceIdiom == .pad{
                Text(title)
                    .lineLimit(2)
                    .font(.system(size: 60, weight: .bold))
                    .fixedSize(horizontal: false, vertical: true)
                    .scaledToFit()
                    .foregroundColor(.purple).padding(EdgeInsets(top: 5, leading: 1, bottom: 10, trailing: 1)).padding(.horizontal, 20)
                    .multilineTextAlignment(.center)
            }else{
                Text(title)
                    .lineLimit(2)
                    .font(.system(size: 20, weight: .bold))
                    .fixedSize(horizontal: false, vertical: true) // Prevents text truncating
                    .foregroundColor(.purple).padding(EdgeInsets(top: 5, leading: 1, bottom: 10, trailing: 1)).padding(.horizontal, 20)
                    .multilineTextAlignment(.center)
                
            }
 
            Spacer()
            
        }.frame(maxWidth: .infinity, alignment: .center)
    }
    
    var image: some View {
        AsyncImage(url: URL(string: imageUrl), transaction:Transaction(animation: .easeInOut))
        { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image
                    .resizable()
                    .cornerRadius(8)
                    .opacity(0.8)
                    .frame(width: UIScreen.main.bounds.size.width * 0.7)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(.pink, lineWidth: 5)
                    )
            case .failure:
                Image(systemName: "fork.knife.circle.fill").resizable()
                    .cornerRadius(8)
                    .opacity(0.8)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: UIScreen.main.bounds.size.width * 0.5)
                
                    .foregroundColor(.pink).opacity(0.6)
                
            @unknown default:
                EmptyView()
            }}.padding(EdgeInsets(top: 20, leading: 0, bottom: 1, trailing: 0))}
    
    
}

struct RecipeListItemView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListItemView(imageUrl: "https://www.allrecipes.com/thmb/66r-AkzxJGNQH7L3sabgSQnfKZU=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/4986046-2000-b52a6a17c30849edb8e8d41524aab38c.jp",title:"Colombian Arepas hgkhgjhgkjhgkjhg")
    }
}
