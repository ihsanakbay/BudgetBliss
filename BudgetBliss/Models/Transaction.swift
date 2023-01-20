//
//  Transaction.swift
//  BudgetBliss
//
//  Created by İhsan Akbay on 16.01.2023.
//

import Foundation

struct Transaction: Identifiable, Codable {
	let id: UUID
	let title: String
	let amount: Double
	let category: String
	let type: TransactionType
	let sign: String
	let date: Date
}

enum TransactionType: String, Codable, CaseIterable {
	case expense = "Expense"
	case income = "Income"
}
