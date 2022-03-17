//
//  Index2ViewController.swift
//  ecolyze
//
//  Created by Kareena Arora on 2/12/22.
//

import UIKit

class Index2ViewController: UIViewController {
    
    @IBOutlet var backButton:UIButton!
    
    @IBOutlet var yesButton:UIButton!
    @IBOutlet var noButton:UIButton!
    
    @IBOutlet var noLabel:UILabel!
    
    @IBAction func buttonTapped() {
        print("Tapped")
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func yesButtonTapped() {
        
        noButton.isEnabled = false
        
        labelUpdate()
        createLayer()
        
    }
    
    @IBAction func noButtonTapped() {
        
        yesButton.isEnabled = false
        noLabel.text = "Try again tomorrow!"
        
    }
    
    func labelUpdate() {
        
        if Singleton.sharedInstance.numLabel == nil {
            
            Singleton.sharedInstance.numLabel = "\(Singleton.sharedInstance.index0)"
      
        }
       
        else if Singleton.sharedInstance.numLabel != nil {
            
            let currentNumber = Int(Singleton.sharedInstance.numLabel!)!
            let numberToAdd = Singleton.sharedInstance.index2
            let sum = numberToAdd + currentNumber
            Singleton.sharedInstance.numLabel = "\(sum)"
            
        }
    }
    
    private func createLayer() {
        
        let layer = CAEmitterLayer()
        layer.emitterPosition = CGPoint(x: view.center.x, y: -100)
        
        let colors: [UIColor] = [.systemRed, .systemGreen, .systemBlue, .systemPink, .systemTeal, .systemYellow, .systemOrange]

        
        let cells: [CAEmitterCell] = colors.compactMap {
            
            let cell = CAEmitterCell()
                                                                    
            cell.scale = 0.05
            cell.emissionRange = .pi * 2
            cell.lifetime = 5
            cell.birthRate = 50
            cell.velocity = 150
            cell.color = $0.cgColor
            cell.contents = UIImage(named: "image")?.cgImage
            
            return cell
        }
        
        layer.emitterCells = cells
        view.layer.addSublayer(layer)
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        yesButton.backgroundColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1)
        yesButton.layer.cornerRadius = 10.0
        yesButton.tintColor = UIColor.white
        
        noButton.backgroundColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1)
        noButton.layer.cornerRadius = 10.0
        noButton.tintColor = UIColor.white

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
