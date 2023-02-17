//
//  TransactionListViewModel.swift
//  BudgetBliss
//
//  Created by İhsan Akbay on 21.01.2023.
//

import Foundation

protocol TransactionListable: ObservableObject {
	var transactions: [Transaction] { get set }
	var error: Error? { get set }

	func fetchTransactions() async throws
}

final class TransactionListViewModel: TransactionListable {
	@Published var transactions: [Transaction] = []
	@Published var error: Error?

	init() {
//		loadData()
		listen(for: "")
	}
}

extension TransactionListViewModel {
	@MainActor
	func fetchTransactions() async throws {
		do {
			let result = try await TransactionService.get(for: "user_id").get()
			transactions = result
		} catch {
			self.error = error
		}
	}

	func listen(for userID: String) {
		FirebaseService.shared.firestore
			.collection(Collections.transactions.rawValue)
			.whereField("user_id", isEqualTo: userID)
			.addSnapshotListener { querySnapshot, error in
				guard let documents = querySnapshot?.documents else { return }
				self.transactions = documents.compactMap { queryDocumentSnapshot -> Transaction? in
					try? queryDocumentSnapshot.data(as: Transaction.self)
				}
			}
	}

	func loadData() {
		Task {
			try await fetchTransactions()
		}
	}

	func handleRefresh() {
		transactions.removeAll()
//		loadData()
		listen(for: "")
	}
}
