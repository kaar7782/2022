//
//  ChallengesViewController.swift
//  ecolyze
//
//  Created by Kareena Arora on 1/24/22.
//

import UIKit

class ChallengesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet var challengesTableView: UITableView!
    
    
    let habits = ["Eat vegetarian for a day", "Air dry your clothes", "Use a reusable tote", "Turn off all the lights", "Walk to school or work"]
    
    let carbonAmount = ["-7 lbs of CO2", "-9 lbs of CO2", "-5 lbs of CO2", "-7 lbs of CO2", "-8 lbs of CO2"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "ChallengesTableViewCell", bundle: nil)
        challengesTableView.register(nib, forCellReuseIdentifier: "ChallengesTableViewCell")
        challengesTableView.delegate = self
        challengesTableView.dataSource = self
       
    }
    
    //table view functions
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return habits.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = challengesTableView.dequeueReusableCell(withIdentifier: "ChallengesTableViewCell", for: indexPath) as! ChallengesTableViewCell
        
        cell.habitLabel.text = habits[indexPath.row]
        cell.carbonLabel.text = carbonAmount[indexPath.row]
        
        cell.button.tag = indexPath.row
        cell.button.addTarget(self, action: #selector(rowButtonTapped(sender:)), for: .touchUpInside)
        
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    

    }
    
    @objc
    func rowButtonTapped (sender: UIButton) {
        
        let rowIndex : Int = sender.tag
        
        if rowIndex == 0 {
        
            let index0ViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.index0ViewController) as? Index0ViewController
            self.present(index0ViewController!, animated: true, completion: nil)
            
        }
        
        else if rowIndex == 1 {
            
            let index1ViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.index1ViewController) as? Index1ViewController
            self.present(index1ViewController!, animated: true, completion: nil)
            
        }
        
        else if rowIndex == 2 {
            
            let index2ViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.index2ViewController) as? Index2ViewController
            self.present(index2ViewController!, animated: true, completion: nil)
            
        }
        
        else if rowIndex == 3 {
            
            let index3ViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.index3ViewController) as? Index3ViewController
            self.present(index3ViewController!, animated: true, completion: nil)
            
        }
        
        else if rowIndex == 4 {
            
            let index4ViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.index4ViewController) as? Index4ViewController
            self.present(index4ViewController!, animated: true, completion: nil)
            
            
            ///*https://www.youtube.com/watch?v=WaSlHXNah7E */
            ///
        }
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
