//
//  OrderOrganizerApp.swift
//  OrderOrganizer
//
//  Created by Aafrin Sayani on 2022-11-01.
//
import SwiftUI
import FirebaseCore


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct YourApp: App {
  // register app delegate for Firebase setup
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
  
//  @StateObject var cart = Cart()
  @StateObject var order = Order()

  var body: some Scene {
    WindowGroup {
      NavigationView {
//        ContentView()
//          .environmentObject(cart)
        ContentView()
          .environmentObject(Order())
      }
    }
  }
}
