//
//  SearchSongsViewModel.swift
//  PlayolaiOSUI
//
//  Created by Brian Keane on 12/28/20.
//

import Foundation
import SwiftUI

class SearchSongsViewModel: ObservableObject {
  @Published var isLoading: Bool = false
  @Published var viewState: ViewState = ViewState.ready {
    didSet {
      DispatchQueue.main.async {
          self.isLoading = self.viewState == ViewState.loading
      }
    }
  }
  
  @Published var searchResults: [Song] = []
  
  public func updateSearchText(with text:String) {
    self.viewState = .loading
    if text.count > 0 {
      getSongs(forText: text)
    } else {
      self.searchResults = []
    }
  }
  
  private func getSongs(forText text: String) {
    let haveResult = Int.random(in: 0...3)
    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
      if haveResult == 0 {
        self.searchResults = []
        self.viewState = ViewState.empty
      } else {
        self.searchResults = generateSongs(5)
        self.viewState = .ready
      }
    }
  }
  
}

enum ViewState {
  case empty
  case loading
  case ready
  case error
}
