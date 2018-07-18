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
    private lazy var game = Concentration(numberOdPairCard: numberOdPairsOfCards)
    
    var numberOdPairsOfCards: Int {
        return (cardButtons.count + 1) / 2
    }
   
    private(set) var flipCount = 0 {
        didSet{
            flipCountLabel.text = "Flip: \(flipCount)"
        }
    }// no need choose type for this, becasue 0 clearly Int
    
    
    @IBOutlet private weak var flipCountLabel: UILabel!
    
    @IBOutlet private var cardButtons: [UIButton]!
    
    
    @IBAction private func touchCard(_ sender: UIButton){
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
    
    private func updateViewFromModel(){
        for index in cardButtons.indices{ // method count
            let button = cardButtons[index]
            let card = game.cards[index]
            //How to match card and see it matched
            if card.isFaceUp{
                button.setTitle(emoj(for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 0.2481482543, blue: 0.1285986646, alpha: 1)
            }else{
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
    
    private var emojChooses: Array<String> = ["1", "2", "3", "4", "5", "6"] // No need choose exactly type of variable
    
    private var emoj = Dictionary<Int, String>() // other ways u can use [Int:String]()
    
    private func emoj(for card: Card) -> String{
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

