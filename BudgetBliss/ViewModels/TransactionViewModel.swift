//
//  TransactionViewModel.swift
//  BudgetBliss
//
//  Created by İhsan Akbay on 21.01.2023.
//

import Foundation
import Combine

protocol TransactionViewModelProtocol {
	var transaction: Transaction { get set }
	var error: Error? { get set }
	var modified: Bool { get set }
}

@MainActor
final class TransactionViewModel: ObservableObject {
	@Published var transaction: Transaction = .new
	@Published var error: Error?
	@Published var modified: Bool = false

	private var cancellables = Set<AnyCancellable>()

	var disableForm: Bool {
		transaction.title.isEmpty ||
		transaction.amount == 0.00
	}
	
}

extension TransactionViewModel {
	@MainActor
	func create(transaction: Transaction) async throws {
		do {
			let result = try await transaction.post(to: Collections.transactions.rawValue).get()
			self.transaction = result
		} catch {
			self.error = error
		}
	}
	
	func save() {
		Task {
			try await create(transaction: transaction)
		}
	}
}
