//
//  AppDelegate.swift
//  TShirtStore
//
//  Created by Akshit Zaveri on 23/04/20.
//  Copyright © 2020 Akshit Zaveri. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    FirebaseApp.configure()

    let settings = Firestore.firestore().settings
    settings.host = "localhost:8080"
    settings.isPersistenceEnabled = false
    settings.isSSLEnabled = false
    Firestore.firestore().settings = settings

    return true
  }

  // MARK: UISceneSession Lifecycle

  func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
    return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
  }
}
