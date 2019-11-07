//
//  Pig.swift
//  BravePiglet
//
//  Created by xyk on 29/12/2018.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit
import SpriteKit
class Pig: BaseSpriteNode {

    
    init() {
        let texture = SKTexture(imageNamed: SceneSelectTools.sharedSceneSelectTools.pig)
        
        super.init(texture: texture, color: .clear, size: texture.size())
       
        
        zPosition = 50
        //        speed = 20
//        physicsBody = SKPhysicsBody(texture: texture, size: texture.size())
//        //        physicsBody!.velocity = CGVector(dx: 0, dy: 2000)
//        //        physicsBody?.isDynamic = false
//        
//        //                balloon.physicsBody?.isDynamic = false
//        physicsBody?.affectedByGravity  = false
//        physicsBody?.categoryBitMask = PhysicsCategory.pig
//        physicsBody?.contactTestBitMask = PhysicsCategory.bird
//        physicsBody?.collisionBitMask = 0
//        physicsBody?.restitution = 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    func shotAnimate(){
        
        var texture:[SKTexture] = []
        for i in 1...7 {
            texture.append(SKTexture(imageNamed: "pig_\(i)"))
        }
        texture.append(texture[5])
        texture.append(texture[4])
        texture.append(texture[3])
        texture.append(texture[2])
        texture.append(texture[1])
        run(SKAction.animate(with: texture, timePerFrame: 0.1))
    }
    
    
}
