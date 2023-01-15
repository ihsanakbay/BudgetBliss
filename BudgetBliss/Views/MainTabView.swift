//
//  MainTabView.swift
//  BudgetBliss
//
//  Created by İhsan Akbay on 15.01.2023.
//

import SwiftUI

struct MainTabView: View {
	@State private var currentTab: Tab = .home

	var body: some View {
		TabView(selection: $currentTab) {
			NavigationView {
				HomeView()
					.navigationTitle("Home")
					.navigationBarTitleDisplayMode(.inline)
			}
			.modifier(TabBarItemModifier(
				icon: "house",
				tab: .home))

			NavigationView {
				DashboardView()
					.navigationTitle("Dashboard")
					.navigationBarTitleDisplayMode(.inline)
			}
			.modifier(TabBarItemModifier(
				icon: "chart.pie",
				tab: .dashboard))

			NavigationView {
				CreateView()
					.navigationTitle("Add")
					.navigationBarTitleDisplayMode(.inline)
			}
			.modifier(TabBarItemModifier(
				icon: "plus.app",
				tab: .add))

			NavigationView {
				WalletView()
					.navigationTitle("My Wallet")
					.navigationBarTitleDisplayMode(.inline)
			}
			.modifier(TabBarItemModifier(
				icon: "creditcard",
				tab: .wallet))

			NavigationView {
				ProfileView()
					.navigationTitle("My Profile")
					.navigationBarTitleDisplayMode(.inline)
			}
			.modifier(TabBarItemModifier(
				icon: "person.fill",
				tab: .add))
		}
	}
}

// MARK: Tabbar items

enum Tab: String {
	case home = "Home"
	case dashboard = "Dashboard"
	case add = "Add"
	case wallet = "Wallet"
	case profile = "Profile"
}

// MARK: View modifiers

struct TabBarItemModifier: ViewModifier {
	let icon: String
	let tab: Tab

	func body(content: Content) -> some View {
		content
			.tabItem {
				Image(systemName: icon)
			}
			.tag(tab)
	}
}

struct MainView_Previews: PreviewProvider {
	static var previews: some View {
		MainTabView()
	}
}
