//
//  Song.swift
//  PlayolaiOSUI
//
//  Created by Brian Keane on 12/18/20.
//

import Foundation

struct Song: Identifiable, Hashable, Equatable {
  var id: String
  var title: String
  var artist: String
  var album: String
  var status: String
  var thumbnailURL: URL
}
