//
//  ViewController.swift
//  SlideMan
//
//  Created by Vigneshraj Sekar Babu on 5/13/18.
//  Copyright © 2018 Vigneshraj Sekar Babu. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

   
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var totalScoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var gameSlider: UISlider!
    @IBOutlet weak var highScoreLabel: UILabel!
    
    //setting up a constant for the user default to store the High Score
    let defaults = UserDefaults.standard
    var round : Int = 0
    var score : Int = 0
    var target : Int = 0
    let gameRange : UInt32 = 99
    let numberOfRounds : Int = 5
    var highScore : Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print( defaults.integer(forKey: "HighScore"))
        highScore = defaults.integer(forKey: "HighScore")
        resetGame()
   
       
    }

  
    @IBAction func hitMePressed(_ sender: UIButton) {
        //logic
        
   
            let userSliderValue = Int(gameSlider.value)
            calculateScore(sliderValue: userSliderValue)
             round += 1
        
            updateUI()
        
    
        
    }
    
    func calculateScore(sliderValue : Int)  {
        let difference =  (target - sliderValue) > 0 ? target - sliderValue : (-1 * (target - sliderValue))
        //print("difference: \(difference)")
        let roundScore = difference > 25 ? 0 : 50 - (difference)
        //print("round score : \(roundScore)")
         score = score + roundScore
        
        if round == 5 {
            presentGameOverAlert(roundScoreParam: roundScore)
          
            
        } else if round < 5 {
            presentAlert(roundScoreParam: roundScore)
            
           
            
        }
     

        
    }
    
    @IBAction func resetPressed(_ sender: UIButton) {
        //call reset game method
        let resetAlert = UIAlertController(title: "Restart", message: "Are you sure?", preferredStyle: .alert)
        let resetActionRestart = UIAlertAction(title: "Restart", style: .default) { (action) in
            self.resetGame()
        }
        let resetActionCancel = UIAlertAction(title: "Cancel", style: .default) { (action) in
            //do nothing
        }
        resetAlert.addAction(resetActionRestart)
        resetAlert.addAction(resetActionCancel)
        present(resetAlert, animated: true)
        
    }
    
    @IBAction func infoPressed(_ sender: UIButton) {
        //take to how to play storyboard
        performSegue(withIdentifier: "howToPlaySegue", sender: self)
    }
    
    func generateRandomNumber() -> Int {
        target = Int(arc4random_uniform(gameRange) + 1)
        return target
    }
    
    func setTargetLabel(targetParameter : Int)  {
        targetLabel.text = "The Target for this round is \(targetParameter)"
    }
    
    func setScore(scoreParameter : Int) {
        //add values passed with Total to get Total score
        //score = score + scoreParameter
        totalScoreLabel.text = "Total Score: \(scoreParameter)"
    }
    
    func setRoundLabel(roundParameter : Int) {
        roundLabel.text = "Round: \(roundParameter)"
    }
    
    func resetGame() {
        score = 0
        round = 1
        updateUI()
    }
    
    func updateUI()  {
        highScoreLabel.text = "High Score: \(highScore)"
        gameSlider.value = 0.0
        target = generateRandomNumber()
        setTargetLabel(targetParameter: target)
        setScore(scoreParameter: score)
        setRoundLabel(roundParameter: round)
        
    }
    
    func messageText(roundScore : Int) -> String {
        var message = ""
        switch roundScore {
        case 50:
            message = "Excellent Job! Score for this round is \(roundScore)"
        case 35..<50:
            message = "Good Job! Score for this round is \(roundScore)"
        case 1..<35:
            message = "Better luck next time. Score for this round is \(roundScore)"
        case 0 :
            message = "Poor! You scored 0"
        default:
            message = "Well done!"
        }
        return message
    }
    
    func presentAlert(roundScoreParam : Int) {
        print(roundScoreParam)
        let alert = UIAlertController.init(title: "Round \(round)", message: messageText(roundScore: roundScoreParam), preferredStyle: .alert)
        let action = UIAlertAction.init(title: "OK" , style: .default) { (alert) in
           // self.updateUI()
        }
        
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    func presentGameOverAlert(roundScoreParam : Int) {
        let gameOverAlert = UIAlertController(title: "Game Over!", message: "\(messageText(roundScore: roundScoreParam)). Your Total score is \(score) ", preferredStyle: .alert)
        let gameOverAction = UIAlertAction(title: "Restart", style: .default) { (gameOverAlert) in
            self.checkHighScore()
            self.resetGame()
        }
        gameOverAlert.addAction(gameOverAction)
        present(gameOverAlert, animated: true)
        
    }
    
    func checkHighScore(){
        if score > highScore {
            highScore = score
            print(highScore)
            defaults.set(highScore, forKey: "HighScore")
        }
    }
    
}

