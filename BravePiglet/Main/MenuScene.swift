//
//  MenuScene.swift
//  BravePiglet
//
//  Created by Mac on 25/12/2018.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit
import SpriteKit


class MenuScene: SKScene {
    
    private var background = SKSpriteNode()
    
//    private var playRect = CGRect()
    
    private var labelNodeArr:[SKLabelNode] = [SKLabelNode]()
    
    
    var playableRect:CGRect!   /// 可视范围
    private var playableHeight:CGFloat  = 0.0   /// 可视范围的高度
    private var playableMargin:CGFloat = 0.0   /// 可视范围的起点
    private var maxAspectRatio:CGFloat! /// 屏幕分辩率;
    
    
    // iPhone X  375*812(H) @1x
    // 竖屏
    public let AREA_INSET_HEIGHT_TOP   :CGFloat = (UIScreen.main.bounds.height == 812) ? 44.0 : 0
    public let AREA_INSET_HEIGHT_BOTTOM:CGFloat = (UIScreen.main.bounds.height == 812) ? 34.0 : 0
    // 横屏(安全区域)
    public let AREA_INSET_WIDTH_TOP    :CGFloat = (UIScreen.main.bounds.width == 812) ? 44.0 : 0
    public let AREA_INSET_WIDTH_BOTTOM :CGFloat = (UIScreen.main.bounds.width == 812) ? 34.0 : 0
    
    public let iPhoneX_REAL_HEIGHT:CGFloat = 812.0   /// 竖屏
    
    var safeInsetTop = CGFloat()
    var safeInsetBottom = CGFloat()
    var safeHeight = CGFloat()

//    
    override init() {
//        super.init()
        super.init(size: CGSize(width: 2732, height: 2048))
//
////        let screenW = UIScreen.main.bounds.size.width
////        let screenH = UIScreen.main.bounds.size.height
////
////        let ratio = screenH/screenW
////
////        self.playRect = CGRect(x: 0, y:(self.size.height-self.size.width*ratio)/2, width: self.size.width, height: self.size.height - (self.size.height-self.size.width*ratio))
//
    safeInsetTop    =  self.size.height * AREA_INSET_WIDTH_TOP  / iPhoneX_REAL_HEIGHT
    safeInsetBottom =  self.size.height * AREA_INSET_WIDTH_BOTTOM    / iPhoneX_REAL_HEIGHT
    safeHeight = self.size.height - safeInsetTop - safeInsetBottom   // 安全区域的高度
    background = SKSpriteNode(imageNamed: "bj_")
    background.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
//    background.zRotation = CGFloat(M_PI*2)
    background.zPosition = -1000
    addChild(background)
//    self.view?.showsPhysics = 
    initCheckDevice()
//      
    }
//
    // MARK: - 检测是哪种设备
    func initCheckDevice(){
        if UIDevice.current.isPhoneXSerise() {
            maxAspectRatio = 2.16         /// iPhoneX 2.16 ratio
        }else {
            maxAspectRatio  = UIDevice.current.isPad() ? (4.0 / 3.0) : (16.0 / 9.0)  /// iPhone 16:9,iPad 4:3
        }
        /// 画出可视区域
        drawPayableArea(size: self.size,ratio: maxAspectRatio)
    }
    
