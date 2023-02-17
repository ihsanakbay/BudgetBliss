//
//  Transaction.swift
//  BudgetBliss
//
//  Created by İhsan Akbay on 16.01.2023.
//

import Firebase
import FirebaseFirestoreSwift
import Foundation

struct Transaction: FirebaseIdentifiable {
	@DocumentID var id: String?
	var title: String
	var amount: Double
	var category: Category
	var type: TransactionType
	var sign: String
	var date: Date
	var userID: String
	@ServerTimestamp var createdAt: Timestamp?

	enum CodingKeys: String, CodingKey {
		case id
		case title
		case amount
		case category
		case type
		case sign
		case date
		case userID = "user_id"
		case createdAt = "created_at"
	}
}

enum TransactionType: String, Codable, CaseIterable {
	case expense = "Expense"
	case income = "Income"
	case unknown = "Unknown"
}

extension Transaction {
	static var new = Transaction(
		title: "",
		amount: 0.0,
		category: .other,
		type: .unknown,
		sign: "",
		date: Date.now,
		userID: ""
	)
}
