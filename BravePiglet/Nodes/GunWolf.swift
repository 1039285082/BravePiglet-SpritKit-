//
//  GunWolf.swift
//  BravePiglet
//
//  Created by xyk on 15/1/2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit
import SpriteKit

class GunWolf: Wolf {

    override init() {
        super.init()
        self.texture = SKTexture(imageNamed: SceneSelectTools.sharedSceneSelectTools.gunWolf)
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    //开始动画
    override func creatRunAnimate() {
        
        var texture:[SKTexture] = []
        for i in 1...9 {
            texture.append(SKTexture(imageNamed: "Wolf_walk_\(i)"))
        }
        
        
        run(SKAction.repeatForever(SKAction.animate(with: texture, timePerFrame: 0.1, resize: false, restore: true)), withKey: "running")
    }
    //吹气球动画
   override func creatBalloonAnimate(){
        var texture:[SKTexture] = []
        for i in 1...4 {
            texture.append(SKTexture(imageNamed: "Wolf_gun_blow_\(i)"))
        }
        run(SKAction.animate(with: texture, timePerFrame: 0.2, resize: false, restore: true))
        
    }
    func beginShootAnimate(){
        var texture:[SKTexture] = []
        for i in 1...6 {
            texture.append(SKTexture(imageNamed: "Wolf_gun_\(i)"))
        }
        run(SKAction.repeat(SKAction.sequence([SKAction.wait(forDuration: 0.2),SKAction.animate(with: texture, timePerFrame: 0.2, resize: false, restore: true),SKAction.run({
            [weak self] in self?.creatBullet()
        }),SKAction.wait(forDuration: 0.2)]), count: 3))

        
        
    }
    func creatBullet(){
        print("123")
        let bullet = SKSpriteNode(imageNamed: "gun_ball")
        bullet.name = "gun_ball"
        bullet.position = self.position
        self.parent?.addChild(bullet)
        bullet.run(SKAction.moveTo(x: (self.parent?.scene?.size.width)!, duration: 1.0))
    }
    
}
