//
//  HowToPlayViewController.swift
//  SlideMan
//
//  Created by Vigneshraj Sekar Babu on 5/13/18.
//  Copyright © 2018 Vigneshraj Sekar Babu. All rights reserved.
//

import UIKit

class HowToPlayViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func backToGamePressed(_ sender: UIButton) {
        //code to go back to the Game screen
        self.dismiss(animated: true) {
            print("went back to game screen")
        }
    }
    

}
