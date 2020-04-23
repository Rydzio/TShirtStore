//
//  ViewController.swift
//  TShirtStore
//
//  Created by Akshit Zaveri on 23/04/20.
//  Copyright © 2020 Akshit Zaveri. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

  var viewModel: ViewModel!

  private let product = Product(id: 1, name: "Blue T-Shirt", pricePerUnit: 10.99)

  @IBAction func addToCartButtonTapped(_ sender: UIButton) {
    self.viewModel.product = self.product

    self.viewModel.addToCart() { result in
      switch result {
      case .success: print("Success")
      case .failure(let error): self.showAlert(title: "Error", message: error.localizedDescription)
      }
    }
  }

  private func showAlert(title: String, message: String) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    alert.addAction(.init(title: "OK", style: .default, handler: nil))
    self.present(alert, animated: true, completion: nil)
  }
}
