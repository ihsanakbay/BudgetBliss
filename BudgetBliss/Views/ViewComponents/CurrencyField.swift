//
//  CurrencyField.swift
//  BudgetBliss
//
//  Created by İhsan Akbay on 22.01.2023.
//

import SwiftUI

struct CurrencyField: View {
	@Binding var amount: Double

	let currencyFormatter: NumberFormatter = {
		let formatter = NumberFormatter()
		formatter.numberStyle = .currency
		formatter.maximumFractionDigits = 2
		formatter.currencySymbol = ""
		return formatter
	}()

	var body: some View {
		TextField("Enter Amount", value: $amount, formatter: currencyFormatter)
			.keyboardType(.decimalPad)
	}
}

struct CurrencyField_Previews: PreviewProvider {
	static var previews: some View {
		CurrencyField(amount: .constant(0.00))
	}
}
