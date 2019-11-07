//
//  SceneSelectTools.swift
//  BravePiglet
//
//  Created by xyk on 28/12/2018.
//  Copyright © 2018 Mac. All rights reserved.
//

import Foundation
import SpriteKit

class SceneSelectTools {
    static let sharedSceneSelectTools = SceneSelectTools()
    
    var wolfWithBallon:String = "Wolf_balloon"
    
    var ballon:String = "balloon"
    
    var craneHorizon:String = "crane_1"
    
    var craneVertical:String = "crane_2"
    
    var ground:String = "ground"
    
    var background:String = "bj_1"
    
    var bigRoller:String = "Roller_1"
    
    var smallRoller:String = "Roller_2"
    
    var pig:String = "pig"
    
    var bullet:String = "bullet"
    
    var rope:String = "rope_2"
    
    var basket:String = "basket"
    
    var hook:String = "hook"
    
    var piece:String = "Piece"
    
    var ropeHorizon = "rope_1"
    
    var maskBackground = "masking_bj"
    
    var bird = "bird_1"
    
    var gunWolf = "gunballon"
    
    var trickWolf = "daodan_Wolf_1"
    
    var blackBall = "Balle"
    
    var parachute = "Parapluie"
    
    func setupSceneDetail(sceneIndex:Int){
        
        switch sceneIndex {
        case 0:
            craneHorizon = "crane_1"
            craneVertical = "crane_2"
            ground = "ground"
            background = "bj_1"
            rope = "rope_2"
        case 1:
            craneHorizon = "ground_2_up"
            craneVertical = "treegn2"
            ground = "ground_2_down"
            background = "bj_2"
            rope = "rope_2_1"
        default:break

        }
//
        
        
        
    }
    
    
}
