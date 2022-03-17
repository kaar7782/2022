//
//  Intro1ViewController.swift
//  ecolyze
//
//  Created by Kareena Arora on 1/23/22.
//

import UIKit

class Intro1ViewController: UIViewController {

    @IBOutlet weak var backBarButtonItem: UINavigationItem!
    
    @IBOutlet weak var continueButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        continueButton.backgroundColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1)
        continueButton.layer.cornerRadius = 25.0
        continueButton.tintColor = UIColor.white
 
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
