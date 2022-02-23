//
//  GameScene.swift
//  3D Space Invaders
//
//  Created by Aiden Lonquist on 2022-02-18.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    let player = SKSpriteNode(imageNamed: "ship")
    
    var gameArea: CGRect
    
    override init(size: CGSize) {
        
        let maxAspectRatio: CGFloat = 16.0/9.0
        let playableWidth = size.height / maxAspectRatio
        let margin = (size.width - playableWidth) / 2
        gameArea = CGRect(x: margin, y: 0, width: playableWidth, height: size.height)
        
        super.init(size: size)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder) has not been implemented")
    }
    override func didMove(to view: SKView) {
        
        let background = SKSpriteNode(imageNamed: "background")
        background.size = self.size
        background.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        background.zPosition = 0
        self.addChild(background)
        
        player.setScale(1)
        player.position = CGPoint(x: self.size.width/2, y: self.size.height * 0.2)
        player.zPosition = 2
        self.addChild(player)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches {
            let pointOfTouch = touch.location(in: self)
            let previousPointOfTouch = touch.previousLocation(in: self)
            
            let amountDragged = pointOfTouch.x - previousPointOfTouch.x
            
            player.position.x += amountDragged
            
            if player.position.x > gameArea.maxX {
                player.position.x = gameArea.maxX
            }
            if player.position.x < gameArea.minX {
                player.position.x = gameArea.minX
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        Use if we want to get the position of the tap to send the bullet there.
//        guard let touch = touches.first else {
//            return
//        }
//        let touchPosition = touch.location(in: self)
        
        tapToShoot()
    }
    
    func tapToShoot() {
        let bullet = SKSpriteNode(imageNamed: "bullet")
        bullet.position = CGPoint(x: player.position.x, y: player.position.y)
        bullet.setScale(0.2)
        bullet.zPosition = 1
        
        self.addChild(bullet)
        
        let moveUp = SKAction.moveBy(x: 0, y: 1000, duration: 1)
        let removeSprite = SKAction.removeFromParent()
        
        let shotSequence = SKAction.sequence([moveUp, removeSprite])

        bullet.run(shotSequence)
    }
}
