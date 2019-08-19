//
//  ViewController.swift
//  Bigger Or Smaller : Card Game
//
//  Created by Ishwar Choudhary on 11/06/19.
//  Copyright © 2019 Ishwar Choudhary. All rights reserved.
//

import UIKit
//means we want to use this library

//means the view controller is based off another class. inheritance
class ViewController: UIViewController {
    
    //hooked up the object in the storyboard to the proterty in the view controller
    @IBOutlet weak var leftImageView: UIImageView!
    
    @IBOutlet weak var rightImageView: UIImageView!
    
    @IBOutlet weak var leftScoreLabel: UILabel!
    
    @IBOutlet weak var rightScoreLabel: UILabel!
    
    //game starts of with both scores as 0
    var leftScore = 0
    var rightScore = 0
    
    //total tries
    let total_tries = 15
    var init_tries = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        

    }
    
    
    @IBAction func dealTapped(_ sender: Any) {
        
        if init_tries < total_tries {
            //lets generate numbers in the range of 2-14
            let leftNumber = Int.random(in: 2...14)
            let rightNumber = Int.random(in: 2...14)
            
            //convert that into a string and apped to the card name varaible
            let leftcardname = "card" + String(leftNumber)
            let rightcardname = "card" + String(rightNumber)
            
            leftImageView.image = UIImage(named: leftcardname) //creates a new UI IMAGE OBJECT and assign it to the image property to that view
            
            rightImageView.image = UIImage(named: rightcardname)
            
            
            //now lets update the score labels
            if leftNumber > rightNumber {
                //left player wins
                leftScore += 1
                leftScoreLabel.text  = String(leftScore)
            }
            else if leftNumber < rightNumber
            {
                //right player wins
                rightScore += 1
                rightScoreLabel.text = String(rightScore)
                
            }
            else
            {
                //draw and both get a point
                leftScore += 1
                rightScore += 1
                leftScoreLabel.text  = String(leftScore)
                rightScoreLabel.text = String(rightScore)
                
            }
            
            init_tries += 1
        }
        
        else
        {
            leftScoreLabel.text = "0"
            rightScoreLabel.text = "0"

            leftScore = 0
            rightScore = 0
            init_tries = 0
        }

    }

    //new game button
    
    @IBAction func newGame(_ sender: Any) {
        
        leftScoreLabel.text = "0"
        rightScoreLabel.text = "0"
        
        leftScore = 0
        rightScore = 0
        
        
    }
    
}

