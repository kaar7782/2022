//
//  ResourcesViewController.swift
//  ecolyze
//
//  Created by Kareena Arora on 1/24/22.
//

import UIKit

class ResourcesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
    //arrays of each content piece in each cell
    
    let myData = ["Simple Tips to Live a More Sustainable Lifestyle", "How People Make Only a Jar of Trash a Year", "Zero Waste Living", "How to Reduce Your Carbon Footprint", "The World's Most Polluting Brands", "References"]
  
    var myImages = [UIImage(named: "1"), UIImage(named: "2"),UIImage(named: "3"),UIImage(named: "4"), UIImage(named: "5"), UIImage(named: "references")]
    
    var myLinks = ["https://theminimalistvegan.com/live-a-more-sustainable-lifestyle/", "https://www.nationalgeographic.com/science/article/zero-waste-families-plastic-culture", "https://www.ecofriendlyhabits.com/zero-waste-living/", "https://www.nytimes.com/guides/year-of-living-better/how-to-reduce-your-carbon-footprint" , "https://www.pollutionsolutions-online.com/news/waste-management/21/breaking-news/10-of-the-worlds-most-polluting-brands/50721", "https://docs.google.com/document/d/1n8xJAxtFZ0gmJLsvKdsqHO6rpI1Re5HCpmBxjDioh5g/edit?usp=sharing"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "TableViewCell")
        tableView.delegate = self
        tableView.dataSource = self

        // Do any additional setup after loading the view.
    }
    

//tableview functions
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        //casting as table view cell class so that we can access the label and image from that class
        
        cell.label1.text = myData[indexPath.row]
        cell.image1.image = myImages[indexPath.row]

        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let urlString = self.myLinks[indexPath.row]
                if let url = URL(string: urlString)
                {
                    UIApplication.shared.open(url)
                }
    }


}
