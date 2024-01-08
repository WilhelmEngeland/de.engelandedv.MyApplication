//
//  TicTacToeViewController.swift
//  MyApplication
//
//  Created by Wilhelm Engeland on 31.07.21.
//

import UIKit

class TicTacToeViewController: UIViewController {
    
    //MARK: - Outlet
    @IBOutlet weak var winnerLabel: UILabel!
    @IBOutlet weak var repeatLabel: UIButton!
    
    
    
    //MARK: - Variablen
    let infoDetailAlert = InfoDetailAlert()
    
    var activeGame = true
    var player = 1
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    let winningCombinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    
    
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        createWinnerLabel()
    }
    
    
    //MARK: - ViewDidAppear
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        repeatLabel.setTitle(Language.language.playAgainText, for: .normal)
    }
    
    
    //MARK: - Create InfoDetail Button Tap
    @IBAction func infoDetailButton(_ sender: Any) {
        infoDetailAlert.infoDetail(_text: Language.language.infoDetailTicTacToeViewController, _view: self)
    }
    
    
    //MARK: - Create Winner Label Function
    func createWinnerLabel() {
        winnerLabel.isHidden = true
        repeatLabel.isHidden = true
        repeatLabel.layer.cornerRadius = 20
        winnerLabel.layer.masksToBounds = true
        winnerLabel.layer.cornerRadius = 20
        winnerLabel.center = CGPoint(x: winnerLabel.center.x - 500, y: winnerLabel.center.y)
        repeatLabel.center = CGPoint(x: repeatLabel.center.x - 500, y: repeatLabel.center.y)
    }
    
    
    //MARK: - Repeat Button Tap
    @IBAction func repeatButton(_ sender: Any) {
        
        activeGame = true
        player = 1
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        
        for i in 1..<10 {
            if let button = view.viewWithTag(i) as? UIButton {
                button.setImage(nil, for: [])
            }
            createWinnerLabel()
        }
    }
    
    
    //MARK: - Image Button Tap
    @IBAction func imageButton(_ sender: AnyObject) {
        
        let activePosition = sender.tag - 1
        
        if gameState[activePosition] == 0 && activeGame {
            
            gameState[activePosition] = player
            
            if player == 1 {
                sender.setImage(UIImage(named: "Star.jpg"), for: [])
                player = 2

            } else {
                sender.setImage(UIImage(named: "Circle.jpg"), for: [])
                player = 1
            }
            
            // Draw Game
            draw()
            
            for combination in winningCombinations {
                
                if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]] {
                    
                    activeGame = false
                    
                    winnerLabel.isHidden = false
                    repeatLabel.isHidden = false
                    repeatLabel.layer.cornerRadius = 20
                    winnerLabel.layer.masksToBounds = true
                    winnerLabel.layer.cornerRadius = 20
                    
                    if gameState[combination[0]] == 1 {
                        
                        winnerLabel.text = Language.language.winnerLabelText1
                        
                    } else {
                        
                        winnerLabel.text = Language.language.winnerLabelText2
                        
                    }
                    
                    UIView.animate(withDuration: 1, animations: {
                        
                        self.winnerLabel.center = CGPoint(x: self.winnerLabel.center.x + 500, y: self.winnerLabel.center.y)
                        self.repeatLabel.center = CGPoint(x: self.repeatLabel.center.x + 500, y: self.repeatLabel.center.y)
                    })
                }
            }
        }
    }
    
    
    //MARK: - Draw Function
    func draw() {
        
        if gameState[0] != 0 && gameState[1] != 0 && gameState[2] != 0 && gameState[3] != 0 && gameState[4] != 0 && gameState[5] != 0 && gameState[6] != 0 && gameState[7] != 0 && gameState[8] != 0 {
            
            activeGame = false
            
            winnerLabel.isHidden = false
            repeatLabel.isHidden = false
            repeatLabel.layer.cornerRadius = 20
            winnerLabel.layer.masksToBounds = true
            winnerLabel.layer.cornerRadius = 20
            
            winnerLabel.text = Language.language.winnerLabelText3
            
            UIView.animate(withDuration: 1, animations: {
                
                self.winnerLabel.center = CGPoint(x: self.winnerLabel.center.x + 500, y: self.winnerLabel.center.y)
                self.repeatLabel.center = CGPoint(x: self.repeatLabel.center.x + 500, y: self.repeatLabel.center.y)
            })
        }
    }
}
