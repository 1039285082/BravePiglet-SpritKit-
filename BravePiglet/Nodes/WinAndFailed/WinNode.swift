//
//  WinNode.swift
//  BravePiglet
//
//  Created by xyk on 12/1/2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit
import SpriteKit

protocol winDelegate {
    func returnWinBtnClick(btnName:String)
}

class WinNode: BaseSpriteNode {
    
    
    var levelLabel = SKLabelNode()
    
    var winDelegate:winDelegate?
    
    
    init() {
        let texture = SKTexture(imageNamed: SceneSelectTools.sharedSceneSelectTools.maskBackground)
        
        super.init(texture: texture, color: .clear, size: texture.size())
        zPosition = 1000
        //        anchorPoint = CGPoint.zero
        let bj = SKSpriteNode(imageNamed: "win_en")
        bj.position = CGPoint(x: 0, y: 0)
        bj.zPosition = 1001
        addChild(bj)
        
        
        levelLabel = SKLabelNode()
        levelLabel.zPosition = 1002
        levelLabel.position = CGPoint(x: 0, y: -120)
        levelLabel.text = "Level 3"
        levelLabel.fontSize = 60
        levelLabel.fontColor = .white
        
        levelLabel.verticalAlignmentMode = SKLabelVerticalAlignmentMode.center
        levelLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
        bj.addChild(levelLabel)
        
        
        let restart = SKSpriteNode(imageNamed: "replay")
        let menu = SKSpriteNode(imageNamed: "menu")
        let next = SKSpriteNode(imageNamed: "next")
        
        restart.zPosition = 1002
        menu.zPosition = 1002
        next.zPosition = 1002
        restart.position = CGPoint(x: -bj.size.width/3 , y: -250)
        bj.addChild(restart)
        
        restart.name = "restart"
        menu.name = "menu"
        next.name = "next"
        menu.position = CGPoint(x:bj.size.width/3, y: -250)
        next.position = CGPoint(x: 0, y: -250)
        bj.addChild(next)
        
        bj.addChild(menu)
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let sp = self.nodes(at: touch.location(in: self)).first as? SKSpriteNode
            switch sp?.name {
            case "next":
                winDelegate?.returnWinBtnClick(btnName: "next")
                self.removeFromParent()
            case "menu":
                winDelegate?.returnWinBtnClick(btnName: "menu")
                self.removeFromParent()
            case "restart":
                winDelegate?.returnWinBtnClick(btnName: "restart")
                self.removeFromParent()
            default:break
            }
            
            
        }
        
        
    }
    
}
