//
//  ImageGrid.swift
//  PlayolaiOSUI
//
//  Created by Brian Keane on 12/28/20.
//

import SwiftUI
import struct Kingfisher.KFImage

struct ImageGrid: View {
  @State var imageURLS: [URL]
  
  init(imageURLS:[URL]) {
    // Only store a square-rootable number of unique urls
    var imagesSet = Set(imageURLS.map({ $0.absoluteString }))
    var urlsCount = 0
    if imagesSet.count >= 9 {
      urlsCount = 9
    } else if imagesSet.count >= 4 {
      urlsCount = 4
    } else {
      urlsCount = 1
    }
    
    var newImages:[URL] = []
    while (newImages.count < urlsCount && imagesSet.count > 0) {
      if let randomElement = imagesSet.randomElement() {
        imagesSet.remove(randomElement)
        newImages.append(URL(string: randomElement)!)
      }
    }
    _imageURLS = State(initialValue: newImages)
  }
  
  func rowLength() -> Int {
    return Int(sqrt(Double(imageURLS.count)))
  }

  
    var body: some View {
      ZStack {
        List {
          ForEach(0..<rowLength()) { row in
            
            HStack(spacing: 0) {
              ForEach(0..<rowLength()) { column in
                KFImage(self.imageURLS[(row*rowLength() + column)])
                  .resizable()
                  .scaledToFit()
              }
            }
            .listRowInsets(EdgeInsets())
          }
        }.edgesIgnoringSafeArea(.all)
        .animation(.none)
        
        Color.black.opacity(0.3)
          .background(LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.0), Color.black.opacity(0.9)]), startPoint: .top, endPoint: .bottom))
        
      }
    }
}

struct ImageGrid_Previews: PreviewProvider {
    static var previews: some View {
      ImageGrid(imageURLS: allSongs.map({ $0.thumbnailURL }))
    }
}
