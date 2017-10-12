//
//  Game.swift
//  Deuces
//
//  Created by Raymond Kwan on 7/20/17.
//  Copyright © 2017 Raymond Kwan. All rights reserved.
//

import UIKit

class Game {
    //MARK: Member Variables
    var lastHandPlayed = [Card]()
    var lastCardPlayer : Int = 1
    var currentTurn : Int = 1
    var players = [Player]()
    var gameIsOver : Bool = false
    var winner : Player? = nil
    let vc : PlayerVC
    init(viewController: PlayerVC) {
        self.vc = viewController
    }
    
    func setupGame(p1: Player, p2: Player, p3: Player, p4: Player) -> Bool {
        let startingDeck = Deck()
        players.append(p1)
        players.append(p2)
        players.append(p3)
        players.append(p4)
        startingDeck.deal(p1: p1, p2: p2, p3: p3, p4: p4)
        return true
    }
    
    //TODO: player goes first
    
    //TODO: order of game play, everyone needs to know
    
    // takes info from PlayerVC to update game and take next turn
    func play(beat: Bool) -> Bool {
        if beat
        {
            lastCardPlayer = currentTurn
        }
        if currentTurn < 4
        {currentTurn += 1}
        else
        {
            currentTurn = 1
        }

        let currentPlayer = players[currentTurn-1]
        let lastWin = currentTurn == lastCardPlayer
        vc.showPlayerViewOf(player: currentPlayer, lastPlayed: lastHandPlayed, lastwin: lastWin)
        return true
    }
    
    func getHandCount(player: Int) -> Int {
        if player < 1 || player > 4 {
            return -1
        }
        return players[player-1].numCardsLeft()
    }
    
    func allPlayersHandCounts() -> [Int] {
        var result = [Int]()
        for player in players {
            result.append(player.numCardsLeft())
        }
        return result
    }
    
    
}
