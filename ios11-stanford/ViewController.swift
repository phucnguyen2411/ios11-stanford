//
//  ViewController.swift
//  ios11-stanford
//
//  Created by Phuc Nguyen on 6/30/18.
//  Copyright © 2018 Phuc Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //lazy comment for no need initiziled
    lazy var game = Concentration(numberOdPairCard: (cardButtons.count + 1) / 2)
   
    var flipCount = 0 {
        didSet{
            flipCountLabel.text = "Flip: \(flipCount)"
        }
    }// no need choose type for this, becasue 0 clearly Int
    
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
    
    @IBAction func touchCard(_ sender: UIButton){
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender) {
//            flipCard(withEmoj: emojChooses[cardNumber], on: sender) part1
            //Call the method in Model
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
            print("this is number of card: \(cardNumber)")
        }else{
            print("Error")
        }
        
    }
    
    func updateViewFromModel(){
        for index in cardButtons.indices{ // method count
            let button = cardButtons[index]
            let card = game.cards[index]
            //How to match card and see it matched
            if card.isFaceUp{
                button.setTitle(emoj(for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }else{
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ?  #colorLiteral(red: 0.1294117719, green: 0.2156862766, blue: 0.06666667014, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
    
    var emojChooses: Array<String> = ["1","2","3","4"] // No need choose exactly type of variable
    
    var emoj = Dictionary<Int, String>() // other ways u can use [Int:String]()
    
    func emoj(for card: Card) -> String{
        //put emoj to Dic
        if emoj[card.identifier] == nil, emojChooses.count > 0 { // put 2 match in 1 line
                //create radom index
                let randomIndex = Int(arc4random_uniform(UInt32(emojChooses.count)))
                emoj[card.identifier] = emojChooses.remove(at: randomIndex)
        }

        //        if emoj[card.identifier] != nil {
    //            return emoj[card.identifier]
    //        } else {
    //            return "test";
    //        }
        return emoj[card.identifier] ?? "?"
    }

    //    func flipCard(withEmoj emoj: String, on button: UIButton){
    //        print("this is a test\(emoj)")
    //        if(button.currentTitle == emoj){
    //
    //        } else {
    //
    //        }
    //
    //    } This is from part 1

}

