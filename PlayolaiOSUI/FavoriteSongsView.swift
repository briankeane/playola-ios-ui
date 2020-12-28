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
  
  init(favoriteSongs: [Song]) {
    self.favoriteSongs = favoriteSongs
    UITableView.appearance().backgroundColor = .clear
  }
  
  
  var body: some View {
    
    ZStack {
      Color.black
        .edgesIgnoringSafeArea(.all)
      VStack {
        List {
          AlbumHeader(favoriteSongs: favoriteSongs)
          
          HStack {
            Spacer()
            
            EditButton()
            
            Spacer()
            SmallVerticalButton(text: "Add A Song", isOnImage: Image(systemName: "plus"), isOffImage: Image(systemName: "plus"), isOn: true) {
              print("selected")
            }
            Spacer()
          }
          .listRowBackground(Color.black)
          
          ForEach(favoriteSongs, id:\.self) { song in
            SongCollectionSongView(song: song, buttonTitle: "Replace") {
              print("here")
            }
          }.onMove(perform: { indices, newOffset in
            print("move")
            self.editingMode = .inactive
          })
          .onLongPressGesture {
            self.editingMode = EditMode.active
          }

          .onTapGesture {
            print("tapped")
          }
          .listRowBackground(Color.black)
          
          
        }
        .padding(.top, -100)
        .environment(\.editMode, .constant(editingMode))
        
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

struct AlbumHeader: View {
  let favoriteSongs: [Song]
  var body: some View {
    ZStack {
      ImageGrid(imageURLS: favoriteSongs.map({$0.thumbnailURL }))
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
      
      VStack {
        Spacer()
        Text("Your Collection")
          .font(.system(size: 36))
          .bold()
          .padding(.bottom, 10)
        Text("These are the songs that will be used to generate playlists for your friends, in order of most important to least important.")
          .font(.system(size: 24))
          .padding(.leading, 20)
          .padding(.trailing, 20)
          .padding(.bottom, 30)
      }
    }
    .listRowInsets(EdgeInsets())
  }
}
