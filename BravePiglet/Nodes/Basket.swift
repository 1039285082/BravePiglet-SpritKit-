//
//  Basket.swift
//  BravePiglet
//
//  Created by xyk on 5/1/2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit
import SpriteKit
class Basket: BaseSpriteNode {

    init() {
        
        let texture = SKTexture(imageNamed: SceneSelectTools.sharedSceneSelectTools.basket)
        
        super.init(texture: texture, color: .clear, size: texture.size())
        zPosition = 40
//        physicsBody = SKPhysicsBody(texture: texture, size: texture.size())
//        physicsBody?.affectedByGravity  = false
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    func fallDownAnimate(){
       
         var texture:[SKTexture] = []
        for i in 1...5 {
            texture.append(SKTexture(imageNamed: "pig_Drop_\(i)"))
        }
        run(SKAction.animate(with: texture, timePerFrame: 0.1, resize: false, restore: true))
            
        }
        
  
    
}
