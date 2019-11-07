//
//  SoundManager.swift
//  BravePiglet
//
//  Created by xyk on 16/1/2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit
import SpriteKit
import AVFoundation
class SoundManager: SKNode {

    var selectSceneBackSound:AVAudioPlayer?
    var playBackSound:AVAudioPlayer?
    
    var backUrl:URL!
    var playBackUrl:URL!
    
  
    static let instance:SoundManager = SoundManager()
    class func sharedSoundManager() -> SoundManager {
        return instance
    }
    
    func creatSelectSceneBackMusic()  {
        
        
        
        backUrl = Bundle.main.url(forResource: "brave-piglet2-selectScene-bg", withExtension: "mp3")!
        
        do{
            selectSceneBackSound = try AVAudioPlayer(contentsOf: backUrl!)
            
            //设置为循环播放(
            selectSceneBackSound!.numberOfLoops = 0
            
            selectSceneBackSound!.volume = 1.0
            //准备播放音乐
            selectSceneBackSound!.prepareToPlay()
            //播放音乐
            selectSceneBackSound!.play()
            //            backSound = nil
        }catch let error{
            print(error.localizedDescription)
        }
        
    }
    func stopSelectSceneBackMusic(){
        selectSceneBackSound?.stop()
    }
    
    func creatSceneBackMusic(scene:Int){
        switch scene {
        case 0:
            playBackUrl = Bundle.main.url(forResource: "brave-piglet-scene1-bg", withExtension: ".m4a")!
        default:break
        }
        
        do{
            playBackSound = try AVAudioPlayer(contentsOf: playBackUrl!)
            
            //设置为循环播放(
            playBackSound!.numberOfLoops = 0
            
            playBackSound!.volume = 1.0
            //准备播放音乐
            playBackSound!.prepareToPlay()
            //播放音乐
            playBackSound!.play()
            //            backSound = nil
        }catch let error{
            print(error.localizedDescription)
        }
        
        
    }
    
}
