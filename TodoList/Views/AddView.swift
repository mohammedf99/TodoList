//
//  AddView.swift
//  TodoList
//
//  Created by Mohammed Mahmood on 04/08/2023.
//

import SwiftUI

struct AddView: View {
    @State var newItem: String = ""
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type new item...", text: $newItem)
                    .padding(.horizontal)
                    .frame(height: 50)
                    .background(Color(UIColor.systemGray6))
                    .cornerRadius(10)
                Button {
                    
                } label: {
                    Text("Add item")
                        .font(.headline)
                        .frame(width: 380, height: 50)
                        .foregroundColor(.white)
                        .background(.blue)
                        .cornerRadius(10)
                        .padding(.vertical, 8)
                }

            }
            .padding(.horizontal)
        }
        .navigationTitle("Add new item ✏️")
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            AddView()
        }
    }
}
