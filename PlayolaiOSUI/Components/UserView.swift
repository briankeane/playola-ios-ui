//
//  UserView.swift
//  PlayolaiOSUI
//
//  Created by Brian Keane on 12/30/20.
//

import SwiftUI
import struct Kingfisher.KFImage

struct UserView: View {
  var user: User
  
    var body: some View {
      ZStack(alignment: .bottom) {
        
      VStack {
        ZStack {
          KFImage(user.profileImageURL)
            .resizable()
            .scaledToFit()
            .clipped()
            .overlay(Rectangle().stroke(Color.white, lineWidth: 4))
            .overlay(Rectangle().stroke(Color.playolaRed, lineWidth: 3))
            
            
            
          VStack {
            Spacer()
            Text(user.displayName)
              .font(.system(size: 20))
              .bold()
            
            HStack {
              Spacer()
              Spacer()
            }
            
          }.background(Color.black.opacity(0.2))
          
          

        }
      }
      }
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
      ZStack {
        Color.black
          .edgesIgnoringSafeArea(.all)
        
        UserView(user: allUsers[3])
      }.foregroundColor(.white)
       
    }
}
