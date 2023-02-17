//
//  CustomAddButton.swift
//  BudgetBliss
//
//  Created by İhsan Akbay on 20.01.2023.
//

import SwiftUI

struct CustomAddButton: View {
	@State private var open: Bool = false
	@Binding var addExpense: Bool
	@Binding var addIncome: Bool

	var body: some View {
		ZStack {
			Button {
				self.open.toggle()
			} label: {
				Image(systemName: "plus")
					.rotationEffect(.degrees(open ? 45 : 0))
					.foregroundColor(.white)
					.font(.system(size: 24, weight: .bold))
					.animation(.spring(response: 0.2, dampingFraction: 0.4, blendDuration: 0), value: open)
			}
			.padding(16)
			.background(Color.blue)
			.mask(Circle())
			.shadow(color: .blue, radius: 10)
			.zIndex(10)

			SecondaryButton(
				open: $open,
				addExpense: $addExpense,
				addIncome: $addIncome,
				icon: ButtonIcons.income.rawValue,
				color: .green,
				type: .income,
				offsetX: -45,
				offsetY: -60
			)

			SecondaryButton(
				open: $open,
				addExpense: $addExpense,
				addIncome: $addIncome,
				icon: ButtonIcons.expense.rawValue,
				color: .red,
				type: .expense,
				offsetX: 45,
				offsetY: -60
			)
		}
	}
}

private struct SecondaryButton: View {
	@Binding var open: Bool
	@Binding var addExpense: Bool
	@Binding var addIncome: Bool

	var icon: String
	var color: Color
	var type: TransactionType
	var offsetX: Int
	var offsetY: Int
	var delay = 0.0

	var body: some View {
		Button {
			if type == .expense {
				addExpense.toggle()
				self.open.toggle()
			} else {
				addIncome.toggle()
				self.open.toggle()
			}
		} label: {
			Image(systemName: icon)
				.foregroundColor(.white)
				.font(.system(size: 24, weight: .bold))
		}
		.padding(8)
		.background(color)
		.mask(Circle())
		.offset(x: open ? CGFloat(offsetX) : 0, y: open ? CGFloat(offsetY) : 0)
		.scaleEffect(open ? 1 : 0)
		.animation(.spring(response: 0.2, dampingFraction: 0.5, blendDuration: 0).delay(Double(delay)), value: open)
	}
}

struct CustomAddButton_Previews: PreviewProvider {
	static var previews: some View {
		CustomAddButton(addExpense: .constant(false), addIncome: .constant(false))
	}
}
