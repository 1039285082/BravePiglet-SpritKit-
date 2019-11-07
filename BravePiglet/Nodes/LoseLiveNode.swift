//
//  LoseLiveNode.swift
//  BravePiglet
//
//  Created by xyk on 7/1/2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit
import SpriteKit
class LoseLiveNode: BaseSpriteNode {

    
    init() {
        
        let texture = SKTexture(imageNamed: SceneSelectTools.sharedSceneSelectTools.ropeHorizon)
        
        super.init(texture: texture, color: .clear, size: texture.size())
        zPosition = 100
        
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
}
