//
//  ViewModel.swift
//  TShirtStore
//
//  Created by Akshit Zaveri on 23/04/20.
//  Copyright © 2020 Akshit Zaveri. All rights reserved.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

final class ViewModel {

  private let db = Firestore.firestore()
  var product: Product?

  typealias AddToCartCompletionHandler = (Result<Bool, ProductError>) -> Void

  func addToCart(_ completion: @escaping AddToCartCompletionHandler) {

    guard let product = self.product else {
      completion(.failure(.emptyProduct))
      return
    }

    self.db.collection("cart").addDocument(data: product.toDocument()) { (error) in

      // Handle the error
      if let error = error {
        completion(.failure(.unknown(error.localizedDescription)))
        return
      }

      // Adding the document was successful
      completion(.success(true))
    }
  }
}
