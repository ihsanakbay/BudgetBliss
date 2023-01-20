//
//  NumberFormatter+Extension.swift
//  BudgetBliss
//
//  Created by İhsan Akbay on 17.01.2023.
//

import Foundation

extension NumberFormatter {
	static func currencyFormatter(currency: String) -> NumberFormatter {
		let formatter = NumberFormatter()
		formatter.numberStyle = .currency
		formatter.currencySymbol = currency
		formatter.maximumFractionDigits = 2
		return formatter
	}
}
