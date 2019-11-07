//
//  FailedNode.swift
//  BravePiglet
//
//  Created by xyk on 12/1/2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit
import SpriteKit

protocol failedDelegate {
    func returnFailedBtnClick(btnName:String)
}
class FailedNode: BaseSpriteNode {
    
    var levelLabel = SKLabelNode()
    var failedDelegate:failedDelegate?
    
    
    init() {
        let texture = SKTexture(imageNamed: SceneSelectTools.sharedSceneSelectTools.maskBackground)
        
        super.init(texture: texture, color: .clear, size: texture.size())
        zPosition = 1000
//        anchorPoint = CGPoint.zero
        let bj = SKSpriteNode(imageNamed: "lose_en")
        bj.position = CGPoint(x: 0, y: 0)
        bj.zPosition = 1001
        addChild(bj)
        
        
        levelLabel = SKLabelNode()
        levelLabel.zPosition = 1002
        levelLabel.position = CGPoint(x: 0, y: -150)
        levelLabel.text = "Level 3"
        levelLabel.fontSize = 60
        levelLabel.fontColor = .white
    
        levelLabel.verticalAlignmentMode = SKLabelVerticalAlignmentMode.center
        levelLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
        bj.addChild(levelLabel)
        
        
        let restart = SKSpriteNode(imageNamed: "replay")
        let menu = SKSpriteNode(imageNamed: "menu")
        restart.zPosition = 1002
        menu.zPosition = 1002
        restart.position = CGPoint(x: -bj.size.width/4 , y: -250)
        bj.addChild(restart)
        
        restart.name = "restart"
        menu.name = "menu"
        menu.position = CGPoint(x:bj.size.width/4, y: -250)
        bj.addChild(menu)
        
        let Backstar1 = SKSpriteNode(imageNamed: "star_black_2")
        Backstar1.position = CGPoint(x: -360, y: 255)
        
        bj.addChild(Backstar1)
        
        let Backstar2 = SKSpriteNode(imageNamed: "star_black_3")
        Backstar2.position = CGPoint(x: 0, y: 270)
        bj.addChild(Backstar2)
        
        let Backstar3 = SKSpriteNode(imageNamed: "star_black_1")
        Backstar3.position = CGPoint(x: 360, y: 255)
        bj.addChild(Backstar3)
        
        Backstar1.zPosition = 1002
        Backstar2.zPosition = 1002
        Backstar3.zPosition = 1002
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let sp = self.nodes(at: touch.location(in: self)).first as? SKSpriteNode
            switch sp?.name {
            case "menu":
                failedDelegate?.returnFailedBtnClick(btnName: "menu")
                self.removeFromParent()
            case "restart":
                 failedDelegate?.returnFailedBtnClick(btnName: "restart")
                self.removeFromParent()
            default:break
            }
            
            
        }
    }
    
}
