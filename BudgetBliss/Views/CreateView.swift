//
//  CreateView.swift
//  BudgetBliss
//
//  Created by İhsan Akbay on 15.01.2023.
//

import Combine
import SwiftUI

struct CreateView: View {
	@Environment(\.dismiss) var dismiss
	@StateObject var viewModel = TransactionViewModel()
	@State var selectedType: TransactionType
	@State var title: String
	@State var currencySign: String

	@State private var selectedDate: Date = .now

	var body: some View {
		NavigationView {
			Form {
				Section("Transaction Info") {
					TextField("Title", text: $viewModel.transaction.title)

					HStack(spacing: 4) {
						Text(currencySign)
						CurrencyField(amount: $viewModel.transaction.amount)
					}

					DatePicker("Transaction Date: ", selection: $viewModel.transaction.date, in: ...Date(), displayedComponents: [.date])

					if #available(iOS 16.0, *) {
						Picker("Category:", selection: $viewModel.transaction.category) {
							ForEach(Category.allCases, id: \.self) { item in
								HStack(spacing: 4) {
//									Image(categoriesWithIcons[item] ?? "")
//										.resizable()
//										.frame(width: 20, height: 20)
									Text(item.rawValue.capitalized)
								}
							}
						}
						.pickerStyle(.navigationLink)
					} else {
						Picker("Category:", selection: $viewModel.transaction.category) {
							ForEach(Category.allCases, id: \.self) { value in
								HStack(spacing: 8) {
									ZStack {
										RoundedRectangle(cornerRadius: 6)
											.fill(LinearGradient(
												gradient: Gradient(
													colors: [.purple, .orange]),
												startPoint: .bottomLeading,
												endPoint: .topTrailing))
											.shadow(color: .black.opacity(0.2), radius: 10)
											.frame(width: 24, height: 24)

										Image(value.iconName)
											.renderingMode(.template)
											.resizable()
											.scaledToFit()
											.frame(width: 16, height: 16)
											.foregroundColor(.white)
									}

									Text(value.rawValue)
								}
							}
						}
					}
				}
			}
			.navigationTitle(title)
			.navigationBarTitleDisplayMode(.inline)
			.toolbar {
				ToolbarItem(placement: .navigationBarLeading) {
					Button {
						dismiss()
					} label: {
						Image(systemName: ButtonIcons.xmark.rawValue)
							.foregroundColor(.blue.opacity(0.8))
							.font(.system(size: 20, weight: .semibold))
					}
				}
				ToolbarItem(placement: .navigationBarTrailing) {
					Button {
						handleSave()
					} label: {
						Text("Save")
					}
					.disabled(viewModel.disableForm)
				}
			}
			.onAppear {
				viewModel.transaction.type = self.selectedType
			}
		}
	}

	private func handleSave() {
		viewModel.save()
		dismiss()
	}
}

struct CreateView_Previews: PreviewProvider {
	static var previews: some View {
		CreateView(viewModel: TransactionViewModel(), selectedType: .expense, title: "Add Expanse", currencySign: "$")
	}
}
