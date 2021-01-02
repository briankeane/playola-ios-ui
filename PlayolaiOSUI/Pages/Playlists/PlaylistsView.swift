//
//  PlaylistsView.swift
//  PlayolaiOSUI
//
//  Created by Brian Keane on 12/30/20.
//

import SwiftUI
import Foundation
import MessageUI

struct PlaylistsView: View {
  var playlists: [Playlist]
  @State private var selectedPlaylist: Playlist?
  
  @State var result: Result<MFMailComposeResult, Error>? = nil
  @State var isShowingMailView = false
  
  private func alternateAppEmailURL(subject: String, body: String) -> URL? {
    for urlString in [
      "googlegmail://co?",
      "ms-outlook://compose?",
      "readdle-spark://compose?",
      "mailto:?"
    ] {
      
      let subjectEncoded = subject.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
      let bodyEncoded = body.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
      
      guard subjectEncoded != nil && bodyEncoded != nil else {
        return nil
      }
      
      var encodedURLString = urlString + "subject=\(subjectEncoded!)"
      encodedURLString += "&body=\(bodyEncoded!)"
      if let url = URL(string: encodedURLString), UIApplication.shared.canOpenURL(url) {
        return url
      }
    }
    return nil
  }
  
    var body: some View {
      ZStack {
        Color.black
          .edgesIgnoringSafeArea(.all)
        
        VStack {
          List {
            
            HeaderView(imageURLs: allSongs.map({$0.thumbnailURL }), title: "Your Playlists", description: "These are your Discover playlists for each of your friends.")
            
            ForEach(playlists, id:\.self) { playlist in
              HStack {
                Spacer()
                Text("Discover ").foregroundColor(.playolaRed) + Text(playlist.seeder.displayName).foregroundColor(.white)
                Spacer()
              }.onTapGesture {
                print("\(playlist.seeder.displayName) tapped")
                self.selectedPlaylist = playlist
              }

            }
            .listRowBackground(Color.black)
            
            HStack {
              Spacer()
              Button(action: {
                UIApplication.shared.open(URL.init(string: "sms:&body=I'd like to use Playola to make a 'Discover Weekly' playlist based on your favorite Spotify songs.  Would you mind giving this app permission to take a peak?  https://playola.fm/request ".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)!)
              }, label: {
                HStack {
                  Spacer()
                  Text("Text Invite")
                  Spacer()
                }
              })
              .foregroundColor(.white)
              .background(Color.playolaRed)
              .cornerRadius(3.0)
              .padding()
              .frame(width: 125)
              .buttonStyle(PlainButtonStyle())
              Spacer()
            }
            .listRowBackground(Color.black)
            
            HStack {
              Spacer()
              Button(action: {
                if let url = alternateAppEmailURL(subject: "I Want to Hear Your Music", body: "I'd like to use Playola to make a 'Discover Weekly' playlist based on your favorite Spotify songs.  Would you mind giving this app permission to take a peak?  https://playola.fm/request") {
                  if UIApplication.shared.canOpenURL(url) {
                    UIApplication.shared.open(url)
                    return
                  }
                }
                print("problem opening url")
              }, label: {
                HStack {
                  Spacer()
                  Text("Email Invite")
                  Spacer()
                }
              })
              .foregroundColor(.white)
              .background(Color.playolaRed)
              .cornerRadius(3.0)
              .padding()
              .frame(width: 125)
              .buttonStyle(PlainButtonStyle())
              .listRowBackground(Color.black)
              Spacer()
            }
            .listRowBackground(Color.black)
          }.padding(.top, -100)
        }
        if self.selectedPlaylist != nil {
          PlaylistDetailView(playlist: self.selectedPlaylist!, onDismiss: { self.selectedPlaylist = nil })
        }
      }
      .foregroundColor(.white)
    }
}

struct PlaylistsView_Previews: PreviewProvider {
    static var previews: some View {
        PlaylistsView(playlists: [])
    }
}
