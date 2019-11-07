//
//  CraneHorizon.swift
//  BravePiglet
//
//  Created by Mac on 27/12/2018.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit
import SpriteKit
class CraneHorizon: BaseSpriteNode {

   
    
    
    init() {
        let texture = SKTexture(imageNamed: SceneSelectTools.sharedSceneSelectTools.craneHorizon)
        
    super.init(texture: texture, color: .clear, size: texture.size())
//       isUserInteractionEnabled = true
//        physicsBody = SKPhysicsBody(rectangleOf: texture.size())
//        physicsBody?.categoryBitMask = PhysicsCategory.beforeCraneHorizon
//         physicsBody?.isDynamic = false
        zPosition = 45
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
