//
//  SearchSongView.swift
//  PlayolaiOSUI
//
//  Created by Brian Keane on 12/28/20.
//

import SwiftUI

struct SearchSongsView: View {
  @ObservedObject var vm = SearchSongsViewModel()
  @State private var searchText = ""
  
  var onChosen: (Song) -> Void
  
  var body: some View {
    let searchTextBinding = Binding {
      return searchText
    } set: {
      searchText = $0
      vm.updateSearchText(with: $0)
    }
    
    return ZStack {
      VStack {
        SearchBar(text: searchTextBinding, isLoading: $vm.isLoading)
          .padding()
        
        ScrollView {
          if vm.viewState == .empty {
            Text("Empty")
          } else if vm.viewState == .ready {
            ForEach(vm.searchResults, id:\.self) { song in
              SongCollectionSongView(song: song, buttonTitle: "Add") {
                song in
                self.onChosen(song)
              }
            }
            .onTapGesture {
              print("tapped")
            }
          }
          Spacer()
        }
      }
      }
      .animation(.none)
      .transition(.opacity)
      .foregroundColor(.white)
  }
}

struct SearchSongView_Previews: PreviewProvider {
    static var previews: some View {
      SearchSongsView(onChosen: {_ in })
    }
}
