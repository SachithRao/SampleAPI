//
//  TrackObject.swift
//  SampleAPICall
//
//  Created by Sachith Mohan Rao on 20/11/20.
//

import UIKit

enum TrackObjectKeys: CodingKey {
    case resultCount, results
}

struct TrackObject: Codable {
    var resultCount: Int?
    var results: [Track]?
}

extension TrackObject {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: TrackObjectKeys.self)
        resultCount = try container.decodeIfPresent(Int.self, forKey: .resultCount)
        results = try container.decodeIfPresent([Track].self, forKey: .results)
    }
}
