//
//  HomeView.swift
//  BudgetBliss
//
//  Created by İhsan Akbay on 15.01.2023.
//

import SwiftUI

struct HomeView: View {
	@StateObject var viewModel: TransactionListViewModel
	@State private var showAlert = false

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
				ForEach(viewModel.transactions, id: \.id) { transaction in
					TransactionRowView(transaction: transaction)
						.listRowSeparator(.hidden)
						.listSectionSeparator(.hidden)
				}
			}
			.refreshable {
				viewModel.handleRefresh()
			}
			.listStyle(.plain)
		}
		.onAppear(perform: {
			viewModel.listen(for: "")
		})
		.onReceive(viewModel.$error, perform: { error in
			if error != nil {
				showAlert.toggle()
			}
		})
		.alert(isPresented: $showAlert) {
			Alert(title: Text("Error"),
			      message: Text(viewModel.error?.localizedDescription ?? "Something went wrong. Please try again later")
			)
		}
		.padding(.vertical)
	}
}

struct HomeView_Previews: PreviewProvider {
	static var previews: some View {
		HomeView(viewModel: TransactionListViewModel())
	}
}
