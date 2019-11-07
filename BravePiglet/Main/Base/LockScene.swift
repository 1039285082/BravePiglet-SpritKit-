//
//  LockScene.swift
//  BravePiglet
//
//  Created by xyk on 17/1/2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit
import SpriteKit

class LockScene: BaseBackgroundScene {
    
    var blackBall:BlackBall!
    
    var parachute:Parachute!
    
    var gainBlackBallNum = 0
    
    var creatBlackBallNum = 1
    
    var blackBallLabel = SKLabelNode()
    
    override init() {
        super.init()
        
        totalWolfNum = 20
        creatWolfTime = 1.0
        currentLevel = 4
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        creatParachute()
    }
    func creatParachute(){
    
        blackBall = BlackBall()
        blackBall.name = "blackBall"
        
        parachute = Parachute()
        
        blackBall.position = CGPoint(x:pig.frame.minX - parachute.size.width*2 , y: self.playableRect.maxY - blackBall.size.height/2-200)
        
        parachute.position = CGPoint(x: blackBall.position.x, y: blackBall.frame.maxY + parachute.size.height/2)
        
        addChild(blackBall)
        
        addChild(parachute)
        
        let joint = SKPhysicsJointFixed.joint(withBodyA: parachute.physicsBody!, bodyB: blackBall.physicsBody!, anchor: CGPoint(x: parachute.position.x, y: blackBall.frame.maxY))
        physicsWorld.add(joint)
        
        parachute.run(SKAction.moveTo(y: 0, duration: 10.0))
        
    }
    
    func creatBlackBall(){
        
    
        if self.childNode(withName: "blackBall") == nil {
         
            if gainBlackBallNum != 0 {
                
                blackBall = BlackBall()
                
                blackBall.physicsBody?.categoryBitMask = PhysicsCategory.none
                
                blackBall.name = "blackBall"
                
                
                blackBall.position = CGPoint(x: crane2.position.x+50, y: playableRect.minY+2*blackBall.size.width)
                
                blackBall.zPosition = 1000
                
                addChild(blackBall)
                
                print("\(blackBall)")
                
                blackBallLabel = SKLabelNode()
                
                blackBallLabel.zPosition = 1000
                
                blackBallLabel.fontSize = blackBall.size.height
                
                
                
                blackBallLabel.text = "x\(gainBlackBallNum)"
                
                blackBallLabel.fontColor = .white
                
                blackBallLabel.verticalAlignmentMode = SKLabelVerticalAlignmentMode.center
                
                blackBallLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
                
                blackBallLabel.position = CGPoint(x: blackBall.frame.maxX+50, y: blackBall.position.y)
                
                addChild(blackBallLabel)
                
            }
 
        }
        
        
        
       

        
    }
    
    func getBlackBall(){
    
        if gainBlackBallNum == 0 {
//            blackBall.removeFromParent()
            blackBallLabel.removeFromParent()
        }else{
            blackBallLabel.text = "x\(gainBlackBallNum)"
            
            
            
            
        }
        
        
        
    }
    
    func breakWolfWithBlackBall(){
        
        if gainBlackBallNum != 0 {
            
            if self.childNode(withName: "breakWolfBall") == nil {
                

               
                
                self.enumerateChildNodes(withName: "wolfWin", using: {
                    node,stop in
                    
                    let wolf = node as! Wolf
                    
                    if wolf.position.y > self.crane1.position.y{
                        let ball = BlackBall()
                        ball.name = "breakWolfBall"
                        ball.physicsBody?.categoryBitMask = PhysicsCategory.breakWolfBall
                        
                        ball.position = CGPoint(x: self.playableRect.maxX + ball.size.width, y: self.crane1.frame.maxY + ball.size.height)
                        
                        self.addChild(ball)
                        
                        ball.run(SKAction.moveTo(x: self.playableRect.minX-ball.size.width/2, duration: 2.0))
                        
                        self.gainBlackBallNum -= 1
                        
                    }
                    
                   
                })
                
            }
            
            
            
        }
        
        
        
        
        
        
    }
    
    
    override func didBegin(_ contact: SKPhysicsContact) {
        super.didBegin(contact)
        let bodyA:SKPhysicsBody
        let bodyB:SKPhysicsBody
        if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask {
            bodyA = contact.bodyA
            bodyB = contact.bodyB
        }else{
            bodyA = contact.bodyB
            bodyB = contact.bodyA
        }
        
        
        if bodyA.categoryBitMask == PhysicsCategory.bullet && bodyB.categoryBitMask == PhysicsCategory.blackBall {
            
              bodyA.categoryBitMask = PhysicsCategory.none /// 去除双响;
            
            let skemeterNode = SKEmitterNode(fileNamed: "BlackBallParticle.sks")
            
            skemeterNode?.particleSize=(bodyA.node?.frame.size)!
            skemeterNode!.position = (bodyA.node?.position)!
            skemeterNode?.zPosition = 60
            self.addChild(skemeterNode!)
            
            bodyB.node?.removeFromParent()
            
            gainBlackBallNum += 1
           
            creatBlackBall()
//            skemeterNode?.run(SKAction.sequence([SKAction.wait(forDuration: 3.0),SKAction.removeFromParent()]))
            
        }
        
        if bodyA.categoryBitMask == PhysicsCategory.ground && bodyB.categoryBitMask == PhysicsCategory.blackBall{
            
              bodyB.categoryBitMask = PhysicsCategory.none /// 去除多次碰撞;
            bodyB.node?.removeFromParent()
        }
        
        if bodyA.categoryBitMask == PhysicsCategory.wolf && bodyB.categoryBitMask == PhysicsCategory.breakWolfBall {
            
            let wolf = bodyA.node as! Wolf
            wolf.removeAllActions()
            
            wolf.run(SKAction.rotate(toAngle: CGFloat(M_PI), duration: 0.2))
            wolf.changeDownState()
            wolf.name = "deadWolf"
            
        }
        
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        super.update(currentTime)
        getBlackBall()
        breakWolfWithBlackBall()
    }
}
