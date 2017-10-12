//
//  Player.swift
//  Deuces
//
//  Created by Raymond Kwan on 7/20/17.
//  Copyright © 2017 Raymond Kwan. All rights reserved.
//

import UIKit

// take argument of game? game has board? player has board?


class Player {
    //MARK: properties
    var hand = [Card]()
    private var m_name : String
    var m_game : Game
    
    //MARK: Initialization of base Player class
    init(name: String, game: Game){
        self.m_name = name
        self.m_game = game
    }
    
    //MARK: Setters
    func dealMe(_ newCard: Card) {
        hand.append(newCard)
    }
    
    //MARK: Getters
    func numCardsLeft() -> Int {
        return self.hand.count
    }
    func name() -> String {
        return self.m_name
    }

    //MARK: play functions.. must be overridden
    func arrangeCards() {}
    func playTurn(cards:[Card], lastwin: Bool) -> CardCombo? { return nil }
    func passTurn() -> Bool { return false }
    
    // helper:
    func removeCards(cards: [Card]) -> Bool {
        if cards.isEmpty { return false }
        var found : Bool = false
        for card in cards {
            for (index, c) in hand.enumerated() {
                if card.fullDescription == c.fullDescription {
                    hand.remove(at: index)
                    found = true
                    break
                }
            }
            if !found {
                return false
            }
            found = false
        }
        return true
    }
    
}

class HumanPlayer : Player{
    override init(name: String, game: Game) {
        super.init(name: name, game: game)
    }
    var currentPlay = [Card]()
   
    
    override func playTurn(cards: [Card], lastwin: Bool) -> CardCombo? {
        
        guard let combo = CardCombo(cards: cards ) else {
            return nil
        }
        guard m_game.lastHandPlayed != nil else {
            m_game.lastHandPlayed = cards
            removeCards(cards: cards)
            return combo
        }
        if lastwin || m_game.lastHandPlayed.isEmpty
        {
            m_game.lastHandPlayed = cards
            removeCards(cards: cards)
            return combo
        }
        
        if combo.isBetterCombo(other: CardCombo(cards: m_game.lastHandPlayed)!) {
            removeCards(cards: cards)
            m_game.lastHandPlayed = cards
            return combo
        }

        return nil
    }

}



class ComputerPlayer : Player{
    
}
