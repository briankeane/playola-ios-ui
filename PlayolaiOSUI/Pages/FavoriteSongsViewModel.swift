//
//  FavoriteSongsViewModel.swift
//  PlayolaiOSUI
//
//  Created by Brian Keane on 1/2/21.
//

import Foundation


class FavoriteSongsViewModel: ObservableObject {
  @Published var isLoading: Bool = false
  @Published var favoriteSongs: [Song] = []
  
  init() {
    self.favoriteSongs = Array(allSongs[0...9])   // Mock for now
  }
  
  public func replaceSong(songToRemove: Song, songToInsert: Song) {}
}
