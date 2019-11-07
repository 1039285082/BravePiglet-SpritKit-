//
//  Parachute.swift
//  BravePiglet
//
//  Created by xyk on 18/1/2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit
import SpriteKit
class Parachute: BaseSpriteNode {

    
    
    init() {
        
//        let texture = SKTexture(imageNamed: SceneSelectTools.sharedSceneSelectTools.parachute)
//
//        super.init(texture: texture, color: .clear, size: texture.size())
//        zPosition = 50
//        //        speed = 20
        
        let texture = SKTexture(imageNamed: SceneSelectTools.sharedSceneSelectTools.parachute)
        
        super.init(texture: texture, color: .clear, size: texture.size())
        
        zPosition = 50
        //        speed = 20
        physicsBody = SKPhysicsBody(texture: texture, size: texture.size())
        //        physicsBody!.velocity = CGVector(dx: 0, dy: 2000)
        //        physicsBody?.isDynamic = false
        
        //                balloon.physicsBody?.isDynamic = false
        physicsBody?.affectedByGravity  = false
//        physicsBody?.categoryBitMask = PhysicsCategory.balloon
//        physicsBody?.contactTestBitMask = PhysicsCategory.bullet
        physicsBody?.collisionBitMask = 0
        physicsBody?.restitution = 0
//        physicsBody?.allowsRotation = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    
}
