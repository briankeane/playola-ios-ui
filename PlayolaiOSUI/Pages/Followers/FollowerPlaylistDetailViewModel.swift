//
//  FollowerPlaylistDetailViewModel.swift
//  PlayolaiOSUI
//
//  Created by Brian Keane on 1/2/21.
//

import Foundation

class FollowerPlaylistDetailViewModel: ObservableObject {
  @Published var isLoading: Bool = false
  @Published var playlist: Playlist
  
  init(playlist: Playlist) {
    self.playlist = playlist
  }
  
  public func replaceSong(songToRemove: Song, songToInsert: Song) {}
  public func removeSong(song: Song) {}
}
