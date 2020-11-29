//
//  TrackManager.swift
//  SampleAPICall
//
//  Created by Sachith Mohan Rao on 20/11/20.
//

import UIKit

class TrackManager {

    static let sharedManager = TrackManager()
    private init() {}
    
    let session = URLSession.shared
    
    func fetchTrackFor(searchText: String, callback: @escaping (_ respData: TrackObject?, _ error: Error?) -> Void) {
        let task = session.dataTask(with: URL(string: "https://itunes.apple.com/search?media=music&entity=song&term=\(searchText)")!) { (data, response, error) in
            if error == nil {
                if let responseData = data {
                    let decoder = JSONDecoder()
                    if let result = try? decoder.decode(TrackObject.self, from: responseData) {
                        callback(result,nil)
                    }
                }
            }
            else {
                callback(nil,error)
            }
        }
        task.resume()
    }
}
