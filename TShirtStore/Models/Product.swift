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
