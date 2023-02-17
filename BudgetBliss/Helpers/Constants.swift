//
//  Constants.swift
//  BudgetBliss
//
//  Created by İhsan Akbay on 16.01.2023.
//

import Firebase
import SwiftUI

let SCREEN_SIZE = UIScreen.main.bounds.size

// MARK: Categories

enum Category: String, Codable, CaseIterable {
	case grocery = "Grocery"
	case food = "Food"
	case bill = "Bills"
	case receipt = "Receipt"
	case salary = "Salary"
	case investment = "Investment"
	case education = "Education"
	case health = "Health"
	case electricity = "Electricity"
	case water = "Water Bill"
	case internet = "Internet"
	case electronics = "Electronics"
	case entertainment = "Entertainment"
	case drinks = "Drinks"
	case mortgage = "Mortgage"
	case rent = "Rent"
	case gas = "Gas"
	case vacation = "Vacation"
	case repairs = "Repairs"
	case clothes = "Clothes"
	case personalCare = "Personal Care"
	case selfDevelopment = "Self Development"
	case pet = "Pet"
	case other = "Other"
}

// MARK: Icons

extension Category {
	var iconName: String {
		switch self {
		case .grocery:
			return "basket"
		case .food:
			return "chicken"
		case .bill:
			return "bill"
		case .receipt:
			return "receipt"
		case .salary:
			return "wallet"
		case .investment:
			return "investment"
		case .education:
			return "graduate"
		case .health:
			return "hospital"
		case .gas:
			return "gas"
		case .electricity:
			return "power"
		case .water:
			return "waterdrop"
		case .internet:
			return "wifi"
		case .electronics:
			return "devices"
		case .entertainment:
			return "game"
		case .drinks:
			return "alcohol1"
		case .vacation:
			return "beach"
		case .mortgage:
			return "mortgage"
		case .rent:
			return "rent"
		case .personalCare:
			return "hair-dryer"
		case .repairs:
			return "hammer"
		case .clothes:
			return "clothes"
		case .selfDevelopment:
			return "book"
		case .pet:
			return "pets"
		case .other:
			return "question"
		}
	}
}

enum ButtonIcons: String {
	case income = "arrow.down.circle.fill"
	case expense = "arrow.up.circle.fill"
	case home = "house"
	case dashnoard = "chart.pie"
	case wallet = "creditcard"
	case profile = "person.fill"
	case menu = "ellipsis"
	case xmark = "xmark.circle.fill"
	case create = "plus.app.fill"
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
