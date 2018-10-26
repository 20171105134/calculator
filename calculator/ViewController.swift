//
//  ViewController.swift
//  calculator
//
//  Created by hechangfei on 2018/9/28.
//  Copyright © 2018年 hechangfei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var flag = 0
    var temp : Double = 0
    var buffer : Double = 0
    var result :Double = 0
   
   
    
    @IBAction func setZero(_ sender: Any) {
        couterDisplay.text = ""
    }
    
    @IBAction func digitButton(_ sender: UIButton) {
        let digit = sender.currentTitle!
        couterDisplay.text = couterDisplay.text! + digit
    }
    
    @IBOutlet weak var couterDisplay: UITextField!
    
    @IBAction func plus(_ sender: Any) {
        buffer = temp + Double(couterDisplay.text!)!
        temp = Double(couterDisplay.text!)!
        flag = 1
        couterDisplay.text = ""
    }
    @IBAction func subtract(_ sender: Any) {
        buffer = temp - Double(couterDisplay.text!)!
        temp = Double(couterDisplay.text!)!
        flag = 2
        couterDisplay.text = ""
        
    }
    @IBAction func mult(_ sender: Any) {
        
        buffer = Double(couterDisplay.text!)! * temp
        temp = 1
        temp = Double(couterDisplay.text!)!
        flag = 3
        couterDisplay.text = ""
    }
    @IBAction func division(_ sender: Any) {
        buffer = Double(couterDisplay.text!)! / temp
        temp = 1
        temp = Double(couterDisplay.text!)!
        flag = 4
        couterDisplay.text = ""
    }
   
    
    @IBAction func operate(_ sender: Any) {
        if flag == 1{
            result = buffer +  Double(couterDisplay.text!)!
        }
        else if flag == 2{
            
            result = buffer - Double(couterDisplay.text!)!
        }
        else if flag == 3{
            
            result = buffer * Double(couterDisplay.text!)!
        }
        else if flag == 4{
            
            result = Double(couterDisplay.text!)! / buffer
            
        }
        couterDisplay.text = "\(result)"

        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

