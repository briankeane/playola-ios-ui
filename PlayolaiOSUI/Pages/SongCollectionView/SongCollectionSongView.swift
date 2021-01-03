//
//  SongCollectionSongView.swift
//  PlayolaiOSUI
//
//  Created by Brian Keane on 12/18/20.
//

import SwiftUI
import struct Kingfisher.KFImage

struct SongCollectionSongView: View {
  var song: Song
  var buttonTitle: String
  var buttonAction: (Song) -> Void
  
    var body: some View {
      HStack {
        KFImage(song.thumbnailURL)
          .resizable()
          .frame(width: 50, height: 50)
          .padding(5)
        VStack {
          HStack {
            Text(song.title)
              .font(.system(size: 12))
              .bold()
              .multilineTextAlignment(.leading)
            Spacer()
          }

            
          HStack {
            Text(song.artist)
              .font(.system(size: 11))
              .multilineTextAlignment(.leading)
            Spacer()
          }
        }
        
        Spacer()
        
          Button(action: {
            buttonAction(song)
          }, label: {
            HStack {
              Spacer()
              Text(buttonTitle)
              Spacer()
            }
          })
          .foregroundColor(.white)
          .background(Color.playolaRed)
          .cornerRadius(3.0)
          .padding()
          .frame(width: 125)
          .buttonStyle(PlainButtonStyle())
          
      }
      .foregroundColor(.white)
      .multilineTextAlignment(.leading)
    }

}

struct SongCollectionSongView_Previews: PreviewProvider {
    static var previews: some View {
      ZStack {
        Color.black
          .edgesIgnoringSafeArea(.all)
        SongCollectionSongView(song: allSongs[0], buttonTitle: "Replace") {
          song in
          print("hi")
        }
      }
    }
}
