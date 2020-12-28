//
//  View+hideKeyboard.swift
//  PlayolaiOSUI
//
//  Created by Brian Keane on 12/28/20.
//

import Foundation
import SwiftUI

extension View {
  func hideKeyboard() {
    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
  }
}
