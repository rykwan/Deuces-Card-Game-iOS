//
//  ViewController.swift
//  Deuces
//
//  Created by Raymond Kwan on 7/20/17.
//  Copyright © 2017 Raymond Kwan. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    @IBAction func justplaybutton(_ sender: UIButton) {
        let playerGame = storyboard?.instantiateViewController(withIdentifier: "PlayerVC")
        
        self.present(playerGame!, animated:true, completion:nil)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib.
        
        // card images on home screen, at an angle
        firstScreenLeftImage.image = Card(suit: "spades", value: "two")?.image
        firstScreenLeftImage.transform = CGAffineTransform(rotationAngle: (-30.0 * CGFloat(M_PI)) / 180.0)
        firstScreenRightImage.image = Card(suit: "hearts", value: "two")?.image
        firstScreenRightImage.transform = CGAffineTransform(rotationAngle: (-30.0 * CGFloat(M_PI)) / 180.0)
        
        self.view.backgroundColor = UIColor(colorLiteralRed: 175/255, green: 155/255, blue: 195/255, alpha: 1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: Properties
    @IBOutlet weak var firstScreenLeftImage: UIImageView!
    @IBOutlet weak var firstScreenRightImage: UIImageView!
    @IBOutlet weak var Smallview: UIView!
   
    @IBAction func startNewGameButton(_ sender: UIButton) {
        self.view.backgroundColor = UIColor(colorLiteralRed: 120/255, green: 100/255, blue: 0/255, alpha: 1)
        firstScreenLeftImage.image = Card(suit: "clubs", value: "three")?.image
      //  let playerGame = storyboard?.instantiateViewController(withIdentifier: "PlayerVC")
        
      //  self.present(playerGame!, animated:true, completion:nil)
    }
    @IBAction func joinGameButton(_ sender: UIButton) {
        let playerGame = storyboard?.instantiateViewController(withIdentifier: "PlayerVC")
        
        self.present(playerGame!, animated:true, completion:nil)
    }
}

