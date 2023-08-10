//
//  AddView.swift
//  TodoList
//
//  Created by Mohammed Mahmood on 04/08/2023.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.dismiss) var dismiss
    @State var newItem: String = ""
    @EnvironmentObject var viewModel: ListViewModel
    var countLetter: Bool {
        newItem.count < 3
    }
    var body: some View {
        ScrollView {
            VStack (spacing: 16) {
                TextField("Type new item...", text: $newItem)
                    .padding(.horizontal)
                    .frame(height: 50)
                    .background(Color(UIColor.systemGray6))
                    .cornerRadius(10)
                    .autocorrectionDisabled()
                Button {
                    viewModel.addItem(title: newItem)
                    dismiss()
                } label: {
                    Text("Add item")
                        .font(.headline)
                        .frame(width: 380, height: 50)
                        .foregroundColor(.white)
                        .background(countLetter ? .blue.opacity(0.5) : .blue)
                        .cornerRadius(10)
                }
                .disabled(countLetter)
                
                Text("Your title should be more than 3 letters")
                    .font(.subheadline)
                    .foregroundColor(.red)
                    .opacity(countLetter ? 1.0 : 0.0)
                    .frame(width: 380, alignment: .leading)
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
                .environmentObject(ListViewModel())
        }
    }
}
