//
//  NoItemsView.swift
//  TodoList
//
//  Created by Mohammed Mahmood on 09/08/2023.
//

import SwiftUI

struct NoItemsView: View {
    
    @State var animate: Bool = false
    
    var body: some View {
            VStack(spacing: 10) {
                Text("You have no items...")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Are you a productive person?")
                NavigationLink {
                    AddView()
                } label: {
                    Text("Add something 🥳")
                        .padding(8)
                        .font(.headline)
                        .foregroundColor(animate ? .blue : .green)
                        .overlay {
                            RoundedRectangle(cornerRadius: 15)
                                .stroke()
                                .foregroundColor(animate ? .blue : .green)
                                .frame(width: animate ? 250 : 175)
                        }
                        .scaleEffect(animate ? 1.1 : 0.9)

                }
            }
            .padding(40)
            .onAppear(perform: addAnimation)
    }
    
    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation (Animation.easeInOut(duration: 2.0).repeatForever()) {
                animate.toggle()
            }
        }
        
    }
}

struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            NoItemsView()
        }
    }
}
