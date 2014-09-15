//
//  ViewController.swift
//  LionsAndTigers
//
//  Created by Jeremy on 9/13/14.
//  Copyright (c) 2014 Jeremy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var backgroundImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var ageLabel: UILabel!
    
    @IBOutlet weak var breedLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        var myTiger = Tiger()
        myTiger.name = "大傻逼"
        myTiger.age  = 3
        myTiger.breed = "你爹"
        myTiger.img = UIImage(named: "test.png")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nexButtonPressed(sender: UIBarButtonItem) {
        
//        UIView.transitionWithView(self.view, duration: 2, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {
//            self.ppppp("98", p: "lll")
//            println("asdasd")
//            }, completion: { (finished: Bool) -> () in
//                
//        })
        
        
        func turnOffAppliance (applianceName: String, isOn:Bool) {
            if isOn {
                println("Please turn off the \(applianceName).")
            }
            else {
                println("I actually turned the \(applianceName) off already.")
            }
        }
        
    }
    
    func ppppp(lol: String, p: String) {
        println(lol, p)
    }
}

