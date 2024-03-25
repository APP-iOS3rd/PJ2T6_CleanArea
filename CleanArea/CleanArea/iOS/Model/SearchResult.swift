//
//  SearchResult.swift
//  CleanArea
//
//  Created by 최동호 on 3/25/24.
//

import ComposableArchitecture

import Foundation

struct SearchResult {
    var fetch: (URL) async throws -> [YouthPolicy]
}

extension SearchResult: DependencyKey {
    static let liveValue = Self(
        fetch: { url in
            let (data, error) = try await URLSession.shared
                .data(from: url)
   
            let decoder = JSONDecoder()
            
            let results = try decoder.decode([YouthPolicy].self, from: data)
 
            return results
        }
    )
}

extension DependencyValues {
    var searchResult: SearchResult {
        get { self[SearchResult.self] }
        set { self[SearchResult.self] = newValue }
    }
}
