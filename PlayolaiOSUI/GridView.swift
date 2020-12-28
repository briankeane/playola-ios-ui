//
//  GridView.swift
//  PlayolaiOSUI
//
//  Created by Brian Keane on 12/28/20.
//

import SwiftUI
import UniformTypeIdentifiers

//MARK: - Model

class Model: ObservableObject {
    @Published var data: [Song]

    let columns = [
        GridItem(.fixed(160))
    ]

    init() {
      data = generateSongs(6)
    }
}

//MARK: - Grid

struct DemoDragRelocateView: View {
  @StateObject private var model = Model()
  
  @State private var dragging: Song?
  
  var body: some View {
    ZStack {
      Color.black
        .edgesIgnoringSafeArea(.all)
      
      ScrollView {
        LazyVGrid(columns: model.columns, spacing: 10) {
          ForEach(model.data) { song in
            SongCollectionSongView(song: song, buttonTitle: "Here", buttonAction: {
              print("button pressed")
            })
              .overlay(dragging?.id == song.id ? Color.gray.opacity(1.0) : Color.clear)
              .onDrag {
                self.dragging = song
                return NSItemProvider(object: String(song.id) as NSString)
              }
              .onDrop(of: [UTType.text], delegate: DragRelocateDelegate(item: song, listData: $model.data, current: $dragging))
            .frame(width: 360, height: 75)
          }
        }.animation(.default, value: model.data)
      }.onDrop(of: [UTType.text], delegate: DropOutsideDelegate(current: $dragging))
    }
  }
}

struct DragRelocateDelegate: DropDelegate {
    let item: Song
    @Binding var listData: [Song]
    @Binding var current: Song?

    func dropEntered(info: DropInfo) {
        if item != current {
            let from = listData.firstIndex(of: current!)!
            let to = listData.firstIndex(of: item)!
            if listData[to].id != current!.id {
                listData.move(fromOffsets: IndexSet(integer: from),
                    toOffset: to > from ? to + 1 : to)
            }
        }
    }
    
    func dropUpdated(info: DropInfo) -> DropProposal? {
        return DropProposal(operation: .move)
    }

    func performDrop(info: DropInfo) -> Bool {
        self.current = nil
        return true
    }
}

//MARK: - GridItem

//struct GridItemView: View {
//    var d: Song
//
//    var body: some View {
//        VStack {
//            Text(String(d.id))
//                .font(.headline)
//                .foregroundColor(.white)
//        }
//        .frame(width: 360, height: 100)
//        .background(Color.green)
//        .padding(0)
//    }
//}
struct DropOutsideDelegate: DropDelegate {
    @Binding var current: Song?
        
    func performDrop(info: DropInfo) -> Bool {
        current = nil
        return true
    }
}
