//
//  ViewController.swift
//  ecolyze
//
//  Created by Kareena Arora on 1/23/22.
//

import UIKit

class ViewController: UIViewController {



    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var LogInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //button
        signUpButton.backgroundColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1)
        signUpButton.layer.cornerRadius = 25.0
        signUpButton.tintColor = UIColor.white
        
        //button
        LogInButton.backgroundColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1)
        LogInButton.layer.cornerRadius = 25.0
        LogInButton.tintColor = UIColor.white
        
        // Do any additional setup after loading the view.
    }
    
}

