//
//  Bullet.swift
//  BravePiglet
//
//  Created by xyk on 29/12/2018.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit
import SpriteKit
class Bullet: BaseSpriteNode {

    init() {
        let texture = SKTexture(imageNamed: SceneSelectTools.sharedSceneSelectTools.bullet)
        
        super.init(texture: texture, color: .clear, size: texture.size())
        
        zPosition = 50
        physicsBody = SKPhysicsBody(circleOfRadius: texture.size().width/4)
        physicsBody!.velocity = CGVector(dx: -2000, dy: 0)
        physicsBody?.isDynamic = false
//
//        //                balloon.physicsBody?.isDynamic = false
        physicsBody?.affectedByGravity  = false
        physicsBody?.categoryBitMask = PhysicsCategory.bullet
        physicsBody?.contactTestBitMask = PhysicsCategory.wolf | PhysicsCategory.balloon
//        physicsBody?.collisionBitMask = 0
         physicsBody?.collisionBitMask = 0  
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
}
