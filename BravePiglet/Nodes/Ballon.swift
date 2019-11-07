//
//  Ballon.swift
//  BravePiglet
//
//  Created by Mac on 28/12/2018.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit
import SpriteKit

class Ballon: BaseSpriteNode {

    init() {
        let texture = SKTexture(imageNamed: SceneSelectTools.sharedSceneSelectTools.ballon)
        
        super.init(texture: texture, color: .clear, size: texture.size())
        
        zPosition = 50
//        speed = 20
        physicsBody = SKPhysicsBody(texture: texture, size: texture.size())
//        physicsBody!.velocity = CGVector(dx: 0, dy: 2000)
//        physicsBody?.isDynamic = false
        
        //                balloon.physicsBody?.isDynamic = false
        physicsBody?.affectedByGravity  = false
        physicsBody?.categoryBitMask = PhysicsCategory.balloon
        physicsBody?.contactTestBitMask = PhysicsCategory.bullet
        physicsBody?.collisionBitMask = 0
         physicsBody?.restitution = 0
//        physicsBody?.density = 0.1
//        physicsBody?.allowsRotation = false
    }
    //开始动画
    func BiggerAnimate() {
        
        var texture:[SKTexture] = []
        for i in 1...3 {
            texture.append(SKTexture(imageNamed: "balloon_\(i)"))
        }
        
        run((SKAction.animate(with: texture, timePerFrame: 0.1)), withKey: "bigger")
       
    }
    func stopAnimate(){
         removeAction(forKey: "bigger")
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
}
