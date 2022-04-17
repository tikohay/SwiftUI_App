//
//  Expencies.swift
//  SwiftUI_App
//
//  Created by Karakhanyan Tigran on 17.04.2022.
//

import SwiftUI

struct ExpenceItem: Identifiable {
    let id = UUID()
    let name: String
    let type: String
    let amount: Int
}

class Expenses: ObservableObject {
    @Published var items: [ExpenceItem] = []
}

struct ExpenciesView: View {
    
    @ObservedObject var expenses = Expenses()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items) { item in
                    Text(item.name)
                }
                .onDelete(perform: removeItems)
            }
            .navigationBarTitle("My expenses")
            .navigationBarItems(trailing:
                                    Button(action: {
                let expense = ExpenceItem(name: "Test", type: "", amount: 80)
                self.expenses.items.append(expense)
            }, label: {
                Image(systemName: "plus")
            }))
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

struct ExpenciesView_Previews: PreviewProvider {
    static var previews: some View {
        ExpenciesView()
    }
}
