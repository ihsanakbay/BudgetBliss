//
//  MainTabView.swift
//  BudgetBliss
//
//  Created by İhsan Akbay on 15.01.2023.
//

import SwiftUI

struct MainTabView: View {
	@State private var currentTab: Tab = .home
	@State private var addExpense: Bool = false
	@State private var addIncome: Bool = false

	var body: some View {
		ZStack {
			TabView(selection: $currentTab) {
				NavigationView {
					HomeView()
						.navigationTitle(Tab.home.rawValue)
						.navigationBarTitleDisplayMode(.inline)
				}
				.modifier(TabBarItemModifier(
					icon: ButtonIcons.home.rawValue,
					tab: .home))

				NavigationView {
					DashboardView()
						.navigationTitle(Tab.dashboard.rawValue)
						.navigationBarTitleDisplayMode(.inline)
				}
				.modifier(TabBarItemModifier(
					icon: ButtonIcons.dashnoard.rawValue,
					tab: .dashboard))

				Spacer()

				NavigationView {
					WalletView()
						.navigationTitle(Tab.wallet.rawValue)
						.navigationBarTitleDisplayMode(.inline)
				}
				.modifier(TabBarItemModifier(
					icon: ButtonIcons.wallet.rawValue,
					tab: .wallet))

				NavigationView {
					ProfileView()
						.navigationTitle(Tab.profile.rawValue)
						.navigationBarTitleDisplayMode(.inline)
				}
				.modifier(TabBarItemModifier(
					icon: ButtonIcons.profile.rawValue,
					tab: .add))
			}

			CustomAddButton(addExpense: $addExpense, addIncome: $addIncome)
				.position(x: SCREEN_SIZE.width / 2, y: SCREEN_SIZE.height - 124)
		}
		.sheet(isPresented: $addIncome) {
			CreateView(selectedType: .income, title: Titles.addIncome.rawValue)
		}
		.sheet(isPresented: $addExpense) {
			CreateView(selectedType: .expense, title: Titles.addExpense.rawValue)
		}
	}
}

// MARK: View modifiers

private struct TabBarItemModifier: ViewModifier {
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
