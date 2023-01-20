//
//  GradientCard.swift
//  BudgetBliss
//
//  Created by İhsan Akbay on 15.01.2023.
//

import SwiftUI

struct GradientCard: View {
	var body: some View {
		RoundedRectangle(cornerRadius: 24)
			.fill(LinearGradient(
				gradient: Gradient(
					colors: [.purple, .orange]),
				startPoint: .bottomLeading,
				endPoint: .topTrailing))
			.shadow(color: .black.opacity(0.2), radius: 10)
	}
}

struct GradientCard_Previews: PreviewProvider {
	static var previews: some View {
		GradientCard()
	}
}
