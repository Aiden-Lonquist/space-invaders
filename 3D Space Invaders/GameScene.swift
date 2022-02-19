//
//  GameScene.swift
//  3D Space Invaders
//
//  Created by Aiden Lonquist on 2022-02-18.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    override func didMove(to view: SKView) {
        
        let background = SKSpriteNode(imageNamed: "background")
        background.size = self.size
        background.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        background.zPosition = 0
        self.addChild(background)
        
        let player = SKSpriteNode(imageNamed: "player")
        player.setScale(1)
        player.position = CGPoint(x: self.size.width/2, y: self.size.height * 0.2)
        self.addChild(player)
    }
}
