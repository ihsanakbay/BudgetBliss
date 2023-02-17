//
//  ServiceErrors.swift
//  BudgetBliss
//
//  Created by İhsan Akbay on 21.01.2023.
//

import Foundation

enum ServiceErrors: Error, LocalizedError {
	case documentNotFound
	case serverError
	case invalidData
	case unknown(Error)

	var errorDescription: String? {
		switch self {
		case .documentNotFound:
			return "Document cannot decode"
		case .serverError:
			return "There was an error with the server. Please try again later"
		case .invalidData:
			return "The data is invalid. Please try again later"
		case .unknown(let error):
			return error.localizedDescription
		}
	}
}
