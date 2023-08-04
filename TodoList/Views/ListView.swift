//
//  ListView.swift
//  TodoList
//
//  Created by Mohammed Mahmood on 04/08/2023.
//

import SwiftUI

struct ListView: View {
    var body: some View {
        List {
            ListRowView(title: "This is the first todooo!")
            ListRowView(title: "This is the first todooo!")
            ListRowView(title: "This is the first todooo!")
        }
        .navigationTitle("Todo List 📝")
        .toolbar {
            ToolbarItem (placement: .navigationBarLeading) {
                EditButton()
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink("Add", destination: AddView())
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ListView()
        }
    }
}
