//
//  SceneManager.swift
//  BravePiglet
//
//  Created by Mac on 25/12/2018.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit
import SpriteKit

class SceneManager: NSObject {

    let sceneSize = CGSize(width: 2732, height: 2048)
    
    static let instance:SceneManager = SceneManager()
    class func sharedSceneManager() ->SceneManager{
        
        return instance
    }
    
    func selectScenen(name:String) -> SKScene {
        switch name {
        case "menu":
            let scene = MenuScene()
            scene.size = sceneSize
            scene.scaleMode = .aspectFill
            return scene
        case "play":
            let scene = BaseBackgroundScene()
            scene.size = sceneSize
            scene.view?.isMultipleTouchEnabled = true
            scene.scaleMode = .aspectFill
            return scene
        case "level":
            let scene = LevelScene()
            scene.size = sceneSize
            scene.scaleMode = .aspectFill
            return scene
            
        default:
            break
        }
        return SKScene()
    }
    
    func creatLevelScene(sceneIndex: Int) -> SKScene {
        let scene = LevelScene()
        scene.sceneIndex = sceneIndex
        scene.isPassLevel = false
        scene.size = sceneSize
        scene.scaleMode = .aspectFill
        return scene
        
    }
    func creatWinLoseScene(currentLevel:Int,sceneIndex:Int) -> SKScene {
        
        switch currentLevel {
        case 0:
            let scene = BaseBackgroundScene()
            scene.sceneIndex = sceneIndex
            scene.size = sceneSize
            scene.scaleMode = .aspectFill
            return scene
        case 1:
            let scene = BirdMainScene()
            scene.size = sceneSize
            scene.sceneIndex = sceneIndex
            scene.scaleMode = .aspectFill
            return scene
        case 2:
            let scene = GunWolfMainScene()
            scene.size = sceneSize
            scene.sceneIndex = sceneIndex
            scene.scaleMode = .aspectFill
            return scene
        case 3:
            let scene = TrickWolfScene()
            scene.size = sceneSize
            scene.sceneIndex = sceneIndex
            scene.scaleMode = .aspectFill
            return scene
        case 4:
            let scene = LockScene()
            scene.size = sceneSize
            scene.sceneIndex = sceneIndex
            scene.scaleMode = .aspectFill
            return scene
            
        default:break
            
            
        }
        
        return SKScene()
        
    }
    
    
}
