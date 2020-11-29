//
//  TrackViewModel.swift
//  SampleAPICall
//
//  Created by Sachith Mohan Rao on 20/11/20.
//

import UIKit

class TrackViewModel {

    var isDataReceived: Dynamic<Bool> = Dynamic(false)
    var trackObject: TrackObject?
    var tracks:[Track] = []
    
    func fetchTrackFor(searchText: String) {
    TrackManager.sharedManager.fetchTrackFor(searchText: searchText) { (response, error) in
            if response != nil {
                self.trackObject = response
                if let trackArray = self.trackObject?.results {
                    self.tracks = trackArray
                }
                self.isDataReceived.value = true
            }
            else {
                self.isDataReceived.value = false
            }
        }
    }
}
