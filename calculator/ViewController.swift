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
    var temp = 0
    var result = 0
    func plus(op1: Double, op2: Double) ->Double{
        return op1 + op2}
    func subtract(op1: Double, op2: Double) ->Double{
        return op1 - op2}
    func mul(op1: Double, op2: Double) ->Double{
        return op1 * op2}
    func divd(op1: Double, op2: Double) ->Double{
        return op1 / op2}
    @IBAction func setZero(_ sender: Any) {
        couterDisplay.text = ""
    }
    
    @IBAction func digitButton(_ sender: UIButton) {
        let digit = sender.currentTitle!
        couterDisplay.text = couterDisplay.text! + digit
    }
    
    @IBOutlet weak var couterDisplay: UITextField!
    
    @IBAction func getDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        couterDisplay.text = couterDisplay.text! + digit
    }
    
    @IBAction func operate(_ sender: UIButton) {
        let operation = sender.currentTitle!
        switch operation {
        case "+": func plus
        case "-":
        case "*":
        case "/":
        default:break
            
        }
    }
    
   
    @IBAction func operateCharacter5(_ sender: Any) {
        if flag == 1{
            result = temp +  Int(couterDisplay.text!)!
        }
        else if flag == 2{
            result = temp - Int(couterDisplay.text!)!
        }
        else if flag == 3{
            result = temp * Int(couterDisplay.text!)!
        }
        else if flag == 4{
            result = temp / Int(couterDisplay.text!)!
        }
        couterDisplay.text = "\(result)"

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

