//
//  FollowerPlaylistDetailView.swift
//  PlayolaiOSUI
//
//  Created by Brian Keane on 12/30/20.
//

import SwiftUI

struct FollowerPlaylistDetailView: View {
  var follower: User
  var followerSongs: [Song]
  var onDismiss: () -> Void
  
  @State private var songToReplace: Song?
  
  var body: some View {
    ZStack {
      Color.black
        .edgesIgnoringSafeArea(.all)
      
      VStack {
        DismissHeader(onDismiss: self.onDismiss)
        .padding(.horizontal, 22)
        .padding(.top, 5)
        
        List {
          HeaderView(imageURLs: followerSongs.map({$0.thumbnailURL }), title: "Your Shared Songs", description: "These are the songs that are included in \(follower.displayName)'s discover playlist")
          
          
          SongListEditorView(songs: followerSongs) { (song) in
            print("song chosen: \(song.title)")
            self.songToReplace = song
          } onSongDeleted: { (song) in
            print("song.deleted: \(song.title)")
          }
        }.padding(.top, -100)
        .animation(.default)
      }.foregroundColor(.white)
      
      if self.songToReplace != nil {
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
  }
}
struct FollowerPlaylistDetailView_Previews: PreviewProvider {
  static var previews: some View {
    FollowerPlaylistDetailView(follower: allUsers.first!, followerSongs: Array(allSongs[0..<5]), onDismiss: {})
  }
}
