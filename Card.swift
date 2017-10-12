//
//  Card.swift
//  Deuces
//
//  Created by Raymond Kwan on 7/20/17.
//  Copyright © 2017 Raymond Kwan. All rights reserved.
//

import UIKit

class Card {
    enum cardSuit : Int{
        case SPADES = 4
        case HEARTS = 3
        case CLUBS = 2
        case DIAMONDS = 1
    }
    
    enum cardValue : Int{
        case THREE = 0, FOUR, FIVE, SIX, SEVEN, EIGHT, NINE, TEN, JACK, QUEEN, KING, ACE, TWO
    }
    
    let suit : cardSuit
    let value : cardValue
    let image : UIImage
    let score : Int
    var fullDescription : String
    init?(suit: String, value: String)
    {
        switch (suit.lowercased()){
            case "spades":
                self.suit = .SPADES
                break
            case "hearts":
                self.suit = .HEARTS
                break
            case "clubs":
                self.suit = .CLUBS
                break
            case "diamonds":
                self.suit = .DIAMONDS
                break
            default:
                return nil
        }
        
        switch (value.lowercased()){
            case "three":
                self.value = .THREE
                break
            case "four":
                self.value = .FOUR
                break
            case "five":
                self.value = .FIVE
                break
            case "six":
                self.value = .SIX
                break
            case "seven":
                self.value = .SEVEN
                break
            case "eight":
                self.value = .EIGHT
                break
            case "nine":
                self.value = .NINE
                break
            case "ten":
                self.value = .TEN
                break
            case "jack":
                self.value = .JACK
                break
            case "queen":
                self.value = .QUEEN
                break
            case "king":
                self.value = .KING
                break
            case "ace":
                self.value = .ACE
                break
            case "two":
                self.value = .TWO
                break
            default:
                return nil
            }
        
        self.image = .init(imageLiteralResourceName: "\(value)_of_\(suit)")
        self.fullDescription = value + " of " + suit
        self.score = self.value.rawValue*10 + self.suit.rawValue*2
    }
    func isBetterCard(otherCard: Card) -> Bool {
        if self.score >= otherCard.score {
            return true
        }
        return false
    }
    
}
