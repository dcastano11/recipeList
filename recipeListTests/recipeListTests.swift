//
//  recipeListTests.swift
//  recipeListTests
//
//  Created by david on 19/06/23.
//
import Combine
import XCTest
import SwiftUI
@testable import recipeList

final class recipeListTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() throws {
        
        let service = RecipeServiceImpl(serviceUrl: "https://demo4792793.mockable.io/recipes")
        var cancellables = Set<AnyCancellable>()
        let expectation = XCTestExpectation(description: "Network request expectation")
        
        //recipeRepository.fetchRecipes()
        service.fetchRecipes()
            .sink(receiveCompletion: { completion in
                switch(completion){
                    case .finished:
                        print(completion)
                        expectation.fulfill()
                    case .failure(let error):
                        print(error)
                }
                // Handle completion if needed
            }, receiveValue: { recipes in
                print(recipes)
                XCTAssertNotNil(recipes)
                XCTAssertTrue(recipes is [Recipe])
               
            })
            .store(in: &cancellables)
        wait(for: [expectation], timeout: 15.0)
        
    }
    
    func testExample2() throws {
        
        let service = RecipeServiceMock(serviceUrl: "https://demo4792793.mockable.io/recipes")
        var cancellables = Set<AnyCancellable>()
        let expectation = XCTestExpectation(description: "Network request expectation")
        
        //recipeRepository.fetchRecipes()
        service.fetchRecipes()
            .sink(receiveCompletion: { completion in
                switch(completion){
                    case .finished:
                        print(completion)
                        expectation.fulfill()
                    case .failure(let error):
                        print(error)
                }
                // Handle completion if needed
            }, receiveValue: { recipes in
                print(recipes)
                XCTAssertNotNil(recipes)
                XCTAssertTrue(recipes is [Recipe])
               
            })
            .store(in: &cancellables)
        wait(for: [expectation], timeout: 15.0)
        
    }


}
