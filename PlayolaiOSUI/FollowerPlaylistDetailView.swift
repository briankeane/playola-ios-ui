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
  
  var body: some View {
    ZStack {
      Color.black
        .edgesIgnoringSafeArea(.all)
    
      VStack {
        List {
          HeaderView(imageURLs: followerSongs.map({$0.thumbnailURL }), title: "Your Shared Songs", description: "These are the songs that are included in \(follower.displayName)'s discover playlist")
              
          
          SongListEditorView(songs: followerSongs) { (song) in
            print("song chosen: \(song.title)")
          } onSongDeleted: { (song) in
            print("song.deleted: \(song.title)")
          }
      }.padding(.top, -100)
        .animation(.default)
    }.foregroundColor(.white)
      
  }
}
}
struct FollowerPlaylistDetailView_Previews: PreviewProvider {
    static var previews: some View {
      FollowerPlaylistDetailView(follower: allUsers.first!, followerSongs: Array(allSongs[0..<5]))
    }
}
