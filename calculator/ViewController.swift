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
    var secoungImport : Double = 0
    var fristImport : Double = 0
    var buffer : Double = 0
    var result :Double = 0
    var fakeResult : Double = 0
    var userImportNumber : Bool = false
   
    
    @IBAction func setZero(_ sender: Any) {
        couterDisplay.text = ""
    }
    
    @IBAction func digitButton(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if userImportNumber {
   
            couterDisplay.text = couterDisplay.text! + digit
        } else {
            couterDisplay.text = digit
            userImportNumber = true
        }

    }
    
    @IBOutlet weak var couterDisplay: UITextField!
    
    @IBAction func plus(_ sender: Any) {
        fristImport = Double(couterDisplay.text!)!
        buffer = temp + Double(couterDisplay.text!)!
        temp = Double(couterDisplay.text!)!
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
        buffer = temp/Double(couterDisplay.text!)!
    
        temp = Double(couterDisplay.text!)!
        flag = 4
        couterDisplay.text = ""
    }
   
    
    @IBAction func operate(_ sender: Any) {
        if flag == 1{
            result = temp +  Double(couterDisplay.text!)!
        }
        else if flag == 2{
            
            result = temp - Double(couterDisplay.text!)!
        }
        else if flag == 3{
            
            result = temp * Double(couterDisplay.text!)!
        }
        else if flag == 4{
            
            result = temp/Double(couterDisplay.text!)!
            
        }
        couterDisplay.text = "\(result)"
        print(temp)
        print(plus)
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

