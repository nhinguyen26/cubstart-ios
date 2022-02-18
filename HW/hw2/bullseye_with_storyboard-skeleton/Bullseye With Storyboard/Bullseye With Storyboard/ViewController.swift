//
//  ViewController.swift
//  Storyboard Bullseye
//
//  Created by Tony Hong on 1/13/22.
//

import UIKit
import Foundation

var randomNumber = 0

var range = 100

var level = 1

var highestScore = 0


class ViewController: UIViewController {
    
    // switch that switches on and off from exact mode
    @IBOutlet weak var exactSwitch: UISwitch!
    
    // displays whether user hit bullseye
    @IBOutlet weak var resultLabel: UILabel!
    
    // displays the number user must hit to win
    @IBOutlet weak var numLabel: UILabel!
    
    // displays the current level the user is on
    @IBOutlet weak var currentLevel: UILabel!
    
    // displays high score of user
    @IBOutlet weak var highScore: UILabel!
    
    // slider user can slide to match random number given
    @IBOutlet weak var numSlider: UISlider!
    
    // IBOutlet for play again button
    @IBOutlet weak var playAgainButton: UIButton!
    
    // displays the max value of slider
    @IBOutlet weak var rangeLabel: UILabel!
    
    @IBAction func checkValue(_ sender: Any) {
        if exactSwitch.isOn == false {
           if randomNumber - 3 <= Int(numSlider.value) && randomNumber + 3 >= Int(numSlider.value) {
                        resultLabel.text = "You were right on point! Bullseye!"
            range += 50
            rangeLabel.text = String(range)
            numSlider.maximumValue = Float(range)
            level += 1
            currentLevel.text = String(level)
            
            numSlider.setValue(Float(range / 2), animated: false)
            randomNumber = Int(arc4random_uniform(UInt32(range + 1)))
            numLabel.text = String(randomNumber)
            // We should hide resultLabel since it's a new round!
            resultLabel.isHidden = true
            } else {
                playAgainButton.isHidden = false
                resultLabel.text = "Whoops! You missed! Try again later"
            }
        } else {
            if Int(numSlider.value) == randomNumber {
                resultLabel.text = "You were right on point! Bullseye!"
                  
                  // The code below is exactly the same as the code above ^.^
                  
                range += 50
                rangeLabel.text = String(range)
                numSlider.maximumValue = Float(range)
                  
                level += 1
                currentLevel.text = String(level)
                  
                numSlider.setValue(Float(range / 2), animated: false)
                randomNumber = Int(arc4random_uniform(UInt32(range + 1)))
                numLabel.text = String(randomNumber)
                resultLabel.isHidden = true
            } else {
                  // Make sure to move this line of code to this else statement so we can only show "Play Again" when the user loses
                playAgainButton.isHidden = false
                resultLabel.text = "Whoops! You missed! Try again later"
            }
    }
        
        resultLabel.isHidden = false //we'll come back to this
        
    }
    
    @IBAction func playAgain(_ sender: Any) {
        numSlider.setValue(50.0, animated: false)
        randomNumber = Int(arc4random_uniform(101))
        numLabel.text = String(randomNumber)
        resultLabel.isHidden = true //must reappear next time it is checked ^
        playAgainButton.isHidden = true
        
        range = 100
        rangeLabel.text = String(range)
        numSlider.maximumValue = Float(range)
                
        level = 1
        currentLevel.text = String(level)
        
        if (level > highestScore) && (highestScore != 1) {
            highestScore = level
            highScore.text = String(highestScore)
        }
    }
    
    @IBAction func sliderValueChanged(_ sender: Any) {
        
    }
    
    @IBAction func HighScore(_ sender: Any) {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        highScore.text = String(highestScore)
        randomNumber = Int(arc4random_uniform(101))
        numLabel.text = String(randomNumber)
        
        // Exercise 2E
        rangeLabel.text = String(range)
        currentLevel.text = String(level)
        
    }

}

