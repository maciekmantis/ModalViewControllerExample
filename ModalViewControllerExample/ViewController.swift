//
//  ViewController.swift
//  ModalViewControllerExample
//
//  Created by Maciek on 13.06.2014.
//  Copyright (c) 2014 Maciek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let debug = true;
    let autoresizingMask = false;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button: UIButton = UIButton.buttonWithType(UIButtonType.System) as UIButton
        
        let views = [
            "button": button
        ]
        
        let metrics = [
            "topMargin": UIScreen.mainScreen().bounds.height/2 - button.layer.bounds.height/2
        ]
        
        button.setTitle("Next", forState: UIControlState.Normal)
        button.setTitleColor(UIColor.blueColor(), forState: .Normal)
        self.view.addSubview(button)
        
        
        
        if (!self.autoresizingMask) {
            println("AutoresizingMask mode OFF")
            button.setTranslatesAutoresizingMaskIntoConstraints(false)
            self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-topMargin-[button(<=800)]-(>=100)-|", options: nil, metrics: metrics, views: views))
        } else {
            button.sizeToFit()
            button.center = CGPointMake(UIScreen.mainScreen().bounds.width/2, UIScreen.mainScreen().bounds.height/2)
        }
        
        if (self.debug) {
            println("Debug mode ON")
            self.view.layer.borderColor = UIColor.redColor().CGColor
            self.view.layer.borderWidth = 1
            
            button.layer.borderColor = UIColor.redColor().CGColor
            button.layer.borderWidth = 1
            
            for i in 0 .. self.view.constraints().count {
                println("Constraint \(i): \(self.view.constraints()[i])")
            }
        }
        
        println("View did load.")
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