    // MARK: - 画出可视区域
    func drawPayableArea(size:CGSize,ratio:CGFloat){
        /*
         /// 安全区域即用户交互的区域，非可视区域 (iPhoneX的安全区域 < 可视区域)
         let safeInsetTop    =  self.size.height * AREA_INSET_WIDTH_TOP / iPhoneX_REAL_HEIGHT
         let safeInsetBottom =  self.size.height * AREA_INSET_WIDTH_BOTTOM / iPhoneX_REAL_HEIGHT
         let safeHeight = self.size.height - safeInsetTop - safeInsetBottom   // 安全区域的高度
         */
        
        playableHeight  = size.width / ratio
        playableMargin = (size.height - playableHeight ) / 2.0   /// P70
        playableRect = CGRect(x: 0, y: playableMargin, width: size.width, height:  playableHeight)  /// 注意 scene的anchorPoint(0,0)原点的位置;
        
        //        let shapeFrame = SKShapeNode(rect: playableRect)
        //        shapeFrame.zPosition = 1
        //        shapeFrame.strokeColor = SKColor.red
        //        shapeFrame.lineWidth = 5.0
        //        addChild(shapeFrame)
        
        /// 可视区域的物理状态
        let playableBody = SKPhysicsBody(edgeLoopFrom: playableRect)
        playableBody.friction = 0
        self.physicsBody = playableBody
//        playableBody.categoryBitMask    = PhysicsCategory.Frame
//        playableBody.contactTestBitMask = PhysicsCategory.Ball
//        playableBody.collisionBitMask   = PhysicsCategory.Ball
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView) {
        /// 安全区域即用户交互的区域，非可视区域 (iPhoneX的安全区域 < 可视区域)
      
        
        
     
        
        creatLabelNode()
        
    }
    func creatLabelNode(){
       
        
        let privacyLabel = SKLabelNode()
        privacyLabel.text = "Privacy Policy"
        privacyLabel.fontColor = .black
        privacyLabel.fontSize = 72
        privacyLabel.verticalAlignmentMode = SKLabelVerticalAlignmentMode.center
        privacyLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
        privacyLabel.position = CGPoint(x: safeInsetTop+privacyLabel.frame.width, y: playableRect.minY+privacyLabel.frame.height)
        addChild(privacyLabel)
        
        let serviceLabel = SKLabelNode()
        serviceLabel.text = "Service"
        serviceLabel.fontColor = .black
        serviceLabel.fontSize = 72
        serviceLabel.verticalAlignmentMode = SKLabelVerticalAlignmentMode.center
        serviceLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
        serviceLabel.position = CGPoint(x: safeInsetTop+privacyLabel.frame.width, y: playableRect.minY+privacyLabel.frame.height*3)
        addChild(serviceLabel)
        
        let optionsLabel = SKLabelNode()
        optionsLabel.text = "OPTIONS"
        optionsLabel.fontColor = .black
        optionsLabel.fontSize = 72
        optionsLabel.verticalAlignmentMode = SKLabelVerticalAlignmentMode.center
        optionsLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
        optionsLabel.position = CGPoint(x: safeInsetTop+privacyLabel.frame.width, y: playableRect.minY+privacyLabel.frame.height*5)
        addChild(optionsLabel)
        
        let scoreLabel = SKLabelNode()
        scoreLabel.text = "TOP SCORE"
        scoreLabel.fontColor = .black
        scoreLabel.fontSize = 72
        scoreLabel.position = CGPoint(x: safeInsetTop+privacyLabel.frame.width, y: playableRect.minY+privacyLabel.frame.height*7)
        scoreLabel.verticalAlignmentMode = SKLabelVerticalAlignmentMode.center
        scoreLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
        addChild(scoreLabel)
        
        let playLabel = SKLabelNode()
        playLabel.text = "PLAY"
        playLabel.verticalAlignmentMode = SKLabelVerticalAlignmentMode.center
        playLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center 
        playLabel.fontColor = .black
        playLabel.fontSize = 72
        playLabel.position = CGPoint(x: safeInsetTop+privacyLabel.frame.width, y: playableRect.minY+privacyLabel.frame.height*9)
        
        addChild(playLabel)
        
       
        
       
        
      
        
        playLabel.name = "play"
        scoreLabel.name = "score"
        optionsLabel.name = "option"
        serviceLabel.name = "service"
        privacyLabel.name = "privacy"
        print("\(UIScreen.main.bounds)")
        //        let levelScene = SKScene()
        //        levelScene.size = CGSize(width: self.size.height*0.3, height: self.size.height*0.7)
        //        levelScene.backgroundColor = .blue
        //        levelScene.position = CGPoint.zero
        //        self.addChild(levelScene)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            
            if let sp = nodes(at: touch.location(in: self)).first{
                
                if sp.name == "play"{
                    for labelNode in self.children{
                        if labelNode.isMember(of: SKLabelNode.classForCoder()){
                            let node = labelNode as! SKLabelNode
                            
                            
                            node.run(SKAction.sequence([SKAction.fadeAlpha(to: 0.1, duration: 1.0),SKAction.removeFromParent()]))
                            
                        }
                        
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now()+1.0) {
                        let scene = SceneManager.sharedSceneManager().selectScenen(name: "level")
                        self.view?.presentScene(scene)
                    }
                    
                    
                }
                
                
                
            }
            
            
            
            
        }
        
        
        
    }
    
}
