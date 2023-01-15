//
//  GradientCard.swift
//  BudgetBliss
//
//  Created by İhsan Akbay on 15.01.2023.
//

import SwiftUI

struct GradientCard: View {
	var width: CGFloat?
	var height: CGFloat?

	var body: some View {
		RoundedRectangle(cornerRadius: 20)
			.fill(LinearGradient(
				gradient: Gradient(
					colors: [.purple, .orange]),
				startPoint: .bottomLeading,
				endPoint: .topTrailing))
			.frame(width: width, height: height)
		
	}
}

struct GradientCard_Previews: PreviewProvider {
	static var previews: some View {
		GradientCard()
	}
}
