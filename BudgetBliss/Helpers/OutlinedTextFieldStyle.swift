//
//  OutlinedTextFieldStyle.swift
//  BudgetBliss
//
//  Created by İhsan Akbay on 22.01.2023.
//

import SwiftUI

struct OutlinedTextFieldStyle: TextFieldStyle {
	func _body(configuration: TextField<Self._Label>) -> some View {
		configuration
			.padding(12)
			.overlay {
				RoundedRectangle(cornerRadius: 10, style: .continuous)
					.stroke(Color(UIColor.systemGray4), lineWidth: 1)
			}
	}
}
