//
//  Expenses.swift
//  iExpense
//
//  Created by Hubert Kuczyński on 27/10/2024.
//

import Foundation
import Observation

@Observable
class Expenses {
    var items = [ExpensesItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items"),
           let decodedItems = try? JSONDecoder().decode([ExpensesItem].self, from: savedItems) {
            items = decodedItems
        } else {
            items = []
        }
    }
}

