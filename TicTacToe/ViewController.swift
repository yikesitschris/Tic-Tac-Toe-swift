//
//  ViewController.swift
//  TicTacToe
//
//  Created by Christopher Fong on 11/26/16.
//  Copyright © 2016 Sparta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var changePlayer = 0
    var gameArray = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    var gameState = true;
    
    func hasWinnerO(numbers: [Int]) -> Bool {
        if(numbers[0] + numbers[1] + numbers[2] == 3) {
            return true
        }
        if(numbers[3] + numbers[4] + numbers[5] == 3) {
            return true
        }
        if(numbers[6] + numbers[7] + numbers[8] == 3) {
            return true
        }
        if(numbers[0] + numbers[3] + numbers[6] == 3) {
            return true
        }
        if(numbers[1] + numbers[4] + numbers[7] == 3) {
            return true
        }
        if(numbers[2] + numbers[5] + numbers[8] == 3) {
            return true
        }
        if(numbers[0] + numbers[4] + numbers[8] == 3) {
            return true
        }
        if(numbers[6] + numbers[4] + numbers[2] == 3) {
            return true
        }
        else{
            return false
        }
    }
    func hasWinnerX(numbers: [Int]) -> Bool {
        if(numbers[0] + numbers[1] + numbers[2] == 30) {
            return true
        }
        if(numbers[3] + numbers[4] + numbers[5] == 30) {
            return true
        }
        if(numbers[6] + numbers[7] + numbers[8] == 30) {
            return true
        }
        if(numbers[0] + numbers[3] + numbers[6] == 30) {
            return true
        }
        if(numbers[1] + numbers[4] + numbers[7] == 30) {
            return true
        }
        if(numbers[2] + numbers[5] + numbers[8] == 30) {
            return true
        }
        if(numbers[0] + numbers[4] + numbers[8] == 30) {
            return true
        }
        if(numbers[6] + numbers[4] + numbers[2] == 30) {
            return true
        }
        else{
            return false
        }
    }
    
    func hasZero(numbers: [Int]) -> Bool {
        for i in 0...8 {
            if(numbers[i] == 0) {
                return true
            }
        }
        return false
    }
    
    //label to show winner
    
    @IBOutlet weak var winner: UILabel!
    
    
    @IBAction func click(_ sender: UIButton) {
        
        if (gameState) {
            if(changePlayer == 1) {
                winner.text = "O's turn"
            } else {
                winner.text = "X's turn"
            }
            
            if(changePlayer == 0) {
            
            //set image of button
            sender.setImage(UIImage(named: "o.png"), for:UIControlState())
                
            changePlayer = 1 //Switch players every click
            sender.isEnabled = false //Turn off button after click
            gameArray[sender.tag - 1] = 1 //set index at button click to 1
            
            //Game Logic
            if(hasWinnerO(numbers: gameArray)) {
                winner.text = "O Wins!"
                gameState = false
            }
            if(!hasWinnerX(numbers: gameArray) && !hasWinnerO(numbers: gameArray) && hasZero(numbers: gameArray) == false) {
                winner.text = "Draw!"
                gameState = false
            }
        }
            else{
            sender.setImage(UIImage(named: "x.png"), for:UIControlState())
            changePlayer = 0
            sender.isEnabled = false
            gameArray[sender.tag - 1] = 10
            
            if(hasWinnerX(numbers: gameArray)) {
                winner.text = "X Wins!"
                gameState = false
            }
            if(!hasWinnerX(numbers: gameArray) && !hasWinnerO(numbers: gameArray) && hasZero(numbers: gameArray) == false) {
                winner.text = "Draw!"
                gameState = false
            }
        }
    }
    
    }
    
    @IBOutlet weak var playAgainHide: UIButton!
    
    //play again button
    @IBAction func playAgain(_ sender: UIButton) {
        gameArray = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        gameState = true
        changePlayer = 0
        winner.text = "O's turn"
        
        for i in 1...9 {
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControlState())
            button.isEnabled = true
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

