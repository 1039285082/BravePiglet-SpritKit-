//
//  LevelScene.swift
//  BravePiglet
//
//  Created by Mac on 25/12/2018.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit
import SpriteKit
class LevelScene: MenuScene {

    var sceneIndex = 0
    
    var isPassLevel = true
    
    var sound = SoundManager.sharedSoundManager()
 
    override func didMove(to view: SKView) {
        
        sound.creatSelectSceneBackMusic()
        
       creatLevel()
        
    }
    func creatLevel(){
      
        let backNode = SKSpriteNode(imageNamed: "back")
        backNode.name = "back"
        backNode.position = CGPoint(x: playableRect.minX + 2*backNode.size.width, y: playableRect.maxY-2*backNode.size.height)
        addChild(backNode)
        
        
        
        
        
        
        if sceneIndex == 0 {
            
            let sceneNode = SKSpriteNode(imageNamed: "Scenes_1")
            sceneNode.name = "sceneNode"
            sceneNode.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
            
            addChild(sceneNode)
            
            let rightNode = SKSpriteNode(imageNamed: "right")
            rightNode.name = "right"
            rightNode.position = CGPoint(x: playableRect.maxX - 2*rightNode.size.width, y: self.size.height/2)
            addChild(rightNode)
            isPassLevel = true
            
        }
        if sceneIndex == 1 {
            let sceneNode = SKSpriteNode(imageNamed: "Scenes_2_black")
            sceneNode.name = "sceneNode"
            sceneNode.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
            
            addChild(sceneNode)
            
            let leftNode = SKSpriteNode(imageNamed: "left")
            leftNode.name = "left"
            leftNode.position = CGPoint(x: playableRect.minX + 2*leftNode.size.width, y: self.size.height/2)
            addChild(leftNode)
            
            
        }
        
        
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            let sp = self.nodes(at: touch.location(in: self)).first as! SKSpriteNode
            
            if sp.name == "back"{
            
                let scene = SceneManager.sharedSceneManager().selectScenen(name: "menu")
                self.view?.presentScene(scene)
                
                
            }
            if sp.name == "right"{
                
                let scene = SceneManager.sharedSceneManager().creatLevelScene(sceneIndex: sceneIndex+1)
                self.view?.presentScene(scene)
                
            }
            if sp.name == "left"{
                
                let scene = SceneManager.sharedSceneManager().creatLevelScene(sceneIndex: sceneIndex-1) as! LevelScene
//                scene.isPassLevel = true
                
                self.view?.presentScene(scene)
                
            }
            if sp.name == "sceneNode"{
                
//                if isPassLevel{
//                    let scene = SceneManager.sharedSceneManager().selectScenen(name: "play") as! BaseBackgroundScene
//                    scene.sceneIndex = sceneIndex
//
                SceneSelectTools.sharedSceneSelectTools.setupSceneDetail(sceneIndex: sceneIndex)
                let scene = SceneManager.sharedSceneManager().creatWinLoseScene(currentLevel: 0,sceneIndex: sceneIndex) as! BaseBackgroundScene
                scene.sceneIndex = sceneIndex
                    self.view?.presentScene(scene)
//                }
                
            }
            
            
        }
       
    }
    override func willMove(from view: SKView) {
        sound.stopSelectSceneBackMusic()
    }
}
