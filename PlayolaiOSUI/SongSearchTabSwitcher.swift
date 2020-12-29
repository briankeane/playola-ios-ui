//
//  CustomTabSwitcher.swift
//  PlayolaiOSUI
//
//  Created by Brian Keane on 12/29/20.
//

import SwiftUI

struct SongSearchTabSwitcher: View {
  @State private var currentTab: CustomTab = .search
  
  var tabs: [CustomTab] = [.search, .favoriteSongs]
  var onChosen: (Song) -> Void
  
  func tabWidth(_ tab: CustomTab) -> CGFloat {
    return tab.rawValue.width(usingFont: .systemFont(ofSize: 16, weight: .bold))
  }
  
  var body: some View {
    VStack {
      HStack(spacing:75) {
        Spacer()
        ForEach(tabs, id: \.self) { tab in
          VStack {
            Rectangle()
              .frame(width: tabWidth(tab), height: 6)
              .foregroundColor(tab == currentTab ? .playolaRed : Color.clear)
            
            Button(action: {
              currentTab = tab
            }, label: {
              Text(tab.rawValue)
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(tab == currentTab ? .white : .gray)
            })
            .buttonStyle(PlainButtonStyle())
            .frame(width: tabWidth(tab), height: 30)
          }
        }
        Spacer()
      }
      switch currentTab {
      case .search:
        SearchSongsView(onChosen: self.onChosen)
      case .favoriteSongs:
        SearchFavoriteSongsView(onChosen: self.onChosen)
      }
      Spacer()
    }
    .foregroundColor(.white)
  }
}

enum CustomTab: String {
  case search = "search"
  case favoriteSongs = "favorite songs"
}

struct CustomTabSwitcher_Previews: PreviewProvider {
    static var previews: some View {
      ZStack {
        Color.black
          .edgesIgnoringSafeArea(.all)
        SongSearchTabSwitcher(tabs: [.search, .favoriteSongs], onChosen: { song in })
      
      }
    }
}


