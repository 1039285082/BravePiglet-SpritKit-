//
//  BaseBackgroundScene.swift
//  BravePiglet
//
//  Created by Mac on 24/12/2018.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit
import SpriteKit


class BaseBackgroundScene: SKScene,SKPhysicsContactDelegate,winDelegate,failedDelegate {
    
    
    //    var playRect = CGRect()
    
    var backGroundNode = SKSpriteNode()
    
    //    var balloon:Ballon!
    //
    //    var wolf:Wolf!
    
    //    var pig = SKSpriteNode()
    /// All Node
    var line = SKSpriteNode()
    
    var lifeNum = SKSpriteNode()
    
    var score = SKSpriteNode()
    
    var pulley = SKSpriteNode()
    
    
    var crane1:CraneHorizon!
    
    var crane2:CraneVertical!
    
    var background:Background!
    
    var ground:Ground!
    
    var bigRoller:BigRoller!
    
    var bigRoller2:BigRoller!
    
    var smallRoller:SmallRoller!
    
    var pig:Pig!
    
    var bullet:Bullet!
    
    var ropeFront:RopeFront!
    
    var basket:Basket!
    
    var hook:Hook!
    
    var piece:Piece!
    
    var ropeHorizon1:RopeHorizon!
    
    var ropeHorizon2:RopeHorizon!
    
    var ropeScaleRadio:CGFloat = 1.0
    
    var wolfSpeed:CGFloat = 500
    
    var successWolfNum = 0
    
    var totalWolfNum = 3
    
    var currentLevelLabel = SKLabelNode()
    
    
    
    var aliveWolfNum:Int = 0
    
    var aliveWolfArr:[Wolf] = []
    
    var aliveBalloonArr:[Ballon] = []
    
    var upWolfName = ""
    
    var isBasket:Bool?
    
    var wolfLife = 1
    
    
    var enemyNumberLabel =  SKLabelNode()
    
    var creatWolfTime:TimeInterval = 0
    
    private var dt:TimeInterval = 0
    private var lastUpdateTimeInterval:TimeInterval = 0
    
    
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
    
    private var loseLife : Bool = false
    
    var safeInsetTop = CGFloat()
    var safeInsetBottom = CGFloat()
    var safeHeight = CGFloat()
    
    var currentLevel:Int = 0
    
    var sceneIndex = Int()
    
    
    var isPig = false
    
    //    var sound = SoundManager.sharedSoundManager()
    
    override init() {
        
        super.init(size: CGSize(width: 2048, height: 2732))
        
        creatWolfTime = 5.0
        
    }
    var hitDownWolf = 0
    
