//
//  Product.swift
//  TShirtStore
//
//  Created by Akshit Zaveri on 23/04/20.
//  Copyright © 2020 Akshit Zaveri. All rights reserved.
//

import Foundation

struct Product {
  let id: Int
  let name: String
  let pricePerUnit: Double
}

extension Product: FirebaseConvertable {
  init?(from document: [String: Any]) {
    guard let idString = document["id"] as? String,
      let id = Int(idString),
      let name = document["name"] as? String,
      let priceString = document["pricePerUnit"] as? String,
      let price = Double(priceString) else { return nil }

    self.init(id: id, name: name, pricePerUnit: price)
  }

  func toDocument() -> [String : Any] {
    [ "id": "\(self.id)",
      "name": self.name,
      "pricePerUnit": "\(self.pricePerUnit)" ]
  }
}

enum ProductError: Error, Equatable {
  case emptyProduct
  case unknown(String)
}
