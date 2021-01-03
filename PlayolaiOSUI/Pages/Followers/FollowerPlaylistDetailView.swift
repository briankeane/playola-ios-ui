//
//  FollowerPlaylistDetailView.swift
//  PlayolaiOSUI
//
//  Created by Brian Keane on 12/30/20.
//

import SwiftUI

struct FollowerPlaylistDetailView: View {
  var vm: FollowerPlaylistDetailViewModel
  var onDismiss: () -> Void
  
  init(playlist: Playlist, onDismiss: @escaping ()-> Void) {
    self.vm = FollowerPlaylistDetailViewModel(playlist: playlist)
    self.onDismiss = onDismiss
  }
  
  @State private var songToReplace: Song?
  
  var body: some View {
    ZStack {
      Color.black
        .edgesIgnoringSafeArea(.all)
      
      VStack {
        List {
          HeaderView(imageURLs: vm.playlist.songs.map({$0.thumbnailURL }), title: "Your Shared Songs", description: "These are the songs that are included in \(vm.playlist.listener.displayName)'s discover playlist")
          
          
          SongListEditorView(songs: vm.playlist.songs) { (song) in
            print("song chosen: \(song.title)")
            self.songToReplace = song
          } onSongDeleted: { (song) in
            self.vm.removeSong(song: song)
          }
        }.padding(.top, -100)
        .animation(.default)
      }.foregroundColor(.white)
      
      VStack {
        DismissHeader(onDismiss: self.onDismiss)
          .padding(.top, 5)
          .padding(.horizontal, 15)
        Spacer()
      }
            
      if self.songToReplace != nil {
        SongPickerView { (song) in
          if let songToReplace = self.songToReplace {
            self.vm.replaceSong(songToRemove: songToReplace, songToInsert: song)
          }
          self.songToReplace = nil
        } onDismiss: {
          self.songToReplace = nil
        }
        .animation(.easeInOut)
        .transition(.opacity)
      }
    }
  }
}
struct FollowerPlaylistDetailView_Previews: PreviewProvider {
  static var previews: some View {
    FollowerPlaylistDetailView(playlist: allPlaylists[0], onDismiss: {})
  }
}
