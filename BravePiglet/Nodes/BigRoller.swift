//
//  BigRoller.swift
//  BravePiglet
//
//  Created by xyk on 28/12/2018.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit
import SpriteKit
class BigRoller: BaseSpriteNode {

    init() {
        let texture = SKTexture(imageNamed: SceneSelectTools.sharedSceneSelectTools.bigRoller)
        
        super.init(texture: texture, color: .clear, size: texture.size())
//        physicsBody = SKPhysicsBody(rectangleOf: texture.size())
//        physicsBody?.isDynamic = false
        zPosition = 41
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
}
