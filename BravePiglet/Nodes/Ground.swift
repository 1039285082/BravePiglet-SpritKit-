//
//  Ground.swift
//  BravePiglet
//
//  Created by xyk on 28/12/2018.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit
import SpriteKit

class Ground: BaseSpriteNode {

    init() {
        let texture = SKTexture(imageNamed: SceneSelectTools.sharedSceneSelectTools.ground)
        
        super.init(texture: texture, color: .clear, size: texture.size())
//        physicsBody = SKPhysicsBody(rectangleOf: texture.size())
        physicsBody = SKPhysicsBody(texture: texture, size: texture.size())
        physicsBody?.isDynamic = false
        zPosition = 100
        physicsBody?.categoryBitMask = PhysicsCategory.ground
        physicsBody?.contactTestBitMask = PhysicsCategory.wolf | PhysicsCategory.blackBall
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
}
