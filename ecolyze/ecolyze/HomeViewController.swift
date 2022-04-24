//
//  HomeViewController.swift
//  ecolyze
//
//  Created by Kareena Arora on 1/23/22.
//

import UIKit
import Firebase
import SwiftUI
//var goal : String?

class HomeViewController: UIViewController {

    @IBOutlet weak var goalLabel: UILabel!
    
    @IBOutlet weak var numLabel: UILabel!
    
    @IBOutlet weak var goalAchievedLabel: UILabel!
    
    var goal : String?
    
    
    
    
    var circleProgressView: ProgressView!
    var circleViewDuration: TimeInterval = 2

  func setUpCircularProgressView() {

        circleProgressView = ProgressView(frame: .zero)
        circleProgressView.center = view.center
        circleProgressView.createCircularPath()
        circleProgressView.progressAnimation(duration: circleViewDuration, goalString: goal ?? "0")
        view.addSubview(circleProgressView)

    }
    

    override func viewWillAppear(_ animated: Bool) {
        //print("view will appear",goal)
        setUpCircularProgressView()
        
        goalLabel.text = goal
        
        let goalNumEntered = Double(goalLabel.text ?? " ")
        
        numLabel.text = Singleton.sharedInstance.numLabel
        
        let convertNumLabelDouble = Double(numLabel.text ?? " ")
        
        
        if convertNumLabelDouble ?? 0.0 >= goalNumEntered ?? 0.0 {

            goalAchievedLabel.text = "Goal Achieved!!!"
            
        }
        else if goalNumEntered == nil {
            
            goalAchievedLabel.text = " "
            
        }

    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
    }
    

}

