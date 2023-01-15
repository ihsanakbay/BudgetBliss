//
//  HomeView.swift
//  BudgetBliss
//
//  Created by İhsan Akbay on 15.01.2023.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
		VStack {
			BalanceCardView()
				.padding(.top, 16)
		}
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
