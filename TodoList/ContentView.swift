//
//  ContentView.swift
//  TodoList
//
//  Created by Mohammed Mahmood on 04/08/2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some View {
        NavigationStack {
            ListView()
        }
        .environmentObject(listViewModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
