//
//  ViewController.swift
//  ios11-stanford
//
//  Created by Phuc Nguyen on 6/30/18.
//  Copyright © 2018 Phuc Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var flipCount = 0 {
        didSet{
            flipCountLabel.text = "Flip: \(flipCount)"
        }
    }// no need choose type for this, becasue 0 clearly Int
    
    var emojChooses: Array<String> = ["😝","😁","😝","😁"] // No need choose exactly type of variable
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBAction func touchCard(_ sender: UIButton){
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender) {
            flipCard(withEmoj: emojChooses[cardNumber], on: sender)
            print("this is number of card: \(cardNumber)")
        }else{
            print("Error")
        }
        
    }

    func flipCard(withEmoj emoj: String, on button: UIButton){
        print("this is a test\(emoj)")
        if(button.currentTitle == emoj){
            button.setTitle("", for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        } else {
            button.setTitle(emoj, for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        }
        
    }
    
}

