//
//  TShirtStoreTests.swift
//  TShirtStoreTests
//
//  Created by Akshit Zaveri on 23/04/20.
//  Copyright © 2020 Akshit Zaveri. All rights reserved.
//

import XCTest
@testable import TShirtStore

class ViewModelTests: XCTestCase {

  var viewModel: ViewModel!

  override func setUpWithError() throws {
    self.viewModel = ViewModel()
  }

  override func tearDownWithError() throws {
    self.viewModel = nil
  }

  func test_WhenProductIsNilAndAddToCartIsCalled_ThenItReturnsError() {
    // given
    self.viewModel.product = nil
    let exp = self.expectation(description: "Waiting for async operation")

    // when
    self.viewModel.addToCart { (result) in
      // then
      switch result {
      case .failure(let error): XCTAssertEqual(error, .emptyProduct)
      default: XCTFail()
      }
      exp.fulfill()
    }

    self.waitForExpectations(timeout: 1, handler: nil)
  }

  func test_WhenProductIsNotNilAndAddToCartIsCalled_ThenItReturnsSuccess() {
    // given
    self.viewModel.product = Product(id: 1, name: "Grey T-Shirt", pricePerUnit: 20)
    let exp = self.expectation(description: "Waiting for async operation")

    // when
    self.viewModel.addToCart { (result) in
      // then
      switch result {
      case .success: print("Passed")
      default: XCTFail()
      }
      exp.fulfill()
    }

    self.waitForExpectations(timeout: 10, handler: nil)
  }
}
