//
//  CraneVertical.swift
//  BravePiglet
//
//  Created by Mac on 27/12/2018.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit
import SpriteKit
class CraneVertical: BaseSpriteNode {

    
    init() {
        let texture = SKTexture(imageNamed: SceneSelectTools.sharedSceneSelectTools.craneVertical)
        
        super.init(texture: texture, color: .clear, size: texture.size())
        physicsBody = SKPhysicsBody(texture: texture, size: texture.size())
        isUserInteractionEnabled = false
        physicsBody?.isDynamic = false
        zPosition = 40
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
