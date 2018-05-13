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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

  
    @IBAction func hitMePressed(_ sender: UIButton) {
        //logic
    }
    
    @IBAction func resetPressed(_ sender: UIButton) {
        //reset the game
    }
    
    @IBAction func infoPressed(_ sender: UIButton) {
        //take to how to play storyboard
    }
    
}

