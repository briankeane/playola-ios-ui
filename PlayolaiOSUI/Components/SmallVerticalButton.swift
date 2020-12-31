//
//  SmallVerticalButton.swift
//  PlayolaiOSUI
//
//  Created by Brian Keane on 12/27/20.
//

import SwiftUI

struct SmallVerticalButton: View {
  var text: String
  
  var isOnImage: Image
  var isOffImage: Image
  
  var isOn: Bool
  
  var currentImage: Image {
    return isOn ? isOnImage : isOffImage
  }
  
  
  
  
  var action: () -> Void
  
  var body: some View {
    Button(action: action, label: {
      VStack {
        currentImage
          .foregroundColor(.white)
        
        Text(text)
          .foregroundColor(.white)
          .font(.system(size: 14))
          .bold()
      }
    })
  }
}

struct SmallVerticalButton_Previews: PreviewProvider {
  static var previews: some View {
    ZStack {
      Color.black
      SmallVerticalButton(text: "My List",
                          isOnImage: Image(systemName: "checkmark"),
                          isOffImage: Image(systemName: "plus"),
                          isOn: true) {
        print("Tapped")
      }
    }
    
  }
}
