//
//  FavoriteSongsView.swift
//  PlayolaiOSUI
//
//  Created by Brian Keane on 12/27/20.
//

import SwiftUI
import struct Kingfisher.KFImage

struct FavoriteSongsView: View {
  let vm = FavoriteSongsViewModel()

  
  // setting this to a non-nil Song presents the SongPickerView
  @State var songToReplace: Song? = nil
  
  init(favoriteSongs: [Song]) {
    UITableView.appearance().allowsSelection = false
    UITableViewCell.appearance().selectionStyle = .none
    UITableView.appearance().backgroundColor = .clear
  }
  
  
  var body: some View {
    
    ZStack {
      Color.black
        .edgesIgnoringSafeArea(.all)
      VStack {
        List {
          HeaderView(imageURLs: vm.favoriteSongs.map({$0.thumbnailURL }), title: "Your Song Collection", description: "These 10 songs will be used to generate playlists for your friends.")

          SongListEditorView(songs: vm.favoriteSongs) { song in
            self.songToReplace = song
          } onSongDeleted: { song in
            print("delete: \(song.title)")
          }
        }
        .padding(.top, -100)
        .animation(.default)
      }
      
      if songToReplace != nil {
        SongPickerView { (song) in
          print("replacing \(songToReplace!.title) with :\(song.title)")
          if let songToReplace = self.songToReplace {
            vm.replaceSong(songToRemove: songToReplace, songToInsert: song)
          }
          self.songToReplace = nil
        } onDismiss: {
          self.songToReplace = nil
        }
        .animation(.easeInOut)
        .transition(.opacity)
      }
    }
    .foregroundColor(.white)
  }
}

struct FavoriteSongsView_Previews: PreviewProvider {
    static var previews: some View {
      
      Group {
        ZStack {
          Color.black
            .edgesIgnoringSafeArea(.all)
          FavoriteSongsView(favoriteSongs: Array(allSongs[0...9]))
        }
        ZStack {
          Color.black
            .edgesIgnoringSafeArea(.all)
          FavoriteSongsView(favoriteSongs: Array(allSongs[0...9]))
        }
        .previewDevice("iPhone 12 Pro Max")
      }
    }
}
