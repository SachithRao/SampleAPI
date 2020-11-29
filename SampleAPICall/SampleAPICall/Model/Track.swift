//
//  Track.swift
//  SampleAPICall
//
//  Created by Sachith Mohan Rao on 20/11/20.
//

import UIKit

enum TrackKeys: CodingKey {
    case artistName, trackName, artworkUrl100
}

struct Track: Codable {
    var artistName: String?
    var trackName: String?
    var artworkUrl100: String?
}

extension Track {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: TrackKeys.self)
        artistName = try container.decodeIfPresent(String.self, forKey: .artistName)
        trackName = try container.decodeIfPresent(String.self, forKey: .trackName)
        artworkUrl100 = try container.decodeIfPresent(String.self, forKey: .artworkUrl100)
    }
}
