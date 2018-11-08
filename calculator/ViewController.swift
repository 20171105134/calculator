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
    var secoundImport : Double = 1
    var fristImport : Double = 0
    var buffer : Double = 0
    var result :Double = 0
    var fakeResult : Double = 0
    var userImportNumber : Bool = false
    var charapter = 0
    var subCharapter = 0
   
    
    @IBAction func setZero(_ sender: Any) {
        couterDisplay.text = ""
        buffer = 0
        secoundImport = 0
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
    
    @IBAction func plusAnthorone(_ sender: Any) {//fristImport = Double(couterDisplay.text!)!
        //if fristImport != 0{
            buffer = fristImport + Double(couterDisplay.text!)!
        //}
        //secoundImport = buffer
        //buffer = temp + Double(couterDisplay.text!)!
        //temp = Double(couterDisplay.text!)!
        fristImport = Double(couterDisplay.text!)!
        couterDisplay.text = ""
        flag = 1
        charapter = 1
    }
    @IBAction func subtract(_ sender: Any) {
        
        if subCharapter == 1{
            buffer = fristImport + (-Double(couterDisplay.text!)!)
        }
        //}
        //buffer = temp - Double(couterDisplay.text!)!
        //buffer = Double(couterDisplay.text!)!
        fristImport = Double(couterDisplay.text!)!
        flag = 2
        couterDisplay.text = ""
        charapter = 1
    }
    @IBAction func mult(_ sender: Any) {
        //fristImport = 1
        //fristImport = buffer
        buffer = Double(couterDisplay.text!)! * secoundImport
        secoundImport = Double(couterDisplay.text!)!
        flag = 3
        couterDisplay.text = ""
        charapter = 1
    }
    @IBAction func division(_ sender: Any) {
        //temp = Double(couterDisplay.text!)!/*/secoundImport*/
        //buffer = temp/Double(couterDisplay.text!)!/*secoundImport*/
        //buffer = /*(1/secoundImport) * */ Double(couterDisplay.text!)!/secoundImport
    
        //secoundImport = buffer
        if charapter == 0{
            buffer = Double(couterDisplay.text!)!/secoundImport
            
        }
        if charapter == 1{
            buffer = secoundImport/Double(couterDisplay.text!)!
        }
        flag = 4
        secoundImport = Double(couterDisplay.text!)!
        couterDisplay.text = ""
        charapter = 1
    }
   
    
    @IBAction func operate(_ sender: Any) {
        if flag == 1{
            result = buffer +  Double(couterDisplay.text!)!
            //buffer = 0
            //secoundImport = 0
        }
        else if flag == 2{
            
            result = buffer - Double(couterDisplay.text!)!
            //buffer = 0
            //secoundImport = 0
        }
        else if flag == 3{
            
            result = buffer * Double(couterDisplay.text!)!
            //buffer = 0
            //secoundImport = 0
        }
        else if flag == 4{
            
            result = buffer/Double(couterDisplay.text!)!
            //buffer = 0
            //secoundImport = 0
            
        }
        couterDisplay.text = "\(result)"
        //print(temp)
        //print(plus)
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

