//
//  ListViewModel.swift
//  TodoList
//
//  Created by Mohammed Mahmood on 05/08/2023.
//

import Foundation

class ListViewModel: ObservableObject {
    
    @Published var items: [Item] = [] {
        didSet {
            saveItems()
        }
    }
    let itemsKey: String = "items_list"
    
    init() {
        getItems()
    }
    
    func getItems() {

//        items.append(contentsOf: newItems)
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([Item].self, from: data)
        else { return }
        
        self.items = savedItems
    }
    
    func delete(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func move(indexSet: IndexSet, newOffset: Int) {
        items.move(fromOffsets: indexSet, toOffset: newOffset)
    }
    
    func addItem(title: String) {
        let newItem = Item(title: title, isComplete: false)
        items.append(newItem)
    }
    
    func updateItem(item: Item) {
//        if let index = items.firstIndex (where: { existingItem in
//            existingItem.id == item.id
//        }) {
//
//        }
        
        if let index = items.firstIndex(where: {$0.id == item.id}) {
            items[index] = item.updateCompletion()
        }
    }
    
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
    
}
