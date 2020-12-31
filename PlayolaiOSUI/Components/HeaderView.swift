//
//  HeaderView.swift
//  PlayolaiOSUI
//
//  Created by Brian Keane on 12/29/20.
//

import SwiftUI

struct HeaderView: View {
  let imageURLs: [URL]
  var title: String
  var description: String
  
  var body: some View {
    ZStack(alignment: .bottom) {
      ImageGrid(imageURLS: imageURLs)
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width * 2/3)
      
      VStack {
        Text(title)
          .font(.system(size: 36))
          .bold()
          .padding(.bottom, 10)
        Text(description)
          .font(.system(size: 24))
          .padding(.leading, 20)
          .padding(.trailing, 20)
          .padding(.bottom, 50)
      }
      .multilineTextAlignment(.center)
    }
    .listRowInsets(EdgeInsets())
    .foregroundColor(.white)
  }
}

struct HeaderView_Previews: PreviewProvider {
  static var previews: some View {
    ZStack {
      Color.black
        .edgesIgnoringSafeArea(.all)
      HeaderView(imageURLs: allSongs.map({$0.thumbnailURL }), title: "Your Shared Songs", description: "These are the songs that are included in Brian Keane's discover playlist")
    }
  }
}

