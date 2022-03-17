//
//  LogInViewController.swift
//  ecolyze
//
//  Created by Kareena Arora on 1/23/22.
//

import UIKit
import FirebaseAuth

class LogInViewController: UIViewController {

    @IBOutlet weak var ErrorLabel: UILabel!
    @IBOutlet weak var LogInButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    override func viewDidLoad() {
       
        super.viewDidLoad()
        setUpElements()
        
        //button
        LogInButton.backgroundColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1)
        
        LogInButton.layer.cornerRadius = 25.0
        
        LogInButton.tintColor = UIColor.white
        
        func styleTextField(_ textfield:UITextField) {
            
            let bottomLine = CALayer()
            bottomLine.frame = CGRect(x: 0, y: textfield.frame.height - 2, width: textfield.frame.width, height: 2)
            
            bottomLine.backgroundColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1).cgColor
            
            textfield.borderStyle = .none
            
            textfield.layer.addSublayer(bottomLine)
            
        }

        styleTextField(emailTextField)
        styleTextField(passwordTextField)
        // Do any additional setup after loading the view.
    }
    
    func setUpElements() {
        ErrorLabel.alpha = 0
    }
    
    func validateFields() -> String? {
        //check that the fields are correct, otherwise returns error message
        if emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""  {
            
            return "Please fill in all fields"
        }
        
        return nil
    }
    
    @IBAction func LogInTapped(_ sender: Any) {
        
        //validatetextfields
        let error = validateFields()
        
        if error != nil {
            showError(error!)
        }
        else {
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        //signing in the user
            
            Auth.auth().signIn(withEmail: email, password: password) { result, error in
                
                if error != nil{
                    self.ErrorLabel.text = error!.localizedDescription
                    self.ErrorLabel.alpha = 1
                }
                else {
                    let tabBarController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.tabBarController) as? UITabBarController
                    self.view.window?.rootViewController = tabBarController
                    self.view.window?.makeKeyAndVisible()
//                    let goalViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.goalViewController) as? GoalViewController
//                    self.view.window?.rootViewController = goalViewController
//                    self.view.window?.makeKeyAndVisible()
                }
            }
    }
        
    func showError(_ message:String){
            ErrorLabel.text = message
            ErrorLabel.alpha = 1
        }
}
}
