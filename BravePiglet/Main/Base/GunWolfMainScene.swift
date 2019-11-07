//
//  GunWolfMainScene.swift
//  BravePiglet
//
//  Created by xyk on 15/1/2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit
import SpriteKit
class GunWolfMainScene: BaseBackgroundScene {
    
    var gunShootWolf:GunWolf!
    
    override init() {
        super.init()
        
        totalWolfNum = 5
        creatWolfTime = 3.0
        currentLevel = 2
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func didMove(to view: SKView) {
        super.didMove(to: view)
       
//
        self.run(SKAction.repeatForever(SKAction.sequence([SKAction.wait(forDuration: 1.0),SKAction.run({
            [weak self] in self?.creatGunWolf()
        }),SKAction.wait(forDuration: 6.0)])), withKey: "creatGunWolf")
        
        
        
    }
    
    
    func creatGunWolf(){
        let gunWolf = GunWolf()
        gunWolf.name = "aliveWolf\(aliveWolfArr.count)"
        gunWolf.position = CGPoint(x: playableRect.minX+gunWolf.size.width/2 , y: ground.size.height+gunWolf.size.height/2+2)
        addChild(gunWolf)
        aliveWolfArr.append(gunWolf)
        gunWolf.creatRunAnimate()
        let rightMargin = playableRect.maxX - pig.frame.minX
        let point = gunWolf.destinationPoint(min: playableRect.minX + rightMargin, max: pig.frame.minX-200)
        
        let runningPath = point - gunWolf.position.x
        gunWolf.run(SKAction.sequence([SKAction.moveTo(x:point , duration:TimeInterval(runningPath/wolfSpeed)),SKAction.run({
            gunWolf.stopAnimate()
        }),SKAction.run({
            gunWolf.creatBalloonAnimate()
        }),SKAction.wait(forDuration: 0.5),SKAction.run({
            [weak self] in self?.creatBalloon(wolf: gunWolf)
        }),SKAction.run({
            [weak self] in self?.gunShot(gunWolf: gunWolf)
        })]), withKey: "wolfRun")
        
    }
    func gunShot(gunWolf:GunWolf){
        
        gunWolf.run(SKAction.run({
            gunWolf.beginShootAnimate()
            
        }))
        

    }
 
    func getBullet(){
        self.enumerateChildNodes(withName: "gun_ball") {
            node,stop in
            
            if node.frame.intersects(self.pig.frame){
                self.pigDown()
                
            }
        }
    }
    override func update(_ currentTime: TimeInterval) {
        super.update(currentTime)
        
        getBullet()
    }
    
}
