//
//  Bird.swift
//  BravePiglet
//
//  Created by xyk on 14/1/2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit
import SpriteKit
class Bird: BaseSpriteNode {

    
    init() {
        let texture = SKTexture(imageNamed: SceneSelectTools.sharedSceneSelectTools.bird)
        
        super.init(texture: texture, color: .clear, size: texture.size())
        
        zPosition = 50

    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    func creatFlyAnimate(){
        
        var texture:[SKTexture] = []
        for i in 1...3 {
            texture.append(SKTexture(imageNamed: "bird_\(i)"))
        }
//        texture.append(texture[1])
        run(SKAction.repeatForever(SKAction.animate(with: texture, timePerFrame: 0.25)))

        
    }
    
  
}
