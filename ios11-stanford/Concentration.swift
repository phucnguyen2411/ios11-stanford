//
//  Concentration.swift
//  ios11-stanford
//
//  Created by Phuc Nguyen on 7/4/18.
//  Copyright © 2018 Phuc Nguyen. All rights reserved.
//

import Foundation


class Concentration{
    //Create card
    var cards = Array<Card>()
    //[Card]
    
    //Crea flag to note card match
    var indexOfOneAndOnlyCardMatch: Int?
    
    func chooseCard(at index: Int){
        if !cards[index].isMatched {
            //Check if card matched
            if let matchedIndex = indexOfOneAndOnlyCardMatch, matchedIndex != index {
                cards[matchedIndex].isMatched = true
                cards[index].isMatched = true
            }
            cards[index].isFaceUp = true
            indexOfOneAndOnlyCardMatch = nil
        } else {
            //either  no card or 2 card are face up
            for flipDownIndex in cards.indices {
                cards[flipDownIndex].isFaceUp = false
                
            }
            cards[index].isFaceUp = true
            indexOfOneAndOnlyCardMatch = index
        }
    }
    
    init(numberOdPairCard: Int){
//        for identifier in 0..<numberOdPairCard { this mean from 0 to number -1
        for _ in 1...numberOdPairCard { //this mean from 1 to number
            let card = Card()
//            cards.append(card)
//            cards.append(card) //the same with below synx
            cards += [card, card]
        }
        // TODO: shuffle the card
    }
}
