//
//  ViewController.swift
//  Deuces
//
//  Created by Raymond Kwan on 7/20/17.
//  Copyright © 2017 Raymond Kwan. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
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
    
    @IBAction func startNewGameButton(_ sender: UIButton) {
        let setupGame = storyboard?.instantiateViewController(withIdentifier: "SetupVC")
        
        self.present(setupGame!, animated:true, completion:nil)
    }
}

