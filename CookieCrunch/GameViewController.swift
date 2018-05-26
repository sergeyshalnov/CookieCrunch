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

    // MARK: Properties
    
    var scene: GameScene!
    var level: Level!
    
    // MARK: Init
    
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
            
            scene.swipeHandler = handleSwipe(_:)
            
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
    
    // FIX: Optimze
    func handleSwipe(_ swap: Swap) {
        view.isUserInteractionEnabled = false
        
        if level.isPossibleSwap(swap) {
            level.perfomeSwap(swap)
            scene.animate(swap) {
                self.view.isUserInteractionEnabled = true
            }
        } else {
            scene.animateInvalidSwap(swap) {
                self.view.isUserInteractionEnabled = true
            }
        }
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
