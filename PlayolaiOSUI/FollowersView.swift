//
//  FollowersView.swift
//  PlayolaiOSUI
//
//  Created by Brian Keane on 12/30/20.
//

import SwiftUI

struct FollowersView: View {
  var followers:[User]
  
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
          ForEach(followers, id: \.self) { follower in
            UserView(user: follower)
              .onTapGesture {
                print("\(follower.displayName) tapped")
              }
          }

        }
      }
    }.foregroundColor(.white)
  }
}

struct FollowersView_Previews: PreviewProvider {
  static var previews: some View {
    FollowersView(followers: allUsers)
  }
}
