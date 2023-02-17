//
//  TransactionService.swift
//  BudgetBliss
//
//  Created by İhsan Akbay on 22.01.2023.
//

import Foundation

struct TransactionService {
	static func get(by id: String) async -> Result<Transaction, Error> {
		do {
			let query = FirebaseService.shared.firestore
				.collection(Collections.transactions.rawValue)
				.whereField("id", isEqualTo: id)

			let data = try await FirebaseService.shared.getOne(of: Transaction.new, with: query).get()

			return .success(data)
		} catch {
			return .failure(error)
		}
	}

	static func get(for userID: String) async -> Result<[Transaction], Error> {
		do {
			let query = FirebaseService.shared.firestore
				.collection(Collections.transactions.rawValue)
				.whereField("user_id", isEqualTo: userID)

			let data = try await FirebaseService.shared.getMany(of: Transaction.new, with: query).get()
			return .success(data)
		} catch {
			return .failure(error)
		}
	}
}
