//
//  model.swift
//  ITunesCollection
//
//  Created by macbook on 26/09/18.
//  Copyright © 2018 gato3. All rights reserved.
//

import Foundation

 //copiado de iTunes.swift
struct Resultados : Codable{
    var resultCount: Int
    var results: [Track]
}

struct Track: Codable{
    var trackName: String
    var trackPrice: Double
    var atworkUrl100: String
}
