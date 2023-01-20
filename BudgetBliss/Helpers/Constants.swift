//
//  Constants.swift
//  BudgetBliss
//
//  Created by İhsan Akbay on 16.01.2023.
//

import SwiftUI

let SCREEN_SIZE = UIScreen.main.bounds.size

// MARK: Icons

enum ButtonIcons: String {
	case income = "arrow.down.circle.fill"
	case expense = "arrow.up.circle.fill"
	case home = "house"
	case dashnoard = "chart.pie"
	case wallet = "creditcard"
	case profile = "person.fill"
	case menu = "ellipsis"
	case xmark = "xmark"
}

// MARK: Tabbar items

enum Tab: String {
	case home = "Home"
	case dashboard = "Dashboard"
	case add = "Add"
	case wallet = "My Wallets"
	case profile = "My Profile"
}

// MARK: Titles

enum Titles: String {
	case addIncome = "Add Income"
	case addExpense = "Add Expense"
	case income = "Income"
	case expense = "Expense"
}
