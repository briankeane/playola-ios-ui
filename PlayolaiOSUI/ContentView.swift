//
//  ContentView.swift
//  PlayolaiOSUI
//
//  Created by Brian Keane on 12/18/20.
//

import SwiftUI

struct ContentView: View {
  
  init() {
    UITabBar.appearance().isTranslucent = false
    UITabBar.appearance().barTintColor = UIColor.black
  }
  
    var body: some View {
      TabView {
        FavoriteSongsView(favoriteSongs: Array(allSongs[0...9]))
          .tabItem {
            Image("broadcast")
            Text("Broadcast")
          }.tag(0)
        
        FollowersView(playlists: allFollowersPlaylists)
          .tabItem {
            Image(systemName: "person.fill")
            Text("Followers")
          }.tag(0)
        
        PlaylistsView(playlists: allPlaylists)
          .tabItem {
            Image(systemName: "play.fill")
            Text("Playlists")
          }.tag(0)
        
        SettingsView()
          .tabItem {
            Image("settingsIcon")
              .resizable()
            Text("Settings")
          }.tag(0)
      }
      .accentColor(.white)
    }
  
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
      Group {
        ContentView()
        ContentView()
          .previewDevice("iPhone 12 Pro Max")
      }
    }
}
