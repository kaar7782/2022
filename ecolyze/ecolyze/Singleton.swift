//
//  Singleton.swift
//  ecolyze
//
//  Created by Kareena Arora on 3/5/22.
//

import UIKit

class Singleton: NSObject {
    
    static let sharedInstance = Singleton()
    
    private override init() {}
    
    var numLabel : String?
    
    var index0 = 7
    var index1 = 9
    var index2 = 5
    var index3 = 7
    var index4 = 8
    
    //var goal : String?
   

}
