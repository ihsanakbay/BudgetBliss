//
//  CurrencyLabel.swift
//  BudgetBliss
//
//  Created by İhsan Akbay on 17.01.2023.
//

import SwiftUI

struct CurrencyLabel: View {
	let price: Double
	let sign: String
	let type: TransactionType
	let formatter: NumberFormatter

	init(price: Double, sign: String, type: TransactionType) {
		self.price = price
		self.sign = sign
		self.type = type
		self.formatter = NumberFormatter.currencyFormatter(currency: sign)
	}

	var body: some View {
		let value = formatter.string(from: NSNumber(value: price))!
		if type == .expense {
			Text("-\(value)")
				.foregroundColor(.red)
				.bold()
		} else {
			Text(value)
				.foregroundColor(.green)
				.bold()
		}
	}
}

struct CurrencyLabel_Previews: PreviewProvider {
	static var previews: some View {
		CurrencyLabel(price: 450.00, sign: "$", type: .expense)
	}
}
