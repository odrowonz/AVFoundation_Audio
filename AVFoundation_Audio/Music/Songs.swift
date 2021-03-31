//
//  Songs.swift
//  AVFoundation_Audio
//
//  Created by Andrey Antipov on 28.03.2021.
//

import Foundation

class Record {
    var fileName: String
    var songName: String
    var executor: String
    
    init(fileName: String, songName: String, executor: String) {
        self.fileName = fileName
        self.songName = songName
        self.executor = executor
    }
}

var songs: [Record] = [
    Record(fileName: "Declan Mckenna Rapture Georgia Remix", songName: "Rapture (Georgia Remix)", executor: "Declan McKenna"),
    Record(fileName: "Queen", songName: "The Show Must Go On", executor: "Queen"),
    Record(fileName: "Sade_-_Smooth_Operator", songName: "Smooth Operator", executor: "Sade"),
    Record(fileName: "nbsplv_-_Conflate", songName: "Conflate - Single", executor: "NBSPLV"),
    Record(fileName: "Ciao_2020_Julia_-_Ziverti_Credo", songName: "Credo (CIAO 2020)", executor: "Julia Ziverti")
]
