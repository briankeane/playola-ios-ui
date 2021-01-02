//
//  SettingsView.swift
//  PlayolaiOSUI
//
//  Created by Brian Keane on 1/2/21.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
      ZStack {
        Color.black
          .edgesIgnoringSafeArea(.all)
        
        VStack {
          List {
              Section(header: HStack {
                  Text("Session")
                      .font(.headline)
                      .foregroundColor(.white)
                      .padding()

                      Spacer()
              }
              .background(Color.black)
              .listRowInsets(EdgeInsets(
                  top: 0,
                  leading: 0,
                  bottom: 0,
                  trailing: 0))
              ) {
                  // your list items
                Text("Sign Out")
                  .listRowBackground(Color.black)
              }
              .onTapGesture {
                CurrentUser.shared.user = nil
              }
          }.listStyle(GroupedListStyle())
          
        }
      }.foregroundColor(.white)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
