//
//  BudgetBlissApp.swift
//  BudgetBliss
//
//  Created by İhsan Akbay on 15.01.2023.
//

import FirebaseCore
import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {
	func application(_ application: UIApplication,
	                 didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool
	{
		FirebaseApp.configure()
		return true
	}
}

@main
struct BudgetBlissApp: App {
	@UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

	var body: some Scene {
		WindowGroup {
			MainTabView()
		}
	}
}
