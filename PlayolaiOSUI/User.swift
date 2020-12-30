//
//  User.swift
//  PlayolaiOSUI
//
//  Created by Brian Keane on 12/18/20.
//

import Foundation

struct User: Identifiable, Hashable, Equatable {
  var id: String
  var displayName: String
  var email: String
  var profileImageURL: URL?
  var role: String = "user"
}
