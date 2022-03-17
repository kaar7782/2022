//
//  SignUpViewController.swift
//  ecolyze
//
//  Created by Kareena Arora on 1/23/22.
//

import UIKit
import FirebaseAuth
import Firebase

class SignUpViewController: UIViewController {

    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var PasswordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
        
        //button
        signUpButton.backgroundColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1)
        signUpButton.layer.cornerRadius = 25.0
        signUpButton.tintColor = UIColor.white
        
        //text fields
        func styleTextField(_ textfield:UITextField) {
            
            let bottomLine = CALayer()
            bottomLine.frame = CGRect(x: 0, y: textfield.frame.height - 2, width: textfield.frame.width, height: 2)
            
            bottomLine.backgroundColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1).cgColor
            
            textfield.borderStyle = .none
            
            textfield.layer.addSublayer(bottomLine)
            
        }

        styleTextField(emailTextField)
        styleTextField(PasswordTextField)
        styleTextField(nameTextField)

        
        // Do any additional setup after loading the view.
    }
    
    func setUpElements() {
        errorLabel.alpha = 0
    }
    
    func validateFields() -> String? {
        //check that the fields are correct, otherwise returns error message
        if nameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || PasswordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""  {
            
            return "Please fill in all fields"
        }
        
        
        return nil
    }
    @IBAction func signUpTapped(_ sender: Any) {
        let error = validateFields()
        if error != nil {
            showError(error!)
        }
        else {
            
            let name = nameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = PasswordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let goal = "0"
            
            Auth.auth().createUser(withEmail: email, password: password) { result, err in
                
                
                if err != nil {
                    self.showError("Error creating user")
                }
                else {
                    
                    let db = Firestore.firestore()
                    db.collection("users").addDocument(data: ["name" : name, "email" : email, "password" : password, "uid" : result!.user.uid, "goal" : goal]){ (error) in
                        //does not work when logging in with same user 
                        if error != nil {
                            self.showError("user data couldn't be stored")
                        }
                    }
                }
                
                let goalViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.goalViewController) as? GoalViewController
                self.view.window?.rootViewController = goalViewController
                self.view.window?.makeKeyAndVisible()
            }
        }
        //validate the fields
        
        //create the user
        
        //transition to home screen
    }
    
    func showError(_ message:String){
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    

    

}
//db.collection("users").addDocument(data: ["name" : name, "uid" :result!.user.uid])
