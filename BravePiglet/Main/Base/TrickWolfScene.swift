//
//  TrickWolfScene.swift
//  BravePiglet
//
//  Created by xyk on 16/1/2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit
import SpriteKit

class TrickWolfScene: BaseBackgroundScene {

    override init() {
        super.init()
        
        totalWolfNum = 3
        creatWolfTime = 3.0
        currentLevel = 3
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func didMove(to view: SKView) {
        super.didMove(to: view)

        
        self.run(SKAction.repeatForever(SKAction.sequence([SKAction.wait(forDuration: 1.0),SKAction.run({
            [weak self] in self?.creatTrickWolf()
        }),SKAction.wait(forDuration: 6.0)])))
        
        
        
    }
    
    func creatTrickWolf() {
        let trickWolf = TrickWolf()
        trickWolf.position = CGPoint(x: playableRect.minX+trickWolf.size.width/2, y: ground.size.height+trickWolf.size.height/2+2)
        addChild(trickWolf)
        trickWolf.createRunAnimate()
        let rightMargin = playableRect.maxX - pig.frame.minX
        let point = trickWolf.random(min: playableRect.minX + rightMargin, max: pig.frame.minX-200)
        
        let runningPath = point - trickWolf.position.x

        trickWolf.run(SKAction.sequence([SKAction.moveTo(x:point , duration:TimeInterval(runningPath/(wolfSpeed*2))),SKAction.run({
            trickWolf.stopRunAnimate()
        }),SKAction.run({
            trickWolf.creatBalloonAnimate()
        }),SKAction.wait(forDuration: 0.5),SKAction.run({
            [weak self] in self?.creatTrickBallon(trickWolf: trickWolf)
        }),SKAction.run({
            trickWolf.trunAroundAnimate()
        }),SKAction.run({
            trickWolf.createRunBackAnimate()
        }),SKAction.moveTo(x: playableRect.minX-trickWolf.size.width/2, duration: TimeInterval(runningPath/(wolfSpeed*2))),SKAction.removeFromParent()]))
        
       
    }
    func creatTrickBallon(trickWolf:TrickWolf){
        
        let balloon = Ballon()
        balloon.texture = SKTexture(imageNamed: "balloon_222")
        balloon.position = CGPoint(x: trickWolf.position.x+balloon.size.width/2, y:trickWolf.frame.maxY+balloon.size.height/2)
        
        addChild(balloon)
        balloon.run(SKAction.sequence([SKAction.moveTo(y: self.size.height+balloon.size.height/2, duration: 8.0),SKAction.wait(forDuration: 2.0),SKAction.removeFromParent()]))
        
        
    }
    
    
    
}
