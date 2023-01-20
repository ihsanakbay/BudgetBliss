//
//  CreateView.swift
//  BudgetBliss
//
//  Created by İhsan Akbay on 15.01.2023.
//

import SwiftUI

struct CreateView: View {
	@Environment(\.dismiss) var dismiss
	@State var selectedType: TransactionType
	@State var title: String

	@State private var selectedDate: Date = .now

	var body: some View {
		VStack {
			HStack(alignment: .center, spacing: 8) {
				Button {
					dismiss()
				} label: {
					Image(systemName: ButtonIcons.xmark.rawValue)
						.font(.system(size: 24))
						.foregroundColor(.black)
				}
				.padding(.leading, 8)
				Spacer()
				Text(title)
					.font(.system(size: 18, weight: .semibold))
				Spacer()
				Button {
					dismiss()
				} label: {
					Image(systemName: ButtonIcons.xmark.rawValue)
						.font(.system(size: 24))
						.foregroundColor(.black)
				}
				.padding(.trailing, 8)
				.hidden()
			}
			.padding()
			
			Spacer()
		}
	}
}

struct CreateView_Previews: PreviewProvider {
	static var previews: some View {
		CreateView(selectedType: .expense, title: "Add Expanse")
	}
}
