//
//  SignInViewModel.swift
//  PlayolaiOSUI
//
//  Created by Brian Keane on 12/18/20.
//

import Foundation
import Combine

class SignInViewModel: ObservableObject {
  @Published var loading: Bool = false
  @Published var _currentUser: CurrentUser = CurrentUser.shared
  
  public var isSignedIn: Bool {
    return _currentUser.isSignedIn
  }
  
  private var cancellables = Set<AnyCancellable>()
  
  init() {
    self._currentUser.objectWillChange
      .sink { _ in
          self.objectWillChange.send()
      }
      .store(in: &cancellables)
  }
  
  public func signOut() {
    CurrentUser.shared.signOut()
  }
  
  public func signIn() {
    CurrentUser.shared.signIn()
  }
}
