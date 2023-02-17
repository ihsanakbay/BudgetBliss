//
//  TransactionRowView.swift
//  BudgetBliss
//
//  Created by İhsan Akbay on 22.01.2023.
//

import SwiftUI

struct TransactionRowView: View {
	var transaction: Transaction

	var dateFormatter: DateFormatter {
		let formatter = DateFormatter()
		formatter.dateStyle = .medium
		formatter.locale = Locale.current
		return formatter
	}

	var body: some View {
		HStack {
			VStack(alignment: .leading, spacing: 4) {
				Text(transaction.title)
					.font(.headline)
					.foregroundColor(.primary)
				Text(dateFormatter.string(from: transaction.date))
					.font(.footnote)
					.foregroundColor(.secondary)
			}
			Spacer()
			CurrencyLabel(
				price: transaction.amount,
				sign: transaction.sign,
				type: transaction.type
			)
		}
	}
}


struct TransactionRowView_Previews: PreviewProvider {
    static var previews: some View {
		TransactionRowView(transaction: Transaction.new)
    }
}
