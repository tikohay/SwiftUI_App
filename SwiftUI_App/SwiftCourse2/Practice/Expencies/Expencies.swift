//
//  Expencies.swift
//  SwiftUI_App
//
//  Created by Karakhanyan Tigran on 17.04.2022.
//

import SwiftUI

struct ExpenceItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Int
}

class Expenses: ObservableObject {
    
    private let key = "Items"
    
    @Published var items: [ExpenceItem] = [] {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: key)
            }
        }
    }
    
    init() {
        if let data = UserDefaults.standard.data(forKey: key) {
            let decoder = JSONDecoder()
            guard let items = try? decoder.decode([ExpenceItem].self, from: data) else { return }
            self.items = items
        }
    }
}

struct ExpenciesView: View {
    
    @State private var showingAddExpense = false
    @ObservedObject var expenses = Expenses()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items) { item in
                    VStack(alignment: .leading) {
                        Text(item.name)
                        Text(item.type)
                        Text(String(item.amount))
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationBarTitle("My expenses")
            .navigationBarItems(trailing:
                                    Button(action: {
                showingAddExpense = true
            }, label: {
                Image(systemName: "plus")
            }) .sheet(isPresented: $showingAddExpense, content: {
                AddView(expenses: expenses)
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
