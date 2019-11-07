//
//  Array+Extension.swift
//  BravePiglet
//
//  Created by xyk on 7/1/2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import Foundation
extension Array where Element:Equatable{
    
    
    // Remove first collection element that is equal to the given `object`:
    mutating func remove(_ object: Element) {
        if let index = index(of: object) {
            remove(at: index)
        }
    }

}
