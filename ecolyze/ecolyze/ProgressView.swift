//
//  ProgressView.swift
//  ecolyze
//
//  Created by Kareena Arora on 3/9/22.
//

import UIKit

class ProgressView: UIView {
    
    private var circleLayer = CAShapeLayer()
    private var progressLayer = CAShapeLayer()
    private var start = CGFloat(-Double.pi / 2)
    private var end = CGFloat(3 * Double.pi / 2)


    
    override init(frame: CGRect) {
            super.init(frame: frame)
       
        }
        
        required init?(coder: NSCoder) {
            super.init(coder: coder)
        }
    
    
    func createCircularPath() {
            
            let circularPath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0), radius: 120, startAngle: start, endAngle: end, clockwise: true)
            
            circleLayer.path = circularPath.cgPath
          
            circleLayer.fillColor = UIColor.clear.cgColor
            circleLayer.lineCap = .round
            circleLayer.lineWidth = 20.0
            circleLayer.strokeEnd = 1.0
            circleLayer.strokeColor = UIColor.lightGray.cgColor
 
            layer.addSublayer(circleLayer)

            progressLayer.path = circularPath.cgPath

            progressLayer.fillColor = UIColor.clear.cgColor
            progressLayer.lineCap = .round
            progressLayer.lineWidth = 20.0
            progressLayer.strokeEnd = 0
            progressLayer.lineCap = .round
            progressLayer.strokeColor = UIColor.systemGreen.cgColor

            layer.addSublayer(progressLayer)
        
    }
    
    
    
    func progressAnimation(duration: TimeInterval) {
           
        let circularProgressAnimation = CABasicAnimation(keyPath: "strokeEnd")
                
  
        if Singleton.sharedInstance.numLabel != nil  {
            
            let currentNumber = Double(Singleton.sharedInstance.numLabel!)!
            //let goalNumber = Double(goal ?? "35")!
            let goalNumber = 35.0
            let newNumber = currentNumber/goalNumber
            
            circularProgressAnimation.duration = duration
            circularProgressAnimation.toValue = newNumber
            circularProgressAnimation.fillMode = .forwards
            circularProgressAnimation.isRemovedOnCompletion = false
            progressLayer.add(circularProgressAnimation, forKey: "progressAnim")
            
        }
        
        //NEEDS to be if numLabel is equal to goal number entered, however need to figure out how to get goalLabel.text into progressView - add to singleton? or is that even possible?
        
        else if Singleton.sharedInstance.numLabel == "35" {

            circularProgressAnimation.duration = duration
            circularProgressAnimation.toValue = 1.0
            circularProgressAnimation.fillMode = .forwards
            circularProgressAnimation.isRemovedOnCompletion = false
            progressLayer.add(circularProgressAnimation, forKey: "progressAnim")

        }
        
        
        
    }
    

}

/*https://cemkazim.medium.com/how-to-create-animated-circular-progress-bar-in-swift-f86c4d22f74b*/
