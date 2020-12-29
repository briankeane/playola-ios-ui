//
//  FavoriteSongsView.swift
//  PlayolaiOSUI
//
//  Created by Brian Keane on 12/27/20.
//

import SwiftUI
import struct Kingfisher.KFImage

struct FavoriteSongsView: View {
  let favoriteSongs: [Song]
  @State var isOn:Bool = true
  
  @State var editingMode: EditMode = EditMode.inactive
  
  @State var songToReplace: Song? = nil
  
  init(favoriteSongs: [Song]) {
    UITableView.appearance().allowsSelection = false
    UITableViewCell.appearance().selectionStyle = .none
    self.favoriteSongs = favoriteSongs
    UITableView.appearance().backgroundColor = .clear
  }
  
  
  var body: some View {
    
    ZStack {
      Color.black
        .edgesIgnoringSafeArea(.all)
      VStack {
        List {
          HeaderView(imageURLs: favoriteSongs.map({$0.thumbnailURL }), title: "Your Song Collection", description: "These 10 songs will be used to generate playlists for your friends.")

          
          ForEach(favoriteSongs, id:\.self) { song in
            SongCollectionSongView(song: song, buttonTitle: "Replace") { song in
              print("Song Chosen: \(song.title)")
              self.songToReplace = song
            }
          }.onMove(perform: { indices, newOffset in
            print("move")
          })
          .onDelete(perform: { indexSet in
            print("delete")
          })
          .listRowInsets(EdgeInsets(top: 0, leading: self.editingMode == .active ? -43 : 0, // workaround !!
                          bottom: 0, trailing: 0))
          .listRowBackground(Color.black)
          
        }
        .padding(.top, -100)
        .environment(\.editMode, .constant(self.editingMode))
        .animation(.default)
      }
      
      if songToReplace != nil {
        SongPickerView { (song) in
          print("replacing \(songToReplace!.title) with :\(song.title)")
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
