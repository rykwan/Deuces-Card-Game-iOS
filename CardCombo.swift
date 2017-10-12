//
//  cardCombo.swift
//  Deuces
//
//  Created by Raymond Kwan on 7/20/17.
//  Copyright © 2017 Raymond Kwan. All rights reserved.
//

import UIKit

class CardCombo {
    enum comboType : Int {
        case single = 1, pair, triple, straight, flush, fullHouse, fourOfaKind, straightFlush
    }
    //MARK: member variables
    var numCardsInCombo : Int
    var comboType : comboType? = nil
    var highestCard : Card? = nil
    var cards : [Card]
    
    //MARK: initialization
    init?(cards: [Card]){
        self.cards = cards
        if cards.count > 5 || cards.isEmpty
        { return nil }
        self.numCardsInCombo = cards.count
        
        if let combo = determineComboType(cards: cards) {
            self.comboType = combo
        }
        else {
            return nil  // returns nil if not a valid combination
        }

        if self.comboType != .fullHouse && self.comboType != .fourOfaKind {
            self.highestCard = greatestCardInSet(cards: cards)
        }
        
    }
    
    
    func isBetterCombo(other: CardCombo) -> Bool {
        if self.numCardsInCombo != other.numCardsInCombo
        {
            return false
        }
        
        if (self.comboType?.rawValue)! > (other.comboType?.rawValue)! {
            return true
        }
        
        if (self.highestCard?.isBetterCard(otherCard: other.highestCard!))! {
            return true
        }
        
        return false
    }
    
    //MARK: helper functions to initialize variables
    func greatestCardInSet(cards: [Card]) -> Card {
        var highCard : Card = cards[0]
        for i in 1..<cards.count{
            if cards[i].value.rawValue > highCard.value.rawValue {
                highCard = cards[i]
            } else if cards[i].value.rawValue == highCard.value.rawValue && cards[i].suit.rawValue > highCard.suit.rawValue {
                highCard = cards[i]
            }
        }
        return highCard
    }
    
    func determineComboType(cards: [Card]) -> comboType? {
        let numCards = cards.count
        if numCards == 1 {
            return .single
        }
        if numCards == 2 {
            if ( cards[0].value == cards[1].value ) {
                
                return .pair
            }
            else {
                return nil
            }
        }
        if numCards == 3 {
            if cards[0].value == cards[1].value && cards[0].value == cards[2].value {
                return .triple
            }
            else {
                return nil
            }
        }
        if numCards == 5 {
            let sortedCards = sortByValue(cards: cards)
            
            if isAStraight(sortedCards: sortedCards) {
                if isAFlush(cards: cards) {
                    return .straightFlush }
                else {
                    return .straight }
            } else if isAFlush(cards: cards) {
                return .flush
            }
            
            if ( isAFullHouse(sortedCards: sortedCards))
            { return .fullHouse }
            
            if ( isAFourOfaKind(sortedCards: sortedCards)) {
                return .fourOfaKind
            }
            
        }
        
        return nil
    }
    
    func isAStraight(sortedCards: [Card]) -> Bool {
        for i in 1..<sortedCards.count {
            if sortedCards[i].value.rawValue != sortedCards[i-1].value.rawValue + 1 {
                return false
            }
        }
        return true   
    }
    
    func isAFlush(cards: [Card]) -> Bool {
        let sameSuit = cards[0].suit
        for card in cards {
            if card.suit != sameSuit {
                return false
            }
        }
        return true
    }
    
    func isAFullHouse(sortedCards: [Card]) -> Bool {
        if numberOfMatchingValues(cards: sortedCards, match: sortedCards[0]) == 3 && numberOfMatchingValues(cards: sortedCards, match: sortedCards[3]) == 2 {
            self.highestCard = sortedCards[0]
            return true
        }
        else if numberOfMatchingValues(cards: sortedCards, match: sortedCards[0]) == 2 && numberOfMatchingValues(cards: sortedCards, match: sortedCards[3]) == 3 {
            self.highestCard = sortedCards[3]
            return true
        } else {
        return false
        }
    }
    
    func isAFourOfaKind(sortedCards: [Card]) -> Bool {
        if numberOfMatchingValues(cards: sortedCards, match: sortedCards[0]) == 4
        {
            self.highestCard = sortedCards[0]
            return true
        }
        else if numberOfMatchingValues(cards: sortedCards, match: sortedCards[1]) == 4  {
            self.highestCard = sortedCards[1]
            return true   }
        else {
            return false
        }
    }
    
    func sortByValue(cards: [Card]) -> [Card] {
        guard cards.count > 1 else { return cards }
        
        var sortedSet = cards
        for i in 1..<sortedSet.count {
            var y = i
            let temp = sortedSet[y]
            while y > 0 && temp.value.rawValue < sortedSet[y-1].value.rawValue {
                sortedSet[y] = sortedSet[y - 1]
                y -= 1
            }
            sortedSet[y] = temp
        }
        return sortedSet
    }
    
    func numberOfMatchingValues(cards: [Card], match: Card) -> Int {
        if (cards.isEmpty)
        { return 0 }
        var count : Int = 0
        for card in cards {
            if card.value.rawValue == match.value.rawValue {
                count += 1
            }
        }
        return count
    }
}
