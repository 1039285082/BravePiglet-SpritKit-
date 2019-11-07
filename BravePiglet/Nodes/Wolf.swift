//
//  Wolf.swift
//  BravePiglet
//
//  Created by Mac on 27/12/2018.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit
import SpriteKit
class Wolf: BaseSpriteNode {
    
    var hitNum = 0
    
    
    
     init() {
        
        let texture = SKTexture(imageNamed: SceneSelectTools.sharedSceneSelectTools.wolfWithBallon)
        
        super.init(texture: texture, color: .clear, size: texture.size())
        zPosition = 50
//        speed = 20
        setScale(0.5)
        physicsBody = SKPhysicsBody(texture: texture, size: CGSize(width: texture.size().width*0.5, height: texture.size().height*0.5))
//        physicsBody?.isDynamic = false
        physicsBody?.affectedByGravity  = false
        physicsBody?.categoryBitMask = PhysicsCategory.wolf
        physicsBody?.contactTestBitMask = PhysicsCategory.bullet | PhysicsCategory.breakWolfBall
        physicsBody?.collisionBitMask = 0
        physicsBody?.restitution = 0
        physicsBody?.allowsRotation = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    func creatPowerRight(){
        
        physicsBody?.velocity = CGVector(dx: 500, dy: 0)
        
    }
    //开始动画
    func creatRunAnimate() {
        
        var texture:[SKTexture] = []
        for i in 1...4 {
            texture.append(SKTexture(imageNamed: "Wolf_\(i)"))
        }
        texture.append(texture[2])
        texture.append(texture[1])

        run(SKAction.repeatForever(SKAction.animate(with: texture, timePerFrame: 0.1, resize: false, restore: true)), withKey: "running")
    }
    
    //吹气球动画
    func creatBalloonAnimate(){
        var texture:[SKTexture] = []
        for i in 1...4 {
            texture.append(SKTexture(imageNamed: "blow_balloon_\(i)"))
        }
        run(SKAction.animate(with: texture, timePerFrame: 0.2, resize: false, restore: true))
        
    }
    //掉落动画
    func fallAnimate(){
        var texture:[SKTexture] = []
        for i in 1...4 {
            texture.append(SKTexture(imageNamed: "leg_\(i)"))
        }
        run(SKAction.animate(with: texture, timePerFrame: 0.1))
        
    }
   
    //MARK: 停止动画
    func stopAnimate(){
        removeAction(forKey: "running")
    }
    
    //MARK: 剪绳子动画
    func cutRope(){
        speed = 0
        var texture:[SKTexture] = []
        for i in 1...3 {
            texture.append(SKTexture(imageNamed: "Wolf_scissors_\(i)"))
        }
        run(SKAction.animate(with: texture, timePerFrame: 0.1, resize: false, restore: true))
        
    }
    
    func destinationPoint(min:CGFloat,max:CGFloat)-> CGFloat {
//        let radio:CGFloat = CGFloat(arc4random()) / (CGFloat)(Int32.max)
//        let radio = CGFloat(arc)
        
          return CGFloat(Float(arc4random()) / Float(UInt32.max)) * (max - min) + min
        
    }
    
    func changeDownState(){
        
        physicsBody?.affectedByGravity  = true
        //        physicsBody?.isDynamic = false
        //        physicsBody?.density = 0
        physicsBody?.categoryBitMask = PhysicsCategory.wolf
        physicsBody?.contactTestBitMask = PhysicsCategory.ground
        physicsBody?.collisionBitMask = PhysicsCategory.ground
    }
    
    
    
    
    
}
