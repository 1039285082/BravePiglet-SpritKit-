//
//  Piece.swift
//  BravePiglet
//
//  Created by xyk on 5/1/2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit
import SpriteKit
class Piece: BaseSpriteNode {

    init() {
        
        let texture = SKTexture(imageNamed: SceneSelectTools.sharedSceneSelectTools.piece)
        
        super.init(texture: texture, color: .clear, size: texture.size())
        zPosition = 40
        
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    
}
