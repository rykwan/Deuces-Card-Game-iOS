//
//  PlayerViewController.swift
//  Deuces
//
//  Created by Raymond Kwan on 10/11/17.
//  Copyright © 2017 Raymond Kwan. All rights reserved.
//

import Foundation
import UIKit

class PlayerVC: UIViewController {
    var cardsToPlay = [Card]()
    var currentPlayer : Player? = nil
    var cardViews = [UIImageView]()
    var table = [UIImageView]()
    var m_lastwin = false

    var m_game : Game? = nil
    var gameOver : Bool = false
    var winner : Player? = nil
    @IBOutlet weak var playerNameLabel: UILabel!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        
        setUpImages()
        nextTurnBtnOutlet.isHidden = true
        
        let g = Game(viewController: self)
        let p1 = HumanPlayer(name: "Alan", game: g), p2 = Player(name: "Bob", game: g), p3 = Player(name: "Clare", game: g), p4 = Player(name: "Dani", game: g)
        
        guard g.setupGame(p1: p1, p2: p2, p3: p3, p4: p4) else {
            return
        }
        m_game = g
        showPlayerViewOf(player: (m_game?.players[0])!, lastPlayed: cardsToPlay, lastwin: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showPlayerViewOf(player: Player, lastPlayed: [Card], lastwin: Bool) {
        playerNameLabel.text = "\(player.name())'s Turn"
        m_lastwin = lastwin
        currentPlayer = player
        cardsToPlay.removeAll()
        for (index, img) in cardViews.enumerated() {
            if index >= player.numCardsLeft() {
                img.isHidden = true
            }
            else {
            img.isHidden = false
            img.image = currentPlayer?.hand[index].image
            }
        }
        
        updateTableCards(lastPlayed: lastPlayed)
        
    }
    
    private func updateTableCards(lastPlayed: [Card]) {
        for (index, img) in table.enumerated() {
            if index >= lastPlayed.count {
                img.isHidden = true
            }
            else {
                img.isHidden = false
                img.image = lastPlayed[index].image
            }
        }

    }
    
    
    
    //MARK: Buttons
    @IBOutlet weak var passTurnBtnOutlet: UIButton!
    @IBOutlet weak var nextTurnBtnOutlet: UIButton!
    @IBOutlet weak var playTurnBtnOutlet: UIButton!
    
    @IBAction func playTurnButton(_ sender: UIButton) {
        
        let combo = CardCombo(cards: cardsToPlay)
        if (combo == nil)
        {
            cardsToPlay.removeAll()
        }
        else if (m_lastwin || (m_game?.lastHandPlayed.isEmpty)!) || (combo?.isBetterCombo(other: CardCombo(cards: (m_game?.lastHandPlayed)!)!))!
        {
            m_game?.lastHandPlayed = cardsToPlay
            updateTableCards(lastPlayed: cardsToPlay)
            
            if currentPlayer?.numCardsLeft() == 0
            {
                playerNameLabel.text = "\(currentPlayer?.name()) wins!"
            }
            else
            {
            
            nextTurnBtnOutlet.isHidden = false
            playTurnBtnOutlet.isHidden = true
            passTurnBtnOutlet.isHidden = true
            for cv in cardViews{
                cv.isHidden = true
            }
            let nextUp = (m_game?.currentTurn)! < 4 ? (m_game?.currentTurn)!+1 : 1
            playerNameLabel.text = "Next up: " + (m_game?.players[nextUp-1].name())!
            }
            
        }
        else
        {
            cardsToPlay.removeAll()
        }
        
    }

    @IBAction func nextTurnButton(_ sender: UIButton) {
        nextTurnBtnOutlet.isHidden = true
        playTurnBtnOutlet.isHidden = false
        passTurnBtnOutlet.isHidden = false
        m_game?.play(beat: true)
    }

    @IBAction func passButton(_ sender: UIButton) {
        if !m_lastwin
        {
        m_game?.play(beat: false)
        }
    }
    
    //MARK: ImageViews
    
    @IBOutlet weak var tableHand: UIImageView!
    @IBOutlet weak var tablehand2: UIImageView!
    @IBOutlet weak var tablehand3: UIImageView!
    @IBOutlet weak var tablehand4: UIImageView!
    @IBOutlet weak var tablehand5: UIImageView!
    @IBOutlet weak var hand1: UIImageView!
    @IBOutlet weak var hand2: UIImageView!
    @IBOutlet weak var hand3: UIImageView!
    @IBOutlet weak var hand4: UIImageView!
    
    @IBOutlet weak var hand5: UIImageView!
    @IBOutlet weak var hand6: UIImageView!
    @IBOutlet weak var hand7: UIImageView!
    @IBOutlet weak var hand8: UIImageView!
    @IBOutlet weak var hand9: UIImageView!
    @IBOutlet weak var hand10: UIImageView!
    @IBOutlet weak var hand11: UIImageView!
    @IBOutlet weak var hand12: UIImageView!
    @IBOutlet weak var hand13: UIImageView!
    
    
    func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        let id = Int(tappedImage.restorationIdentifier!)
        
        tappedImage.image = tappedImage.image!.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
        tappedImage.tintColor = UIColor.blue
        
        
        //////FIGURE OUT HOW TO REMOVE A CARD
        
        cardsToPlay.append( (currentPlayer?.hand[id!-1])! )
        
    }
    
    private func setUpImages() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        let tapGestureRecognizer2 = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        let tapGestureRecognizer3 = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        let tapGestureRecognizer4 = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        let tapGestureRecognizer5 = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        let tapGestureRecognizer6 = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        let tapGestureRecognizer7 = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        let tapGestureRecognizer8 = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        let tapGestureRecognizer9 = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        let tapGestureRecognizer10 = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        let tapGestureRecognizer11 = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        let tapGestureRecognizer12 = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        let tapGestureRecognizer13 = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        
        
        cardViews.append(hand1)
        cardViews.append(hand2)
        cardViews.append(hand3)
        cardViews.append(hand4)
        cardViews.append(hand5)
        cardViews.append(hand6)
        cardViews.append(hand7)
        cardViews.append(hand8)
        cardViews.append(hand9)
        cardViews.append(hand10)
        cardViews.append(hand11)
        cardViews.append(hand12)
        cardViews.append(hand13)
        
        table.append(tableHand)
        table.append(tablehand2)
        table.append(tablehand3)
        table.append(tablehand4)
        table.append(tablehand5)
        
        
        
        hand1.addGestureRecognizer(tapGestureRecognizer)
        hand2.addGestureRecognizer(tapGestureRecognizer2)
        hand3.addGestureRecognizer(tapGestureRecognizer3)
        hand4.addGestureRecognizer(tapGestureRecognizer4)
        hand5.addGestureRecognizer(tapGestureRecognizer5)
        hand6.addGestureRecognizer(tapGestureRecognizer6)
        hand7.addGestureRecognizer(tapGestureRecognizer7)
        hand8.addGestureRecognizer(tapGestureRecognizer8)
        hand9.addGestureRecognizer(tapGestureRecognizer9)
        hand10.addGestureRecognizer(tapGestureRecognizer10)
        hand11.addGestureRecognizer(tapGestureRecognizer11)
        hand12.addGestureRecognizer(tapGestureRecognizer12)
        hand13.addGestureRecognizer(tapGestureRecognizer13)
        
    }
    
    
    
}
