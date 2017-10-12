//
//  Deck.swift
//  Deuces
//
//  Created by Raymond Kwan on 7/20/17.
//  Copyright © 2017 Raymond Kwan. All rights reserved.
//

import UIKit

class Deck {
    var deck = [Card]()
    init() {
        createNewFullDeck()
        shuffle(times: 5)
    }
    
    func createNewFullDeck() {
        if (!deck.isEmpty)
        {
            deck.removeAll()
        }
        
        let values = ["three", "four", "five", "six", "seven", "eight", "nine", "ten", "jack", "queen", "king", "ace", "two"]
        let suits = ["spades", "clubs", "hearts", "diamonds"]
        for value in values {
            for suit in suits {
                self.deck.append(Card(suit: suit, value: value)!)
            }
        }
    }
    
    func shuffle(times: Int) {
        if (deck.isEmpty){
            return}
        var shuffledDeck = [Card]()
       
        for _ in 0..<times{
            for _ in deck {
                let randomCardInt: Int = Int(arc4random_uniform(UInt32(deck.count)))
                shuffledDeck.append(deck[randomCardInt])
                deck.remove(at: randomCardInt)
            }
        }
        deck = shuffledDeck
        shuffledDeck.removeAll()
    }
    
    func deal(p1: Player, p2: Player, p3: Player, p4: Player){
        let players = [p1, p2, p3, p4]
        while !deck.isEmpty {
            for player in players {
                player.dealMe(deck.last!)
                deck.removeLast()
            }
        }
    }
    
}
