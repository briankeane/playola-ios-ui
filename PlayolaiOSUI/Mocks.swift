//
//  Mocks.swift
//  PlayolaiOSUI
//
//  Created by Brian Keane on 12/18/20.
//

import Foundation



let allSongs = [
  Song(id: UUID().uuidString, title: "Gallileo", artist: "Indigo Girls", album: "Rites of Passage", status: "Searching...", thumbnailURL: URL(string: "https://i.scdn.co/image/ab67616d00001e02129cef84e89240dabe3abf50")!),
  Song(id: UUID().uuidString, title: "Stay", artist: "Rachel Loy", album: "Stay", status: "Searching...", thumbnailURL: URL(string: "https://i.scdn.co/image/ab67616d00001e02bbe154fa2f2c8077fa163d43")!),
  Song(id: UUID().uuidString, title: "Too Good to be True", artist: "Rachel Loy", album: "Broken Machine", status: "Searching..."  , thumbnailURL: URL(string: "https://i.scdn.co/image/ab67616d00001e02de0f865530f8b698b9db0207")!),
  Song(id: UUID().uuidString, title: "Tae Kwon Do", artist: "Rachel Loy", album: "Sugar", status: "Searching...", thumbnailURL: URL(string: "https://i.scdn.co/image/ab67616d00001e024bd8e7f485f1fd544757badf")!),
  Song(id: UUID().uuidString, title: "North Dakota", artist: "Lyle Lovett", album: "Joshua Judges Ruth", status: "Searching...", thumbnailURL: URL(string: "https://i.scdn.co/image/ab67616d00001e028d0cb2fc1d6ed82ff673cfa7")!),
  Song(id: UUID().uuidString, title: "Fields of Gold", artist: "Sting", album: "Ten Summoner's Tales", status: "Searching...", thumbnailURL: URL(string: "https://i.scdn.co/image/ab67616d00001e02653b110d9560eb1656f4c583")!),
  Song(id: UUID().uuidString, title: "I Wouldn't Kiss Her with Your Lips", artist: "Sam Hunter", album: "Big Blue Elephant", status: "Searching...", thumbnailURL: URL(string: "https://i.scdn.co/image/ab67616d0000b273ca0749e4cedabe80a51b4174")!),
  Song(id: UUID().uuidString, title: "Kiss Me In The Dark", artist: "Randy Rogers Band", album: "Just A Matter Of Time", status: "Searching...", thumbnailURL: URL(string: "https://i.scdn.co/image/ab67616d00001e02635050612aa54972849e0241")!),
  Song(id: UUID().uuidString, title: "Wicked Ways", artist: "Randy Rogers Band", album: "Randy Rogers Band", status: "Searching...", thumbnailURL: URL(string: "https://i.scdn.co/image/ab67616d00001e0224e1535df4d2e28dd96d7b8e")!),
  Song(id: UUID().uuidString, title: "Tools of the Trade", artist: "Charlie Worsham", album: "Rubberband", status: "Searching...", thumbnailURL: URL(string: "https://i.scdn.co/image/ab67616d00001e020287f3d9ebbaba962d1b9e1a")!),
  Song(id: UUID().uuidString, title: "Heartbreaklist", artist: "The Damnwells", album: "Air Stereo", status: "Searching...", thumbnailURL: URL(string: "https://i.scdn.co/image/ab67616d00001e02db22c1655a92b3711d44e60f")!)
]


var allUsers = [
  User(id: UUID().uuidString, displayName: "Corey Rice", email: "corey@corey.com", profileImageURL: URL(string: "https://scontent-atl3-2.xx.fbcdn.net/v/t1.0-1/p320x320/96801175_10101514988527982_3025072949792079872_o.jpg?_nc_cat=110&ccb=2&_nc_sid=0c64ff&_nc_ohc=_Ifr2FHnBFUAX_IboF1&_nc_ht=scontent-atl3-2.xx&tp=6&oh=03798411b20d054cbc24b79c5866f661&oe=6010DC85")),
  User(id: UUID().uuidString, displayName: "Shane Tarleton", email: "shane@shane.com", profileImageURL: URL(string: "https://scontent-ort2-1.xx.fbcdn.net/v/t1.0-1/p320x320/126998507_10224776160740153_6989823593642984417_n.jpg?_nc_cat=106&ccb=2&_nc_sid=0c64ff&_nc_ohc=cQXY80zRvuMAX8suvq_&_nc_ht=scontent-ort2-1.xx&tp=6&oh=2c9bb78d50283a07d320b2d50804c3c9&oe=6011B677")),
  User(id: UUID().uuidString, displayName: "Scott Chapman", email: "scott@scott.com", profileImageURL: URL(string: "https://scontent-ort2-1.xx.fbcdn.net/v/t1.0-1/p320x320/61534130_10220330128389755_8932190141997383680_o.jpg?_nc_cat=111&ccb=2&_nc_sid=0c64ff&_nc_ohc=t95AG4M_7z4AX9irSXQ&_nc_ht=scontent-ort2-1.xx&tp=6&oh=0b6406b391a206695e9fbcf1ebc1dbc7&oe=6010BB6B")),
  User(id: UUID().uuidString, displayName: "Evan Altshuler", email: "evan@evan.com", profileImageURL: URL(string: "https://scontent-ort2-2.xx.fbcdn.net/v/t31.0-1/p320x320/12182726_10100344672874675_4370747666131127514_o.jpg?_nc_cat=110&ccb=2&_nc_sid=0c64ff&_nc_ohc=HGUdzGtDPfUAX8v4j0v&_nc_ht=scontent-ort2-2.xx&tp=6&oh=86df78c47c50ac03003d6151d904dd14&oe=601053AD")),
  User(id: UUID().uuidString, displayName: "S Walker", email: "seth@seth.com", profileImageURL: URL(string: "https://scontent-ort2-1.xx.fbcdn.net/v/t1.0-1/p320x320/65874794_10156517124721452_1223672183046275072_n.jpg?_nc_cat=100&ccb=2&_nc_sid=0c64ff&_nc_ohc=uvwPcXEgAc4AX9cXlPs&_nc_ht=scontent-ort2-1.xx&tp=6&oh=5b96605f63989056879c544b11ef8c2d&oe=60126241")),
  User(id: UUID().uuidString, displayName: "Michael Jude Grimes", email: "grimey@grimey.com", profileImageURL: URL(string: "https://scontent-ort2-2.xx.fbcdn.net/v/t1.0-1/p320x320/133708014_10159331426689684_7784302449492481549_n.jpg?_nc_cat=107&ccb=2&_nc_sid=0c64ff&_nc_ohc=x8w7N17kG0sAX_9It5G&_nc_ht=scontent-ort2-2.xx&tp=6&oh=1e3bc3b2751780e7c3cf12e0ba9cc4a4&oe=6012D372")),
]

let allPlaylists = allUsers.map { Playlist(id: UUID().uuidString, seeder: $0, listener: currentUser, songs: generateSongs(5)) }
let currentUser = User(id: UUID().uuidString, displayName: "Brian Keane", email: "brian@brian.com", profileImageURL: URL(string: "https://avatars0.githubusercontent.com/u/6233176?s=460&v=4")!)

let currentPlaylist = Playlist(id: UUID().uuidString, seeder: allUsers[1], listener: allUsers[2], songs: Array(allSongs[0..<5]))

func generateSongs(_ count:Int) -> [Song] {
  var songsSet = Set(allSongs)
  var results: [Song] = []
  for _ in 0..<count {
    let song = songsSet.randomElement()!
    songsSet.remove(song)
    results.append(song)
  }
  return results
}
