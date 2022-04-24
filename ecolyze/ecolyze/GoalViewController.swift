//
//  GoalViewController.swift
//  ecolyze
//
//  Created by Kareena Arora on 1/31/22.
//

import UIKit
import Firebase

class GoalViewController: UIViewController {
    

    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var goalTextField: UITextField!
//        didSet {
//            let leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 10.0, height: 2.0))
//            goalTextField.leftView = leftView
//            goalTextField.leftViewMode = .always
//        }
    
    
    @IBOutlet weak var getStartedGoalButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
        
        func styleTextField(_ textfield:UITextField) {
            
            let bottomLine = CALayer()
            bottomLine.frame = CGRect(x: 0, y: textfield.frame.height - 2, width: textfield.frame.width, height: 2)
            
            bottomLine.backgroundColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1).cgColor
            
            textfield.borderStyle = .none
            
            textfield.layer.addSublayer(bottomLine)
            
            
            
        }
        
        getStartedGoalButton.backgroundColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1)
        getStartedGoalButton.layer.cornerRadius = 25.0
        getStartedGoalButton.tintColor = UIColor.white

        styleTextField(goalTextField)
        
        
        // Do any additional setup after loading the view.
    }
    
    func setUpElements() {
        errorLabel.alpha = 0
    }
    
    func validateFields() -> String? {

        if goalTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "9" || goalTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "8" || goalTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "7" ||
            goalTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "6" ||               goalTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "5" || goalTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "4" ||
                goalTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "3" || goalTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "2" || goalTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "1" || goalTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "0"
            {
            
            return "Please enter a number higher than 10"
        }
        else if goalTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""
        {
            return "Please fill in a goal. Recommended is -35 lbs."
        }
        
        
        return nil
    }
    
    @IBAction func getStartedGoalTapped(_ sender: Any) {
        
        let error = validateFields()
        if error != nil {
            showError(error!)
        }
        else {
            
            let goal = goalTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
            let db = Firestore.firestore()
            let user = Auth.auth().currentUser?.uid
            
//            let userCollection = db.collection("users").document(user!)
//            userCollection.updateData(["goal" : goal])
            
            db.collection("users").whereField("uid", isEqualTo: user!)
                .getDocuments() { (querySnapshot, err) in
                    if let err = err {
                        print("Error getting documents: \(err)")
                    } else {
                        for document in querySnapshot!.documents {
                            document.reference.updateData([
                                "goal": goal
                            ])
                        }
                    }
                    
                    
/*  https://stackoverflow.com/questions/62806693/how-to-access-a-firebase-field-in-swift */
                    
            }
        
        }
        
    }
    

    func showError(_ message:String){
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if(segue.identifier == "HomeVC"){
            let custMainVC = segue.destination as! UITabBarController
            let HomeVC = custMainVC.viewControllers!.first as! HomeViewController
            HomeVC.goal = goalTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            //print("GVC homevc goal", HomeVC.goal)
            
            //print(goalTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines))
            
/* https://stackoverflow.com/questions/58263494/how-to-pass-data-between-view-controller-and-the-tab-bars-view-controllers-usin
 
 */
            
        }
    }
    

}



