//
//  PlayingCardDeck.swift
//  PlayingCard
//
//  Created by Georgi Teoharov on 18.04.18.
//  Copyright © 2018 Georgi Teoharov. All rights reserved.
//

import Foundation

struct PlayingCardDeck {
    
    private(set) var cards = [PlayingCard]()
    
    mutating func draw() -> PlayingCard? {
        if cards.isEmpty { return nil }
        return cards.remove(at: cards.count.arc4Random)
    }
    
    init() {
        for suit in PlayingCard.Suit.all {
            for rank in PlayingCard.Rank.all {
                cards.append(PlayingCard(suit: suit, rank: rank))
            }
        }
    }
}

extension Int {
    var arc4Random: Int {
        switch self {
        case 1...Int.max:
            return Int(arc4random_uniform(UInt32(self)))
        case -Int.max..<0:
            return Int(arc4random_uniform(UInt32(self)))
        default:
            return 0
        }
        
    }
}
