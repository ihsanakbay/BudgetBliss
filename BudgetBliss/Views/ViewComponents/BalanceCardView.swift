//
//  BalanceCardView.swift
//  BudgetBliss
//
//  Created by İhsan Akbay on 15.01.2023.
//

import SwiftUI

struct BalanceCardView: View {
	var body: some View {
		HStack {
			ZStack(alignment: .center) {
				GradientCard()
				VStack {
					HStack(alignment: .firstTextBaseline) {
						VStack(alignment: .leading, spacing: 8) {
							Text("Total Balance")
								.font(.subheadline)
							Text("$4,256.00")
								.bold()
								.font(.title3)
						}
						Spacer()
						Button {} label: {
							Image(systemName: ButtonIcons.menu.rawValue)
						}
					}
					.padding(20)

					Spacer()

					HStack {
						VStack(alignment: .leading, spacing: 8) {
							HStack {
								Image(systemName: ButtonIcons.income.rawValue)
									.foregroundColor(.white.opacity(0.6))
									.font(.system(size: 18, weight: .bold))
								Text("Income")
									.bold()
									.font(.headline)
							}
							Text("$2,350.00")
								.bold()
								.font(.subheadline)
						}

						Spacer()

						VStack(alignment: .trailing, spacing: 8) {
							HStack {
								Image(systemName: ButtonIcons.expense.rawValue)
									.foregroundColor(.white.opacity(0.6))
									.font(.system(size: 18, weight: .bold))
								Text("Expenses")
									.bold()
									.font(.headline)
							}
							Text("$2,350.00")
								.bold()
								.font(.subheadline)
						}
					}
					.padding(20)
				}
			}
		}
		.foregroundColor(.white)
		.frame(
			width: SCREEN_SIZE.width * 0.9,
			height: SCREEN_SIZE.height * 0.2
		)
	}
}

struct BalanceCardView_Previews: PreviewProvider {
	static var previews: some View {
		BalanceCardView()
	}
}
