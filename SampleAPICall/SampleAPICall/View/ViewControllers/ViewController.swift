//
//  ViewController.swift
//  SampleAPICall
//
//  Created by Sachith Mohan Rao on 20/11/20.
//

import UIKit

class ViewController: UIViewController {

    let viewModel = TrackViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewModel.fetchTrackFor(searchText: "Waka")
        reigsterViewModelListeners()
    }
    
    func reigsterViewModelListeners() {
        viewModel.isDataReceived.bind { (success) in
            if success {
                print("Success")
                for track in self.viewModel.tracks {
                    if let artistname = track.trackName {
                        print(artistname)
                    }
                }
            }
            else {
                print("Failure")
            }
        }
    }
    

}

