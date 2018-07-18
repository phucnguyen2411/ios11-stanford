//
//  Card.swift
//  ios11-stanford
//
//  Created by Phuc Nguyen on 7/4/18.
//  Copyright © 2018 Phuc Nguyen. All rights reserved.
//

import Foundation
struct Card {
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    private static var identifierFactory: Int = 0
    
    private static func getUniqueIdentifier() -> Int{
        identifierFactory += 1 // no need card becasue this var in struct
        return Card.identifierFactory
    }
    
    //Create init struct
    init(){
        self.identifier = Card.getUniqueIdentifier()
    }
}
