//
//  FirebaseService.swift
//  BudgetBliss
//
//  Created by İhsan Akbay on 21.01.2023.
//

import Firebase
import FirebaseFirestoreSwift
import Foundation
import SwiftUI

class FirebaseService {
	static let shared = FirebaseService()
	let firestore = Firestore.firestore()

	init() {
		let settings = FirestoreSettings()
		settings.isPersistenceEnabled = true
		settings.cacheSizeBytes = FirestoreCacheSizeUnlimited
		firestore.settings = settings
	}
}

enum Collections: String {
	case transactions
}

