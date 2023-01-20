//
//  HomeView.swift
//  BudgetBliss
//
//  Created by İhsan Akbay on 15.01.2023.
//

import SwiftUI

let dummyData = [
	Transaction(id: UUID(), title: "Test 1", amount: 100.5, category: "Meal", type: .expense, sign: "$", date: Date()),
	Transaction(id: UUID(), title: "Test 2", amount: 1500.50, category: "Rent", type: .expense, sign: "$", date: Date()),
	Transaction(id: UUID(), title: "Test 3", amount: 8000, category: "Salary", type: .income, sign: "$", date: Date().addingTimeInterval(-86400))
]

let groupedItems = Dictionary(grouping: dummyData) { item -> Date in
	Calendar.current.startOfDay(for: item.date)
}

struct HomeView: View {
	var dateFormatter: DateFormatter {
		let formatter = DateFormatter()
		formatter.dateStyle = .medium
		formatter.locale = Locale.current
		return formatter
	}

	var body: some View {
		VStack {
			BalanceCardView()

			HStack {
				Text("Transactions")
					.bold()
					.font(.headline)
				Spacer()
			}
			.padding(.horizontal, 20)
			.padding(.top, 20)

			List {
				ForEach(groupedItems.keys.sorted(), id: \.self) { date in
					Section {
						ForEach(groupedItems[date]!, id: \.id) { data in
							HStack {
								VStack(alignment: .leading, spacing: 4) {
									Text(data.title)
										.font(.headline)
										.foregroundColor(.primary)
									Text(dateFormatter.string(from: data.date))
										.font(.footnote)
										.foregroundColor(.secondary)
								}
								Spacer()
								CurrencyLabel(
									price: data.amount,
									sign: data.sign,
									type: data.type
								)
							}
						}
					} header: {
						Text(dateFormatter.string(from: date))
					}
					.listRowSeparator(.hidden)
					.listSectionSeparator(.hidden)
				}
			}
			.listStyle(.plain)
		}
		.padding(.vertical)
	}
}

struct HomeView_Previews: PreviewProvider {
	static var previews: some View {
		HomeView()
	}
}
