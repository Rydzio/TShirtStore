//
//  FirebaseConvertable.swift
//  TShirtStore
//
//  Created by Akshit Zaveri on 23/04/20.
//  Copyright © 2020 Akshit Zaveri. All rights reserved.
//

import Foundation

protocol FirebaseConvertable {
  func toDocument() -> [String: Any]
}
