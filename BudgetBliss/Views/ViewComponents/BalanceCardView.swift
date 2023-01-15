//
//  BalanceCardView.swift
//  BudgetBliss
//
//  Created by İhsan Akbay on 15.01.2023.
//

import SwiftUI

struct BalanceCardView: View {
	var body: some View {
		GeometryReader { geometry in
			VStack {
				HStack(alignment: .center) {
					Spacer()
					ZStack(alignment: .center) {
						GradientCard(
							width: geometry.size.width * 0.75,
							height: geometry.size.height * 0.25
						)
					}
					Spacer()
				}
			}
		}
	}
}

struct BalanceCardView_Previews: PreviewProvider {
	static var previews: some View {
		BalanceCardView()
	}
}
