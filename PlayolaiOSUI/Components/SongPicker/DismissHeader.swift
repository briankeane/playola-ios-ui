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
        Spacer()
        
        Button(action: {
          self.onDismiss()
        }, label: {
          Image(systemName: "xmark.circle")
            .font(.system(size: 28))
        })
      }
    }
}

struct DismissHeader_Previews: PreviewProvider {
    static var previews: some View {
      DismissHeader(onDismiss: {})
    }
}
