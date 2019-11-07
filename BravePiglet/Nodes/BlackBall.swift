//
//  BalckBall.swift
//  BravePiglet
//
//  Created by xyk on 18/1/2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit
import SpriteKit
class BlackBall: BaseSpriteNode {

    init() {
        
        let texture = SKTexture(imageNamed: SceneSelectTools.sharedSceneSelectTools.blackBall)
        
        super.init(texture: texture, color: .clear, size: texture.size())
        zPosition = 50
        
        physicsBody = SKPhysicsBody(texture: texture, size: texture.size())
        //        physicsBody?.isDynamic = false
        physicsBody?.affectedByGravity  = false
        physicsBody?.categoryBitMask = PhysicsCategory.blackBall
        physicsBody?.contactTestBitMask = PhysicsCategory.bullet
        physicsBody?.collisionBitMask = 0
        physicsBody?.restitution = 0
        physicsBody?.allowsRotation = false
        physicsBody?.friction = 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    
    
}
