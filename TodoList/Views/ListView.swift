//
//  ListView.swift
//  TodoList
//
//  Created by Mohammed Mahmood on 04/08/2023.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var viewModel: ListViewModel

    var body: some View {
        
        ZStack {
            if viewModel.items.isEmpty {
                NoItemsView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            } else {
                List {
                    ForEach(viewModel.items) { item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation (.linear) {
                                    viewModel.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: viewModel.delete)
                    .onMove (perform: viewModel.move)

                }
            }
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
        Group {
            NavigationStack {
                ListView()
            }
            .environmentObject(ListViewModel())
            .preferredColorScheme(.dark)
        }
    }
}
