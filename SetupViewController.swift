//
//  SetupViewController.swift
//  Deuces
//
//  Created by Raymond Kwan on 10/12/17.
//  Copyright © 2017 Raymond Kwan. All rights reserved.
//

import Foundation
import UIKit

class SetupVC : UIViewController {
    //MARK: Properties
    
    @IBAction func startGame(_ sender: UIButton) {

        let playerGame = storyboard?.instantiateViewController(withIdentifier: "PlayerVC") as! PlayerVC!
        
        if (player1nm.text?.isEmpty)!
        {
            playerGame?.playerNames.append("Player1")
        }
        else
        {
        playerGame?.playerNames.append(player1nm.text!)
        }
        if (player2nm.text?.isEmpty)!
        {
            playerGame?.playerNames.append("Player2")
        }
        else
        {
            playerGame?.playerNames.append(player2nm.text!)
        }
        if (player3nm.text?.isEmpty)!
        {
            playerGame?.playerNames.append("Player3")
        }
        else
        {
            playerGame?.playerNames.append(player3nm.text!)
        }
        if (player4nm.text?.isEmpty)!
        {
            playerGame?.playerNames.append("Player4")
        }
        else
        {
            playerGame?.playerNames.append(player4nm.text!)
        }
        
        self.present(playerGame!, animated:true, completion:nil)


    }
        @IBOutlet weak var player4nm: UITextField!
        @IBOutlet weak var player3nm: UITextField!
        @IBOutlet weak var player2nm: UITextField!
        @IBOutlet weak var player1nm: UITextField!
        
    //MARK: Functions
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
}
