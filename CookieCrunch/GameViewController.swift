//
//  GameViewController.swift
//  CookieCrunch
//
//  Created by Сергей Шальнов on 26.05.2018.
//  Copyright © 2018 Sergey Shalnov. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    var scene: GameScene!
    var level: Level!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            view.isMultipleTouchEnabled = false
            view.ignoresSiblingOrder = true
            view.showsFPS = true
            view.showsNodeCount = true
            
            scene = GameScene(size: view.bounds.size)
            scene.scaleMode = .aspectFill
            
            level = Level(filename: "Level_1")
            scene.level = level
            scene.addTiles()
            
            view.presentScene(scene)
        }
        print("run begin game")
        beginGame()
    }
    
    func beginGame() {
        shuffle()
    }
    
    func shuffle() {
        let newCookies = level.shuffle()
        scene.addSprites(for: newCookies)
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return [.portrait, .portraitUpsideDown]
    }


    override var prefersStatusBarHidden: Bool {
        return true
    }
}
