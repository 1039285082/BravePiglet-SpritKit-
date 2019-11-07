//
//  TrickWolf.swift
//  BravePiglet
//
//  Created by xyk on 16/1/2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit
import SpriteKit
class TrickWolf: BaseSpriteNode {

    init() {
        let texture = SKTexture(imageNamed: SceneSelectTools.sharedSceneSelectTools.trickWolf)
        
        super.init(texture: texture, color: .clear, size: texture.size())
        
        zPosition = 50
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    
    func createRunAnimate(){
        var texture:[SKTexture] = []
        for i in 1...4 {
            texture.append(SKTexture(imageNamed: "daodan_Wolf_\(i)"))
        }
        
        
        run(SKAction.repeatForever(SKAction.animate(with: texture, timePerFrame: 0.1, resize: false, restore: true)), withKey: "trickWolfRun")
        
        
    }
    func random(min:CGFloat,max:CGFloat)-> CGFloat {
     
        
        return CGFloat(Float(arc4random()) / Float(UInt32.max)) * (max - min) + min
        
    }
    
    func creatBalloonAnimate(){
        
        var texture:[SKTexture] = []
        for i in 1...4 {
            texture.append(SKTexture(imageNamed: "daodan_Wolf_balloon_\(i)"))
        }
        run(SKAction.animate(with: texture, timePerFrame: 0.2, resize: false, restore: true))
        
        
    }
    func stopRunAnimate(){
        removeAction(forKey: "trickWolfRun")
    }
    
    
    func trunAroundAnimate(){
        
        var texture:[SKTexture] = []
        for i in 1...7 {
            texture.append(SKTexture(imageNamed: "turn_Wolf_\(i)"))
        }
        run(SKAction.animate(with: texture, timePerFrame: 0.2, resize: true, restore: false))
        
    }
    func createRunBackAnimate(){
        var texture:[SKTexture] = []
        for i in 1...4 {
            texture.append(SKTexture(imageNamed: "daodan_WolfBack_\(i)"))
        }
        run(SKAction.repeatForever(SKAction.animate(with: texture, timePerFrame: 0.1, resize: false, restore: true)), withKey: "trickWolfRunBack")
        
    }
    
    
}
