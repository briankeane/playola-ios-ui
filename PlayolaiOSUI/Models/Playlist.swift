//
//  Playlist.swift
//  PlayolaiOSUI
//
//  Created by Brian Keane on 12/31/20.
//

import Foundation

struct Playlist: Identifiable, Hashable, Equatable {
  var id: String
  var seeder: User
  var listener: User
  var songs: [Song]
}
