//
//  SongCollectionView.swift
//  PlayolaiOSUI
//
//  Created by Brian Keane on 12/18/20.
//

import SwiftUI

struct SongCollectionView: View {
  @ObservedObject var vm: SongCollectionViewModel = SongCollectionViewModel()
  
  var body: some View {
    ZStack {
      Color.black
        .edgesIgnoringSafeArea(.all)
      
      // main vstack
      ScrollView {
        ForEach(vm.songs, id: \.self) { song in
          SongCollectionSongView(song: song, buttonTitle: "Replace") {
            song in
            print("replace requested")
          }
          
        }
        
      }
    }
  }
}

struct SongCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        SongCollectionView()
    }
}
