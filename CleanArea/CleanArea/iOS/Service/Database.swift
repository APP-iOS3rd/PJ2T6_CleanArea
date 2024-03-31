//
//  Database.swift
//  CleanArea
//
//  Created by 최동호 on 3/31/24.
//

import ComposableArchitecture

import Foundation
import SwiftData

// MARK: - Model Context
fileprivate let itemModelContext: ModelContext = {
    let schema = Schema([
        YouthPolicy.self,
    ])
    let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
    do {
        let container = try ModelContainer(for: schema, configurations: [modelConfiguration])
        return ModelContext(container)
    } catch {
        fatalError("Could not create ModelContainer: \(error)")
    }
}()


// MARK: - SwiftData 를 사용한 Database
struct Database {
    var context: () throws -> ModelContext
}

extension Database: DependencyKey {
    public static let liveValue = Self(
        context: { itemModelContext }
    )
}
