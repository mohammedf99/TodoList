//
//  ListRowView.swift
//  TodoList
//
//  Created by Mohammed Mahmood on 04/08/2023.
//

import SwiftUI

struct ListRowView: View {
    let item: Item
    var body: some View {
        HStack {
            Image(systemName: item.isComplete ? "checkmark.circle" : "xmark.circle")
                .imageScale(.large)
                .foregroundColor(item.isComplete ? .green : .red)
            Text(item.title)
        }
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var previews: some View {
        ListRowView(item: Item(title: "hello", isComplete: false))
    }
}
