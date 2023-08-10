//
//  ItemModel.swift
//  TodoList
//
//  Created by Mohammed Mahmood on 05/08/2023.
//

import Foundation

struct Item: Identifiable, Codable {
    let id: String
    let title: String
    let isComplete: Bool
    
    init(id: String = UUID().uuidString, title: String, isComplete: Bool) {
        self.id = id
        self.title = title
        self.isComplete = isComplete
    }
    
    func updateCompletion() -> Item {
        return Item(id: id, title: title, isComplete: !isComplete)
    }
    
}
