//
//  DependencyValues +.swift
//  CleanArea
//
//  Created by 최동호 on 3/31/24.
//

import ComposableArchitecture

import Foundation

extension DependencyValues {
    // database
    var databaseService: Database {
           get { self[Database.self] }
           set { self[Database.self] = newValue }
       }
    
    // searchApiResult
    var searchResult: SearchResult {
        get { self[SearchResult.self] }
        set { self[SearchResult.self] = newValue }
    }
    
    // swiftdata
    var swiftData: SwiftDataService {
        get { self[SwiftDataService.self] }
        set { self[SwiftDataService.self] = newValue }
    }
}
