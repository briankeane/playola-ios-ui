//
//  SongListEditorView.swift
//  PlayolaiOSUI
//
//  Created by Brian Keane on 12/30/20.
//

import SwiftUI
import struct Kingfisher.KFImage

struct SongListEditorView: View {
  var songs: [Song]
  var onSongChosen: (Song) -> Void = { _ in }
  var onSongDeleted: (Song) -> Void = { _ in }

  init(songs: [Song], onSongChosen:@escaping (Song) -> Void={_ in }, onSongDeleted: @escaping (Song) -> Void = { _ in }) {
    self.songs = songs
    self.onSongChosen = onSongChosen
    self.onSongDeleted = onSongDeleted
    UITableView.appearance().allowsSelection = false
    UITableViewCell.appearance().selectionStyle = .none
    UITableView.appearance().backgroundColor = .clear
  }
  
  
  var body: some View {
          ForEach(songs, id:\.self) { song in
            SongCollectionSongView(song: song, buttonTitle: "Replace") { song in
              self.onSongChosen(song)
            }
            .buttonStyle(PlainButtonStyle())
          }
          .onDelete(perform: { indexSet in
            if let index = indexSet.first {
              let song = self.songs[index]
              self.onSongDeleted(song)
              print("deleted \(song.title)")
            }
          })
          .listRowBackground(Color.black)
  }
}

struct SongListEditorView_Previews: PreviewProvider {
    static var previews: some View {
      
      Group {
        ZStack {
          Color.black
            .edgesIgnoringSafeArea(.all)
          SongListEditorView(songs: Array(allSongs[0...9]))
        }
      }
    }
}
