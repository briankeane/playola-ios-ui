//
//  SongPickerView.swift
//  PlayolaiOSUI
//
//  Created by Brian Keane on 12/29/20.
//

import SwiftUI

struct SongPickerView: View {
  var onChosen: (Song) -> Void
  var onDismiss: () -> Void
  
  var body: some View {
    ZStack {
      Color.black
        .edgesIgnoringSafeArea(.all)
      
      VStack {
        DismissHeader(onDismiss: self.onDismiss)
        .padding(.horizontal, 22)
        .padding(.top, 5)
        
        SongSearchTabSwitcher(onChosen: self.onChosen)
      }
    }
  }
}

struct SongPickerView_Previews: PreviewProvider {
    static var previews: some View {
      SongPickerView(onChosen: { _ in }, onDismiss: {})
    }
}
