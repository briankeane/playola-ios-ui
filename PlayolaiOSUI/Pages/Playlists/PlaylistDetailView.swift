//
//  PlaylistDetailView.swift
//  PlayolaiOSUI
//
//  Created by Brian Keane on 12/30/20.
//

import SwiftUI

struct PlaylistDetailView: View {
  var playlist: Playlist

    var body: some View {
      ZStack {
        Color.black
          .edgesIgnoringSafeArea(.all)
        
        VStack {
          List {
            HeaderView(imageURLs: playlist.songs.map({$0.thumbnailURL }), title: "Discover \(playlist.seeder.displayName)", description: "")
            
            
            SongListEditorView(songs: playlist.songs) { (song) in
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

struct PlaylistDetailView_Previews: PreviewProvider {
    static var previews: some View {
      PlaylistDetailView(playlist: currentPlaylist)
    }
}
