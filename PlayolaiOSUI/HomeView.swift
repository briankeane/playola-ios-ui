//
//  HomeView.swift
//  PlayolaiOSUI
//
//  Created by Brian Keane on 12/18/20.
//

import SwiftUI

struct HomeView: View {
  let screen = UIScreen.main.bounds
  
  var body: some View {
    ZStack {
      Color.black
        .edgesIgnoringSafeArea(.all)
    
      // main vstack
      ScrollView(showsIndicators: false) {
        LazyVStack {
          HStack {
            Button(action: {
              
            }, label: {
              Text("Broadcast")
            })
            
            Spacer()
            
            Button(action: {
              
            }, label: {
              Text("Listen")
            })
            
            Spacer()
            
            Button(action: {
              
            }, label: {
              Text("Settings")
            })
          }
          
        }
      }
    
    }
    .foregroundColor(.white)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
