//
//  Dynamic.swift
//  SampleAPICall
//
//  Created by Sachith Mohan Rao on 20/11/20.
//

import UIKit

class Dynamic<T> {
    typealias Listener = (T) -> Void
    var listener: Listener?
    
    func bind(listener: Listener?) {
        self.listener = listener
    }
    
    func bindAndFire(listener: Listener?) {
        self.listener = listener
        listener?(value)
    }
    
    var value: T {
        didSet{
            listener?(value)
        }
    }
    
    init(_ v: T) {
        value = v
    }
}
