//
//  HomeViewController.swift
//  ecolyze
//
//  Created by Kareena Arora on 1/23/22.
//

import UIKit
import Firebase
//var goal : String?

class HomeViewController: UIViewController {

    @IBOutlet weak var goalLabel: UILabel!
    
    @IBOutlet weak var numLabel: UILabel!
    
    @IBOutlet weak var goalAchievedLabel: UILabel!
    
    var goal : String?
    
    
    var circleProgressView: ProgressView!
    var circleViewDuration: TimeInterval = 2
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
    }
    
    
  func setUpCircularProgressView() {

        circleProgressView = ProgressView(frame: .zero)
        circleProgressView.center = view.center
        circleProgressView.createCircularPath()
        circleProgressView.progressAnimation(duration: circleViewDuration)
        view.addSubview(circleProgressView)

    }
    

    override func viewWillAppear(_ animated: Bool) {
        
        setUpCircularProgressView()
        
        goalLabel.text = goal
        
        numLabel.text = Singleton.sharedInstance.numLabel
        print (numLabel.text ?? " ")
        
        if Singleton.sharedInstance.numLabel == "35" {
            goalAchievedLabel.text = "Goal Achieved!!!"
        }

    }
    

}

/* function to make .toValue turn what is entered in the num label into an integer and then divide it by what is entered into the goalLabel.text - however goallabel.text is not accessible in this vc
    
     func toValueConvert(){
     
        let currentNumber = Int(Singleton.sharedInstance.numLabel!)!
        let goalNumber = 35
        let newNumber = currentNumber / goalNumber
        circularProgressAnimation.toValue = newNumber
     
     } */