    func creatUI() {
        
        
        
        background = Background()
        background.name = "background"
        background.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        addChild(background)
        
        
        creatUIWithSceneIndex()
        
        
        
        enemyNumberLabel.position = CGPoint(x:playableRect.minX+500,y:playableRect.minY+100)
        enemyNumberLabel.zPosition = 110
        enemyNumberLabel.fontSize = 80
        enemyNumberLabel.fontColor = .white
        enemyNumberLabel.verticalAlignmentMode = SKLabelVerticalAlignmentMode.center
        enemyNumberLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
        
        addChild(enemyNumberLabel)
        
        currentLevelLabel.text = "Level \(currentLevel+1)"
        currentLevelLabel.fontColor = .white
        currentLevelLabel.fontSize = 60
        currentLevelLabel.zPosition = 110
        currentLevelLabel.verticalAlignmentMode = SKLabelVerticalAlignmentMode.center
        currentLevelLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
        currentLevelLabel.position = CGPoint(x: playableRect.minX + currentLevelLabel.frame.width, y: playableRect.maxY-currentLevelLabel.frame.height)
        
        addChild(currentLevelLabel)
        
    }
    //根据选择的场景设计UI
    func creatUIWithSceneIndex(){
        
        
        switch sceneIndex {
        case 0:
            
            crane2 = CraneVertical()
            
            addChild(crane2)
            
            
            crane1 = CraneHorizon()
            crane1.position = CGPoint(x: playableRect.minX+crane1.size.width/2, y: playableRect.maxY-crane1.size.height/2-crane2.size.height/8+20)
            addChild(crane1)
            
            
            
            ground = Ground()
            ground.position = CGPoint(x: ground.size.width/2, y: ground.size.height/2)
            addChild(ground)
            
            bigRoller = BigRoller()
            
            addChild(bigRoller)
            
            
            bigRoller2 = BigRoller()
            addChild(bigRoller2)
            
            piece = Piece()
            addChild(piece)
            
            ropeFront = RopeFront()
            addChild(ropeFront)
            
            smallRoller = SmallRoller()
            
            smallRoller.zPosition = -1
            addChild(smallRoller)
            
            ropeHorizon1 = RopeHorizon()
            
            addChild(ropeHorizon1)
            
            ropeHorizon2 = RopeHorizon()
            addChild(ropeHorizon2)
            
            hook = Hook()
            
            hook.zPosition = 1
            addChild(hook)
            
            basket = Basket()
            basket.name = "basket"
            
            basket.zPosition = 0
            addChild(basket)
            
            pig = Pig()
            pig.name = "pig"
            
            addChild(pig)
            
            
            crane2.position = CGPoint(x: playableRect.maxX-crane2.size.width*2-40, y: playableRect.maxY-crane2.size.height/2)
            
            bigRoller.position = CGPoint(x:crane2.position.x,y:playableRect.maxY-bigRoller.size.height/2-20)
            
            bigRoller2.position = CGPoint(x: playableRect.minX+crane2.position.x-190, y: crane1.position.y)
            
            piece.position = CGPoint(x:bigRoller2.position.x,y:crane1.frame.minY-piece.size.height/2)
            
            ropeFront.position = CGPoint(x:bigRoller2.frame.minX+ropeFront.size.height/2,y:bigRoller.frame.maxY-ropeFront.size.height/2)
            
            smallRoller.position = CGPoint(x:piece.frame.midX,y:piece.frame.minY)
            
            ropeHorizon1.position = CGPoint(x:smallRoller.frame.minX,y:piece.frame.minY-ropeHorizon1.size.height/2)
            
            ropeHorizon2.position = CGPoint(x:smallRoller.frame.maxX,y:piece.frame.minY-ropeHorizon2.size.height/2)
            
            hook.position = CGPoint(x:smallRoller.position.x,y:ropeHorizon1.frame.minY-hook.size.height/2)
            
            basket.position = CGPoint(x:smallRoller.position.x,y:hook.frame.minY-basket.size.height/2+10)
            
            pig.position = CGPoint(x: basket.position.x-pig.size.width/4, y: basket.position.y+pig.size.height/2)
        case 1:
            crane2 = CraneVertical()
            
            addChild(crane2)
            
            
            crane1 = CraneHorizon()
            crane1.position = CGPoint(x: playableRect.minX+crane1.size.width/2, y: playableRect.maxY-crane1.size.height/2-crane2.size.height/8+20)
            addChild(crane1)
            
            
            
            ground = Ground()
            ground.position = CGPoint(x: ground.size.width/2, y: ground.size.height/2)
            addChild(ground)
            
            bigRoller = BigRoller()
            bigRoller.zPosition = 50
            addChild(bigRoller)
            
            
            bigRoller2 = BigRoller()
            addChild(bigRoller2)
            
            piece = Piece()
            addChild(piece)
            
            ropeFront = RopeFront()
            addChild(ropeFront)
            
            smallRoller = SmallRoller()
            
            smallRoller.zPosition = -1
            addChild(smallRoller)
            
            ropeHorizon1 = RopeHorizon()
            
            addChild(ropeHorizon1)
            
            ropeHorizon2 = RopeHorizon()
            addChild(ropeHorizon2)
            
            hook = Hook()
            
            hook.zPosition = 1
            addChild(hook)
            
            basket = Basket()
            basket.name = "basket"
            
            basket.zPosition = 0
            addChild(basket)
            
            pig = Pig()
            pig.name = "pig"
            
            addChild(pig)
            crane2.position = CGPoint(x: playableRect.maxX-crane2.size.width/2, y: self.size.height/2)
            
            
            
            bigRoller2.position = CGPoint(x: playableRect.minX+crane2.position.x-190, y: crane1.position.y)
            
            piece.position = CGPoint(x:bigRoller2.position.x,y:bigRoller2.frame.minY)
            
            ropeFront.position = CGPoint(x:bigRoller2.frame.midX+ropeFront.size.width/2,y:crane1.frame.maxY+ropeFront.size.height/2-10)
            
            bigRoller.position = CGPoint(x:ropeFront.frame.maxX,y:ropeFront.frame.maxY-bigRoller.size.height/2)
            
            smallRoller.position = CGPoint(x:piece.frame.midX,y:piece.frame.minY)
            
            ropeHorizon1.position = CGPoint(x:smallRoller.frame.minX,y:piece.frame.minY-ropeHorizon1.size.height/2)
            
            ropeHorizon2.position = CGPoint(x:smallRoller.frame.maxX,y:piece.frame.minY-ropeHorizon2.size.height/2)
            
            hook.position = CGPoint(x:smallRoller.position.x,y:ropeHorizon1.frame.minY-hook.size.height/2)
            
            basket.position = CGPoint(x:smallRoller.position.x,y:hook.frame.minY-basket.size.height/2+10)
            
            pig.position = CGPoint(x: basket.position.x-pig.size.width/4, y: basket.position.y+pig.size.height/2)
            
            let shelf = SKSpriteNode(imageNamed: "pulley")
            
            shelf.position = CGPoint(x:bigRoller.position.x,y:bigRoller.position.y-shelf.size.height/2)
            shelf.zPosition = 46
            addChild(shelf)
            
            //            let shelf =
            
            
        default:break
        }
        
        
        
        
    }
    
    
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
        
