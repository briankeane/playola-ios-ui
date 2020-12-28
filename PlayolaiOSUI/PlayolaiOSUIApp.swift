//
//  PlayolaiOSUIApp.swift
//  PlayolaiOSUI
//
//  Created by Brian Keane on 12/18/20.
//

import SwiftUI

@main
struct PlayolaiOSUIApp: App {
  @ObservedObject var currentUser: CurrentUser = CurrentUser.shared
  
    var body: some Scene {
        WindowGroup {
          HStack {
            if currentUser.isSignedIn {
              ContentView()
            } else {
              SignInView()
            }
          }
        }
    }
}
