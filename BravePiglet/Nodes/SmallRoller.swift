//
//  SmallRoller.swift
//  BravePiglet
//
//  Created by xyk on 28/12/2018.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit
import SpriteKit
class SmallRoller: BaseSpriteNode {

    
    init() {
        let texture = SKTexture(imageNamed: SceneSelectTools.sharedSceneSelectTools.smallRoller)
        
        super.init(texture: texture, color: .clear, size: texture.size())
        
        zPosition = 150
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    
}
