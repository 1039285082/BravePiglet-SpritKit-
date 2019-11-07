

//
//  Physice.swift
//  BravePiglet
//
//  Created by Mac on 28/12/2018.
//  Copyright © 2018 Mac. All rights reserved.
//

import Foundation


struct PhysicsCategory {
    static let none:UInt32 = 0x1 << 0
    static let backGround:UInt32  =  0x1 << 1
    static let bullet:UInt32 = 0x1 << 2
    static let safeArea : UInt32 = 0x1 << 3
    static let ground : UInt32 = 0x1 << 4
    static let beforeCraneHorizon : UInt32 = 0x1 << 5
    static let afterCraneHorizon : UInt32 = 0x1 << 6
    static let wolf:UInt32 = 0x1 << 7
    static let balloon:UInt32 = 0x1 << 8
    static let bird:UInt32 = 0x1 << 9
    static let pig:UInt32 = 0x1 << 10
    static let gunWolf:UInt32 = 0x1 << 11
    static let blackBall:UInt32 = 0x1 << 12
    static let breakWolfBall:UInt32 = 0x1 << 13
}
