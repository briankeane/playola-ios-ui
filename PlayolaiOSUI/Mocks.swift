//
//  Mocks.swift
//  PlayolaiOSUI
//
//  Created by Brian Keane on 12/18/20.
//

import Foundation

let currentUser = User(id: UUID().uuidString, name: "Bob Bobberson")

let allSongs = [
  Song(id: UUID().uuidString, title: "Gallileo", artist: "Indigo Girls", album: "Rites of Passage", status: "Searching...", thumbnailURL: URL(string: "https://i.scdn.co/image/ab67616d00001e02129cef84e89240dabe3abf50")!),
  Song(id: UUID().uuidString, title: "Stay", artist: "Rachel Loy", album: "Stay", status: "Searching...", thumbnailURL: URL(string: "https://i.scdn.co/image/ab67616d00001e02bbe154fa2f2c8077fa163d43")!),
  Song(id: UUID().uuidString, title: "Too Good to be True", artist: "Rachel Loy", album: "Broken Machine", status: "Searching..."  , thumbnailURL: URL(string: "https://i.scdn.co/image/ab67616d00001e02de0f865530f8b698b9db0207")!),
  Song(id: UUID().uuidString, title: "Tae Kwon Do", artist: "Rachel Loy", album: "Sugar", status: "Searching...", thumbnailURL: URL(string: "https://i.scdn.co/image/ab67616d00001e024bd8e7f485f1fd544757badf")!),
  Song(id: UUID().uuidString, title: "North Dakota", artist: "Lyle Lovett", album: "Joshua Judges Ruth", status: "Searching...", thumbnailURL: URL(string: "https://i.scdn.co/image/ab67616d00001e028d0cb2fc1d6ed82ff673cfa7")!),
  Song(id: UUID().uuidString, title: "Fields of Gold", artist: "Sting", album: "Ten Summoner's Tales", status: "Searching...", thumbnailURL: URL(string: "https://i.scdn.co/image/ab67616d00001e02653b110d9560eb1656f4c583")!),
  Song(id: UUID().uuidString, title: "I Wouldn't Kiss Her with Your Lips", artist: "Sam Hunter", album: "Big Blue Elephant", status: "Searching...", thumbnailURL: URL(string: "https://i.scdn.co/image/ab67616d00001e028d0cb2fc1d6ed82ff673cfa7")!),
  Song(id: UUID().uuidString, title: "Kiss Me In The Dark", artist: "Randy Rogers Band", album: "Just A Matter Of Time", status: "Searching...", thumbnailURL: URL(string: "https://i.scdn.co/image/ab67616d00001e02635050612aa54972849e0241")!),
  Song(id: UUID().uuidString, title: "Wicked Ways", artist: "Randy Rogers Band", album: "Randy Rogers Band", status: "Searching...", thumbnailURL: URL(string: "https://i.scdn.co/image/ab67616d00001e0224e1535df4d2e28dd96d7b8e")!),
  Song(id: UUID().uuidString, title: "Tools of the Trade", artist: "Charlie Worsham", album: "Rubberband", status: "Searching...", thumbnailURL: URL(string: "https://i.scdn.co/image/ab67616d00001e020287f3d9ebbaba962d1b9e1a")!),
  Song(id: UUID().uuidString, title: "Heartbreaklist", artist: "The Damnwells", album: "Air Stereo", status: "Searching...", thumbnailURL: URL(string: "https://i.scdn.co/image/ab67616d00001e02db22c1655a92b3711d44e60f")!)
]


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
