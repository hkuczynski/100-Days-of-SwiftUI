//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Hubert Kuczyński on 27/10/2024.
//

import Foundation

struct ExpensesItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
