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
    
    
    
    func isOperator(value){
    var operatorString = "+-*/()";
    return operatorString.indexOf(value) > -1
    }
    
    func getPrioraty(value){
    switch(value){
    case  "+" : return 1
    case  "-" : return 1

    case  "*" : return 2
    case  "/" :return 2
    default:
    return 0;
    }
    }
    
    func prioraty(o1, o2){
    return getPrioraty(o1) <= getPrioraty(o2);
    }
    
    func dal2Rpn(exp){
        var inputStack : Array<Any>
        var outputStack : Array<Any>
        var outputQueue : Array<Any>
    
    for(var i = 0, len = exp.length; i < len; i++){
    var cur = exp[i]
    if(cur != " " ){
    inputStack.push(cur)
    }
    }
    //'step one');
    while(inputStack.length > 0){
    var cur = inputStack.dropFirst()
    if(isOperator(cur)){
    if(cur == "(" ){
    outputStack.push(cur);
    }else if(cur ==  ")" ){
        var po = outputStack.dropLast()
        while(po != ( &&outputStack.length > 0){
    outputQueue.push(po);
    po = outputStack.pop();
    }
    if po != "(" {
    throw "error: unmatched ()";
    }
    }else{
    while(prioraty(cur, outputStack[outputStack.length - 1]) && outputStack.length > 0){
    outputQueue.push(outputStack.dropLast()());
    }
    outputStack.push(cur);
    }
    }else{
    outputQueue.push(new Number(cur));
    }
    }
    //('step two');
    if(outputStack.length > 0){
    if(outputStack[outputStack.length - 1] == ')' || outputStack[outputStack.length - 1] == '('){
    throw "error: unmatched ()";
    }
    while(outputStack.length > 0){
    outputQueue.push(outputStack.pop());
    }
    }
    //('step three');
    return outputQueue;
    
    }
    
    
    
    
    
    
    
    
    
    
    @IBAction func setZero(_ sender: Any) {
        couterDisplay.text = ""
        buffer = 0
        secoundImport = 0
        fristImport = 0
        charapter = 0
        //subCharapter = 0
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
        
        if charapter == 1{
            buffer = fristImport - Double(couterDisplay.text!)!
        }
        //}
        //buffer = temp - Double(couterDisplay.text!)!
        //buffer = Double(couterDisplay.text!)!
        else if charapter == 0{
            buffer = Double(couterDisplay.text!)! - fristImport
        }
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
            fristImport = 1
            buffer = Double(couterDisplay.text!)!/secoundImport
            
        }
        else if charapter == 1{
            
            buffer = fristImport/Double(couterDisplay.text!)!
        }
        flag = 4
        //secoundImport = Double(couterDisplay.text!)!
        fristImport = Double(couterDisplay.text!)!
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
        charapter = 0
        //subCharapter = 0
        //print(temp)
        //print(plus)
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

