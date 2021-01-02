//
//  DismissHeader.swift
//  PlayolaiOSUI
//
//  Created by Brian Keane on 1/2/21.
//

import SwiftUI

struct DismissHeader: View {
  var onDismiss:() -> Void
    var body: some View {
      HStack {
        
        
        Button(action: {
          self.onDismiss()
        }, label: {
          Image(systemName: "chevron.left")
            .font(.system(size: 28))
        })
        
        Spacer()
        
        Image("PlayolaIcon")
          .resizable()
          .scaledToFit()
          .clipped()
          .frame(width:20)
      }
    }
}

struct DismissHeader_Previews: PreviewProvider {
    static var previews: some View {
      DismissHeader(onDismiss: {})
    }
}
