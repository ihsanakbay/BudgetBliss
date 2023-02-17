//
//  FirebaseService+Extension.swift
//  BudgetBliss
//
//  Created by İhsan Akbay on 21.01.2023.
//

import Firebase
import FirebaseFirestoreSwift
import Foundation

protocol FirebaseIdentifiable: Identifiable, Hashable, Codable {
	var id: String? { get set }
}

extension FirebaseService {
	func getOne<T: Decodable>(of type: T, with query: Query) async -> Result<T, Error> {
		do {
			let querySnapshot = try await query.getDocuments()
			if let document = querySnapshot.documents.first {
				let data = try document.data(as: T.self)
				return .success(data)
			} else {
				print("Warning: \(#function) document not found")
				return .failure(ServiceErrors.documentNotFound)
			}
		} catch {
			print("Error: \(#function) couldn't access snapshot, \(error)")
			return .failure(error)
		}
	}

	func getMany<T: Decodable>(of type: T, with query: Query) async -> Result<[T], Error> {
		do {
			var response: [T] = []
			let querySnapshot = try await query.getDocuments()

			for document in querySnapshot.documents {
				do {
					let data = try document.data(as: T.self)
					response.append(data)
				} catch {
					print("Error: \(#function) document(s) not decoded from data, \(error)")
					return .failure(error)
				}
			}

			return .success(response)
		} catch {
			print("Error: couldn't access snapshot, \(error)")
			return .failure(error)
		}
	}

	func post<T: FirebaseIdentifiable>(_ value: T, to collection: String) async -> Result<T, Error> {
		let ref = firestore.collection(collection).document()
		var valueToWrite: T = value
		valueToWrite.id = ref.documentID
		do {
			try ref.setData(from: valueToWrite)
			return .success(valueToWrite)
		} catch {
			print("Error: \(#function) in collection: \(collection), \(error)")
			return .failure(error)
		}
	}

	func put<T: FirebaseIdentifiable>(_ value: T, to collection: String) async -> Result<T, Error> {
		let ref = firestore.collection(collection).document(value.id ?? "")
		do {
			try ref.setData(from: value)
			return .success(value)
		} catch {
			print("Error: \(#function) in \(collection) for id: \(value.id ?? ""), \(error)")
			return .failure(error)
		}
	}

	func delete<T: FirebaseIdentifiable>(_ value: T, in collection: String) async -> Result<Void, Error> {
		let ref = firestore.collection(collection).document(value.id ?? "")
		do {
			try await ref.delete()
			return .success(())
		} catch {
			print("Error: \(#function) in \(collection) for id: \(value.id ?? ""), \(error)")
			return .failure(error)
		}
	}
}

extension FirebaseIdentifiable {
	func post(to collection: String) async -> Result<Self, Error> {
		return await FirebaseService.shared.post(self, to: collection)
	}

	func put(to collection: String) async -> Result<Self, Error> {
		return await FirebaseService.shared.put(self, to: collection)
	}

	func delete(from collection: String) async -> Result<Void, Error> {
		return await FirebaseService.shared.delete(self, in: collection)
	}
}
