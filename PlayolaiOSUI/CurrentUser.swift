//
//  CurrentUser.swift
//  PlayolaiOSUI
//
//  Created by Brian Keane on 12/18/20.
//

import Foundation

class CurrentUser: ObservableObject {
  private static var _currentUser: CurrentUser?
  
  public static var shared: CurrentUser {
    if _currentUser == nil {
      self._currentUser = CurrentUser()
    }
    return self._currentUser!
  }
  
  @Published var user: User?
  
  init() {
    // check for signin -- use keychain in real app
    if UserDefaults.standard.bool(forKey: "isSignedIn") == true {
      self.user = currentUser
    }
  }
  
  var isSignedIn: Bool {
    return self.user != nil
  }
  
  func signIn() {
    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
      UserDefaults.standard.setValue(true, forKey: "isSignedIn")
      self.user = currentUser
    }
  }
  
  func signOut() {
    UserDefaults.standard.setValue(false, forKey: "isSignedIn")
    self.user = nil
  }
}
