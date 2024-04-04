//
//  SwiftDataService.swift
//  CleanArea
//
//  Created by 최동호 on 3/31/24.
//

import ComposableArchitecture

import SwiftUI
import SwiftData


struct SwiftDataService {
    @Query private var items: [YouthPolicy]
    
    var add: (YouthPolicy) throws -> Void
    var delete: (YouthPolicy) throws -> Void
    var fetch: () throws -> [YouthPolicy]
    
    enum SwiftDataError: Error {
        case addError
        case deleteError
        case fetchError
    }
}

extension SwiftDataService: DependencyKey {
    static let liveValue = Self(
        add: { item in
            do {
                @Dependency(\.databaseService.context) var context
                let itemContext = try context()
                itemContext.insert(item)
            } catch {
                throw SwiftDataError.addError
            }
        },
        delete: { item in
            do {
                @Dependency(\.databaseService.context) var context
                let itemContext = try context()
                itemContext.delete(item)
            } catch {
                throw SwiftDataError.deleteError
            }
        },
        fetch: {
            do {
                @Dependency(\.databaseService.context) var context
                let itemContext = try context()
                let descriptor = FetchDescriptor<YouthPolicy>()
                return try itemContext.fetch(descriptor)
            } catch {
                throw SwiftDataError.fetchError
            }
        }
    )
}
