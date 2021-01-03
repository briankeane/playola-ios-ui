//
//  FollowersView.swift
//  PlayolaiOSUI
//
//  Created by Brian Keane on 12/30/20.
//

import SwiftUI

struct FollowersView: View {
  var playlists: [Playlist]
  
  @State var detailedPlaylist: Playlist?
  
  let columns = [
    GridItem(.flexible()),
    GridItem(.flexible()),
    GridItem(.flexible())
  ]
  
  var body: some View {
    ZStack {
      Color.black
        .edgesIgnoringSafeArea(.all)
      
      ScrollView {
        HeaderView(imageURLs: allSongs.map({$0.thumbnailURL}), title: "Your Followers", description: "Your cult membership.")
        
        LazyVGrid(columns: columns) {
          ForEach(playlists, id: \.self) { playlist in
            UserView(user: playlist.listener)
              .onTapGesture {
                self.detailedPlaylist = playlist
              }
          }
        }
      }.padding(.top, -100)
      
      if self.detailedPlaylist != nil {
        FollowerPlaylistDetailView(playlist: self.detailedPlaylist!, onDismiss: { self.detailedPlaylist = nil })
      }
    }.foregroundColor(.white)
  }
}


struct FollowersView_Previews: PreviewProvider {
  static var previews: some View {
    FollowersView(playlists: allPlaylists)
  }
}
