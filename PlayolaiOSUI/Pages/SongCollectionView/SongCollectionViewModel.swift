//
//  SongCollectionViewModel.swift
//  PlayolaiOSUI
//
//  Created by Brian Keane on 12/18/20.
//

import Foundation
import Combine

class SongCollectionViewModel: ObservableObject {
  @Published var songs: [Song] = allSongs
  
  init() {
    randomlyChangeStatuses()
  }
  
  func randomlyChangeStatuses() {
    let randomIndex = self.songs.indices.randomElement()!
    let oldSong = self.songs[randomIndex]
    let statuses = [
      "Searching...",
      "Getting Audio...",
      "Complete"
    ]
    var randomStatus = statuses.randomElement()!
    while randomStatus == oldSong.status {
      randomStatus = statuses.randomElement()!
    }
    
    songs[randomIndex] = Song(id: oldSong.id, title: oldSong.title, artist: oldSong.artist, album: oldSong.album, status: randomStatus, thumbnailURL: oldSong.thumbnailURL)
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
      self.randomlyChangeStatuses()
    }
  }

}
  
