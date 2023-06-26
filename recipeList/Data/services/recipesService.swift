//
//  recipesService.swift
//  recipeList
//
//  Created by david on 22/06/23.
//

import Foundation
import Combine

protocol RecipeService{
    var urlString:String {get}
    func fetchRecipes() -> AnyPublisher<[Recipe], Error>
}

class RecipeServiceImpl:RecipeService {
    
    var urlString:String
    
    init(serviceUrl:String) {
        self.urlString = serviceUrl
    }
        
    func fetchRecipes() -> AnyPublisher<[Recipe], Error> {
        guard let url = URL(string: self.urlString) else {
            return Fail(error: NSError(domain: "Invalid URL", code: 0, userInfo: nil))
                .eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: [Recipe].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
           
    }
}

class RecipeServiceMock:RecipeService {
    
    var urlString:String
    
    init(serviceUrl:String) {
        self.urlString = serviceUrl
    }
    
    func fetchRecipes() -> AnyPublisher<[Recipe], Error> {
        guard let _ = URL(string: self.urlString) else {
            return Fail(error: NSError(domain: "Invalid URL", code: 0, userInfo: nil))
                .eraseToAnyPublisher()
        }
        return mockDataTaskPublisher()
            .decode(type: [Recipe].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func mockDataTaskPublisher() -> AnyPublisher<Data, Error> {
        guard let url = Bundle.main.url(forResource: "recipes", withExtension: "json") else {
            return Fail(error: NSError(domain: "MockError", code: 0, userInfo: nil))
                .eraseToAnyPublisher()
        }
        
        do {
            let data = try Data(contentsOf: url)
            return Just(data)
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        } catch {
            return Fail(error: error)
                .eraseToAnyPublisher()
        }
    }
}




