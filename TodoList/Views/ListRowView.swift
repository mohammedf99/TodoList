//
//  ListRowView.swift
//  TodoList
//
//  Created by Mohammed Mahmood on 04/08/2023.
//

import SwiftUI

struct ListRowView: View {
    let title: String
    var body: some View {
        HStack {
            Image(systemName: "checkmark.circle")
                .imageScale(.large)
            Text(title)
        }
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var previews: some View {
        ListRowView(title: "This is the first todo!")
    }
}
