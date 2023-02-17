//
//  User.swift
//  BudgetBliss
//
//  Created by İhsan Akbay on 21.01.2023.
//

import Foundation
import FirebaseFirestoreSwift

struct User: Identifiable, Codable {
	@DocumentID var id: String?
	var userId: String?
	var username: String?
	var email: String?
	var fullName: String?
	var transactions: [Transaction]?
}
