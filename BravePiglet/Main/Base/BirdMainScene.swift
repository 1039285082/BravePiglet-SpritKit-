//
//  Xmain.swift
//  BravePiglet
//
//  Created by Mac on 25/12/2018.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit
import SpriteKit
class BirdMainScene: BaseBackgroundScene {

    override init() {
        super.init()
        totalWolfNum = 3
         creatWolfTime = 3.0
        currentLevel = 1
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView) {
       
        super.didMove(to: view)

       
        
        
        self.run(SKAction.repeatForever(SKAction.sequence([SKAction.run {
            [weak self] in self?.creatBird()
            },SKAction.wait(forDuration: 5.0)])))
        
        
    }
    func creatBird() {
        let bird = Bird()
        bird.name = "bird"
        bird.position = CGPoint(x: playableRect.minX+bird.size.width/2, y: random(min: self.size.height/2, max: crane1.frame.minY))
        addChild(bird)
        bird.creatFlyAnimate()
        bird.run(SKAction.sequence([SKAction.moveTo(x: playableRect.maxX, duration: 5.0),SKAction.removeFromParent()]))
        
    }
    func getBird(){
        
        self.enumerateChildNodes(withName: "bird") {
            node,stop in
            let birdNode = node as! Bird
            if birdNode.frame.intersects(self.pig.frame){
                self.pigDown()
                
            }
            
            
        }
        
        
    }
    
    func random(min:CGFloat,max:CGFloat)-> CGFloat {
        
        return CGFloat(Float(arc4random()) / Float(UInt32.max)) * (max - min) + min
        
    }
    override func update(_ currentTime: TimeInterval) {
        super.update(currentTime)
        getBird()
    }
}