        let shapeFrame = SKShapeNode(rect: playableRect)
        shapeFrame.zPosition = 1
        shapeFrame.strokeColor = SKColor.white
        shapeFrame.lineWidth = 5.0
        addChild(shapeFrame)
        
        /// 可视区域的物理状态
        let playableBody = SKPhysicsBody(edgeLoopFrom: playableRect)
        playableBody.friction = 0
        //        playableBody.collisionBitMask = 0
        self.physicsBody = playableBody
        drawSafeArea()
        
    }
    func drawSafeArea() {
        /// 安全区域即用户交互的区域，非可视区域 (iPhoneX的安全区域 < 可视区域)
        safeInsetTop    =  size.height * AREA_INSET_WIDTH_TOP  / iPhoneX_REAL_HEIGHT
        safeInsetBottom =  size.height * AREA_INSET_WIDTH_BOTTOM    / iPhoneX_REAL_HEIGHT
        safeHeight = size.height - safeInsetTop - safeInsetBottom   // 安全区域的高度
        
        
        
    }
    
    override func didMove(to view: SKView) {
        
        //        sound.creatSceneBackMusic(scene: currentLevel)
        
        self.anchorPoint = CGPoint.zero
        initCheckDevice()
        self.creatUI()
        physicsWorld.contactDelegate = self
        
        
        
        //          creatWolfTime = 5.0
        
        
        self.run(SKAction.repeatForever(SKAction.sequence([SKAction.run({
            [weak self] in self?.creatWolf()
        }),SKAction.wait(forDuration: creatWolfTime)])), withKey: "creat")
        
        let movePig = UIPanGestureRecognizer.init(target: self, action: #selector(movePigAction(sender:)))
        self.view?.addGestureRecognizer(movePig)
        
        
    }
    
    
    func getWolf(){
        
        for node in self.children {
            //            self.rem
            
        }
        
        
    }
    
    
    func creatWolf(){
        
        let wolf = Wolf()
        wolf.name = "aliveWolf"
        wolf.position = CGPoint(x: playableRect.minX+wolf.size.width/2 , y: ground.size.height+wolf.size.height/2+2)
        addChild(wolf)
        aliveWolfArr.append(wolf)
        wolf.creatRunAnimate()
        let rightMargin = playableRect.maxX - pig.frame.minX
        let point = wolf.destinationPoint(min: playableRect.minX + rightMargin, max: pig.frame.minX-200)
        
        let runningPath = point - wolf.position.x
        wolf.run(SKAction.sequence([SKAction.moveTo(x:point , duration:TimeInterval(runningPath/wolfSpeed)),SKAction.run({
            wolf.stopAnimate()
        }),SKAction.run({
            wolf.creatBalloonAnimate()
        }),SKAction.wait(forDuration: 0.5),SKAction.run({
            [weak self] in self?.creatBalloon(wolf: wolf)
        })]), withKey: "wolfRun")
        
        
    }
    
    @objc func movePigAction(sender:UIPanGestureRecognizer){
        if isPig {
            let nodePoint = sender.location(in: sender.view)
            
            let point = calculateSafePoint(point: sender.location(in: sender.view))
            let ropeHeight = RopeHorizon()
            let basketHeight = Basket()
            
            
            ropeScaleRadio = (piece.frame.minY-nodePoint.y-basketHeight.size.height/2 - hook.size.height) / ropeHeight.size.height
            
            pig.position = CGPoint(x: nodePoint.x, y: point.y)
            bigRoller.run(SKAction.rotate(byAngle: CGFloat(M_PI*2)*ropeScaleRadio, duration: dt))
            bigRoller2.run(SKAction.rotate(byAngle: CGFloat(M_PI*2)*ropeScaleRadio, duration: dt))
        }
        
    }
    
    func creatBalloon(wolf:Wolf){
        
        let balloon = Ballon()
        balloon.name = "balloon"
        
        balloon.position = CGPoint(x: wolf.position.x+balloon.size.width/2, y:wolf.frame.maxY+balloon.size.height/2)
        
        addChild(balloon)
        //        aliveBalloonArr.append(balloon)
        let joint = SKPhysicsJointFixed.joint(withBodyA: wolf.physicsBody!, bodyB: balloon.physicsBody!, anchor: CGPoint(x: wolf.position.x, y: wolf.frame.maxY))
        physicsWorld.add(joint)
        
        //        let con = SKConstraint.distance(SKRange(lowerLimit: balloon.position.y-wolf.position.y, upperLimit: balloon.position.y-wolf.position.y), to: balloon)
        //        wolf.constraints = [con]
        
        balloon.run(SKAction.sequence([SKAction.moveTo(y: self.size.height+balloon.size.height/2, duration: 8.0),SKAction.wait(forDuration: 2.0),SKAction.removeFromParent()]))
        
        
    }
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
//    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//
//        let nodeArr = self.nodes(at: touches.first!.location(in: self))
//
//        for node in nodeArr{
//           else{
//
//            }
//        }
//
//
//
//    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        isPig = false
        
        
        let nodeArr = self.nodes(at: touches.first!.location(in: self))
        
        for node in nodeArr{
            if node.name == "basket"{
                
                return
            }
            if node.name == "background" {
                
                if !loseLife{
                    
                    //        self.isUserInteractionEnabled = false
                    pig.shotAnimate()
                    //                DispatchQueue.main.asyncAfter(deadline: .now()+0.7) {
                    self.bullet = Bullet()
                    self.bullet.position = CGPoint(x: self.pig.frame.minX, y: self.pig.frame.midY)
                    self.addChild(self.bullet)
                    self.bullet.run(SKAction.moveTo(x: self.playableRect.minX-self.bullet.size.width/2, duration: 1.0))
                    //            self.isUserInteractionEnabled = true
                    //                }
                    
                }else{
                    removeAction(forKey: "creat")
                }
            }
            
            if (node.name == "basket") || node.name == "pig"  {
                
              
                
                isPig = true
                
            }
            
            
        }
        
        
        
        
    }
    
    func calculateSafePoint(point:CGPoint) -> CGPoint {
        
        let wolf  = Wolf()
        var movePoint = CGPoint(x: point.x, y: point.y)
        
        
        if point.y < ground.size.height + wolf.size.height{
            movePoint.y = ground.size.height + wolf.size.height
        }
        if point.y > smallRoller.frame.minY - hook.size.height{
            
            movePoint.y = smallRoller.frame.minY - hook.size.height
        }
        
        return  movePoint
    }
    
    
    func didBegin(_ contact: SKPhysicsContact) {
        
        let bodyA:SKPhysicsBody
        let bodyB:SKPhysicsBody
        if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask {
            bodyA = contact.bodyA
            bodyB = contact.bodyB
        }else{
            bodyA = contact.bodyB
            bodyB = contact.bodyA
        }
        
        if bodyA.categoryBitMask == PhysicsCategory.bullet && bodyB.categoryBitMask == PhysicsCategory.wolf{
            //            bodyB.node?.removeFromParent()
            let skemeterNode = SKEmitterNode(fileNamed: "BulletParticle.sks")
            
            skemeterNode?.particleSize=(bodyA.node?.frame.size)!
            skemeterNode!.position = (bodyA.node?.position)!
            skemeterNode?.zPosition = 60
            self.addChild(skemeterNode!)
            
            skemeterNode?.run(SKAction.sequence([SKAction.wait(forDuration: 0.5),SKAction.removeFromParent()]))
            
            
            bodyA.node?.removeFromParent()
            bodyA.categoryBitMask = PhysicsCategory.none /// 去除双响;
            let wolfNode = bodyB.node as! Wolf
            wolfNode.hitNum += 1
            
            
            if wolfNode.hitNum == 3{
                //                bodyB.node?.removeFromParent()
                
                
                
                wolfNode.physicsBody?.categoryBitMask = PhysicsCategory.none
                physicsWorld.remove(bodyB.joints.first!)
                //                wolfNode.removeFromParent()
                
                wolfNode.run(SKAction.rotate(toAngle: CGFloat(M_PI), duration: 0.2))
                wolfNode.changeDownState()
                wolfNode.name = "deadWolf"
                //                self.physicsWorld.remove()
                
                //                self.physicsWorld.remove
            }
            
            
            
            
        }
        if bodyA.categoryBitMask == PhysicsCategory.bullet && bodyB.categoryBitMask == PhysicsCategory.balloon{
            
            if bodyB.node?.physicsBody?.joints.first != nil{
                
                
                let wolf = bodyB.node?.physicsBody?.joints.first?.bodyA.node as! Wolf
                wolf.run(SKAction.rotate(toAngle: CGFloat(M_PI), duration: 0.2))
                wolf.changeDownState()
                wolf.name = "deadWolf"
            }
            
            
            
            
            bodyB.node?.removeFromParent()
            
            bodyA.node?.removeFromParent()
            //            bodyB.node?.physicsBody?.joints.f
            
            
            
            
            
            
            
        }
        if bodyA.categoryBitMask == PhysicsCategory.ground && bodyB.categoryBitMask == PhysicsCategory.wolf{
            let wolf = bodyB.node as! Wolf
            bodyB.categoryBitMask = PhysicsCategory.none /// 去除多次碰撞;
            let leg = SKSpriteNode(imageNamed: "leg_1")
            leg.position = CGPoint(x: wolf.position.x, y: ground.frame.height+leg.size.height/2)
            addChild(leg)
            var texture:[SKTexture] = []
            for i in 1...4 {
                texture.append(SKTexture(imageNamed: "leg_\(i)"))
            }
            wolf.removeFromParent()
            
            
            leg.run(SKAction.sequence([SKAction.animate(with: texture, timePerFrame: 0.1),SKAction.fadeOut(withDuration: 1.0),SKAction.removeFromParent()]))
            successWolfNum += 1
            print("\(successWolfNum)")
            popWinNode()
            
            
        }
        
    }
    
    
    //    func creatUpWolf(position:CGPoint,name:String){
    //
    //        let wolfWin = Wolf()
    //        wolfWin.position = CGPoint(x: position.x, y: position.y+wolfWin.size.height/2)
    //        addChild(wolfWin)
    //
    //        wolfWin.run(SKAction.moveTo(x: crane2.position.x, duration: 1.0))
    //
    //    }
    
    func getUpWolf(){
        //        for balloon in aliveBalloonArr{
        //            if balloon.position.y >= playableRect.maxY{
        //                let joint = balloon.physicsBody?.joints.first
        //
        //                if joint?.bodyB.node == balloon{
        //
        //
        //                    print("123")
        //                }
        //
        //                for wolf in aliveWolfArr{
        //                    //剪断绳子
        //
        //                        if wolf.name == balloon.name && wolf != nil{
        //                            physicsWorld.remove(wolf.physicsBody!.joints.first!)
        //                            wolf.name = "wolfWin"
        //                            wolf.position = CGPoint(x: wolf.position.x, y: crane1.frame.maxY+wolf.size.height/2)
        //                            wolf.creatRunAnimate()
        //                            if !loseLife {
        //
        //                                wolf.run(SKAction.sequence([SKAction.moveTo(x: ropeFront.position.x, duration: TimeInterval((ropeFront.position.x-wolf.position.x)/wolfSpeed)),SKAction.run {
        //                                    wolf.cutRope()
        //                                    },SKAction.run {
        //                                        [weak self] in self?.pigDown();
        //
        //                                    }]))
        //
        //                            }else{
        //
        //                                wolf.run(SKAction.moveTo(x: playableRect.maxX+wolf.size.width/2, duration: TimeInterval((playableRect.maxX+wolf.size.width/2-wolf.position.x)/wolfSpeed)))
        //
        //                            }
        //                    }
        //
        //                }
        //
        //            }
        //
        //        }
        self.enumerateChildNodes(withName: "balloon", using: {
            node,stop in
            let balloon = node as! Ballon
            if balloon.position.y >= self.playableRect.maxY {
                let joint = balloon.physicsBody!.joints.first
                if joint != nil{
                    let wolf = joint!.bodyA.node as! Wolf
                    
                    
                    self.physicsWorld.remove(wolf.physicsBody!.joints.first!)
                    wolf.name = "wolfWin"
                    wolf.position = CGPoint(x: wolf.position.x, y: self.crane1.frame.maxY+wolf.size.height/2)
                    wolf.creatRunAnimate()
                    if !self.loseLife {
                        
                        wolf.run(SKAction.sequence([SKAction.moveTo(x: self.ropeFront.position.x, duration: TimeInterval((self.ropeFront.position.x-wolf.position.x)/self.wolfSpeed)),SKAction.run {
                            wolf.cutRope()
                            },SKAction.run {
                                [weak self] in self?.pigDown();
                                
                            }]))
                        
                    }else{
                        wolf.run(SKAction.moveTo(x: self.playableRect.maxX+wolf.size.width/2, duration: TimeInterval((self.playableRect.maxX+wolf.size.width/2-wolf.position.x)/self.wolfSpeed)))
                        
                    }
                    
                }
                
            }
            
        })
        
        
        
    }
    
     func moveBasket() {
        pig.position = CGPoint(x: basket.position.x-pig.size.width/4, y: basket.position.y+pig.size.height/2)
        hook.position = CGPoint(x:smallRoller.position.x,y:ropeHorizon1.frame.minY-hook.size.height/2)
        
        
        ropeHorizon1.yScale = ropeScaleRadio
        ropeHorizon2.yScale = ropeScaleRadio
        ropeHorizon1.position = CGPoint(x:smallRoller.frame.minX,y:piece.frame.minY-ropeHorizon1.size.height/2)
        ropeHorizon2.position = CGPoint(x:smallRoller.frame.maxX,y:piece.frame.minY-ropeHorizon2.size.height/2)
    }
    
    func stopCreatWolf(){
        if aliveWolfArr.count == totalWolfNum {
            self.removeAction(forKey: "creat")
        }
        
    }
    
    func pigDown(){
        
        pig.run(SKAction.rotate(toAngle: CGFloat(M_PI), duration: 0.1))
        //SKAction.rotate(toAngle: CGFloat(M_PI), duration: 0.1),
        
        basket.run(SKAction.sequence([SKAction.rotate(toAngle: CGFloat(M_PI), duration: 0.1),SKAction.moveTo(y: ground.size.height + basket.size.height/2, duration: 1.0),SKAction.run({
            self.pig.removeFromParent()
            self.basket.fallDownAnimate()
            self.isUserInteractionEnabled = false
        }),SKAction.run {
            
            
            self.popFailedNode()
            
            }]))
        loseLife = true
        self.removeAction(forKey: "creat")
        
    }
    
    func popFailedNode() {
        wolfLife -= 1
        if wolfLife == 0{
            
            let failNode = FailedNode()
            failNode.position = CGPoint(x: playableRect.midX, y: playableRect.midY)
            failNode.failedDelegate = self
            self.removeAllActions()
            
            self.addChild(failNode)
            
        }
    }
    func popWinNode(){
        if successWolfNum >= totalWolfNum{
            let winNode = WinNode()
            winNode.position = CGPoint(x: playableRect.midX, y: playableRect.midY)
            winNode.winDelegate = self
            self.removeAllActions()
            
            self.addChild(winNode)
            
            
        }
    }
    //通关代理
    func returnWinBtnClick(btnName: String) {
        switch btnName {
        case "next":
            let scene = SceneManager.sharedSceneManager().creatWinLoseScene(currentLevel: currentLevel+1,sceneIndex: sceneIndex)
            
            
            self.view?.presentScene(scene)
            
        case "menu":
            let levelScene = SceneManager.sharedSceneManager().creatLevelScene(sceneIndex: sceneIndex)
            
            self.view?.presentScene(levelScene)
        case "restart":
            let scene = SceneManager.sharedSceneManager().creatWinLoseScene(currentLevel: currentLevel,sceneIndex: sceneIndex)
            //             scene.sceneIndex = sceneIndex
            self.view?.presentScene(scene)
        default:
            break
        }
    }
    func returnFailedBtnClick(btnName: String) {
        switch btnName {
        case "menu":
            let levelScene = SceneManager.sharedSceneManager().creatLevelScene(sceneIndex: sceneIndex)
            
            self.view?.presentScene(levelScene)
        case "restart":
            let scene = SceneManager.sharedSceneManager().creatWinLoseScene(currentLevel: currentLevel,sceneIndex: sceneIndex) as! BaseBackgroundScene
            scene.sceneIndex = sceneIndex
            self.view?.presentScene(scene)
        default:
            break
        }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        if lastUpdateTimeInterval == 0 {
            lastUpdateTimeInterval = currentTime
        }
        dt = currentTime - lastUpdateTimeInterval
        lastUpdateTimeInterval = currentTime
        
        getUpWolf()
        moveBasket()
        stopCreatWolf()
        enemyNumberLabel.text = "Wolf:\(totalWolfNum-successWolfNum)"
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
