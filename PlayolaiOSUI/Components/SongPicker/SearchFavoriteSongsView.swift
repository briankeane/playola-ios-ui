//
//  SearchFavoriteSongsView.swift
//  PlayolaiOSUI
//
//  Created by Brian Keane on 12/29/20.
//

import SwiftUI

struct SearchFavoriteSongsView: View {
  var favoriteSongs = allSongs
  var onChosen: (Song) -> Void
  
    var body: some View {
      ScrollView {
        HeaderView(imageURLs: favoriteSongs.map({$0.thumbnailURL }), title: "Browse Your Favorites", description: "Spotify told us you like these.")

          ForEach(favoriteSongs, id:\.self) { song in
            SongCollectionSongView(song: song, buttonTitle: "Add") {
              song in
              self.onChosen(song)
            }
          }
          .onTapGesture {
            print("tapped")
          }
        }
      Spacer()
      }
}

struct SearchFavoriteSongsView_Previews: PreviewProvider {
    static var previews: some View {
      SearchFavoriteSongsView(onChosen: { song in })
    }
}
