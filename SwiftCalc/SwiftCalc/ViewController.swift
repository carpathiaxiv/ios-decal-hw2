//
//  ViewController.swift
//  SwiftCalc
//
//  Created by Zach Zeleznick on 9/20/16.
//  Copyright © 2016 zzeleznick. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: Width and Height of Screen for Layout
    var w: CGFloat!
    var h: CGFloat!
    

    // IMPORTANT: Do NOT modify the name or class of resultLabel.
    //            We will be using the result label to run autograded tests.
    // MARK: The label to display our calculations
    var resultLabel = UILabel()
    
    // TODO: This looks like a good place to add some data structures.
    //       One data structure is initialized below for reference.
    var someDataStructure: [String] = []
    var tempNum: String=""
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view = UIView(frame: UIScreen.main.bounds)
        view.backgroundColor = UIColor(white: 1.0, alpha: 1.0)
        w = view.bounds.size.width
        h = view.bounds.size.height
        navigationItem.title = "Calculator"
        // IMPORTANT: Do NOT modify the accessibilityValue of resultLabel.
        //            We will be using the result label to run autograded tests.
        resultLabel.accessibilityValue = "resultLabel"
        makeButtons()
        // Do any additional setup here.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // TODO: A method to update your data structure(s) would be nice.
    //       Modify this one or create your own.
    func updateSomeDataStructure(_ content: String) {
        print("Update me like one of those PCs")
    }
    
    
    // TODO: Ensure that resultLabel gets updated.
    //       Modify this one or create your own.
    func updateResultLabel(_ content: String) {
        print("Update me like one of those PCs")
        //print([Character](tempNum.characters)[tempNum.characters.count-1])
        resultLabel.text=content
        
    }
    func swap(){
        for (i,elem) in someDataStructure.enumerated(){
            if elem=="Done"{
                someDataStructure[i]=someDataStructure[someDataStructure.count-1]
                someDataStructure[someDataStructure.count-1]="Done"
                break
            }
            
        }
    }
    
    // TODO: A calculate method with no parameters, scary!
    //       Modify this one or create your own.
    func calculate() {
        print("calculate called")
        print(someDataStructure)
        //var hasPriority=false
        while "Done" !=  someDataStructure[2]{
            for (i,_) in someDataStructure.enumerated(){
                if someDataStructure[i]=="*" || someDataStructure[i]=="/"{
                    if self.someDataStructure[i-1].characters.contains(".") || self.someDataStructure[i+1].characters.contains(".") || someDataStructure[i]=="/"{
                        let tempResult=self.calculate(a:self.someDataStructure[i-1],b:self.someDataStructure[i+1],operation:self.someDataStructure[i])
                        let temp=forTailingZero(temp: tempResult)
                        someDataStructure.remove(at:i-1)
                        someDataStructure.remove(at:i-1)
                        someDataStructure[i-1]=temp
                    }else{
                        let aInt = Int(self.someDataStructure[i-1])!
                        let bInt = Int(self.someDataStructure[i+1])!
                        let tempResult=self.intCalculate(a:aInt, b:bInt, operation:self.someDataStructure[i])
                        print ("tempResult:")
                        print (tempResult)
                        someDataStructure.remove(at:i-1)
                        print (someDataStructure)
                        someDataStructure.remove(at:i-1)
                        print (someDataStructure)
                        someDataStructure[i-1]=String(tempResult)
                        print (someDataStructure)
                    }
                    someDataStructure.append("Done")
                    someDataStructure.append("Done")
                }
            }
            if !someDataStructure.contains("*") && !someDataStructure.contains("/"){
               break
            }
        }
        print ("before Done")
        print (someDataStructure)
        //let secondEle=String:someDataStructure[1]
        while "Done" !=  someDataStructure[2]{
            for (i,_) in someDataStructure.enumerated(){
                if someDataStructure[i]=="+" || someDataStructure[i]=="-"{
                    if self.someDataStructure[i-1].characters.contains(".") || self.someDataStructure[i+1].characters.contains("."){
                        let tempResult=self.calculate(a:self.someDataStructure[i-1],b:self.someDataStructure[i+1],operation:self.someDataStructure[i])
                        
                        someDataStructure.remove(at:i-1)
                        someDataStructure.remove(at:i-1)
                        someDataStructure[i-1]=String(format:"%f", tempResult)
                    }else{
                        let aInt = Int(self.someDataStructure[i-1])!
                        let bInt = Int(self.someDataStructure[i+1])!
                        let tempResult=self.intCalculate(a:aInt, b:bInt, operation:self.someDataStructure[i])
                        print ("tempResult:")
                        print (tempResult)
                        someDataStructure.remove(at:i-1)
                        print (someDataStructure)
                        someDataStructure.remove(at:i-1)
                        print (someDataStructure)
                        someDataStructure[i-1]=String(tempResult)
                        print (someDataStructure)
                    }
                    someDataStructure.append("Done")
                    someDataStructure.append("Done")
                }
            }
        }
        print ("finished calculatin")
        print(someDataStructure)
        resultLabel.text=someDataStructure[0]
        //someDataStructure=[]
    }
    
    // TODO: A simple calculate method for integers.
    //       Modify this one or create your own.
    func intCalculate(a: Int, b:Int, operation: String) -> Int {
        print("Calculation requested for \(a) \(operation) \(b)")
        var result:Int=0
        if operation=="+"{
            result=a+b
            //resultLabel.text=String(result)
        }else if operation=="-"{
            result=a-b
            //resultLabel.text=String(result)
        }else if operation=="*"{
            result=a*b
            //resultLabel.text=String(result)
        }
        //resultLabel.text=String(result)
        return result
    }
    
    // TODO: A general calculate method for doubles
    //       Modify this one or create your own.
    func calculate(a: String, b:String, operation: String) -> Double {
        print("Calculation requested for \(a) \(operation) \(b)")
        var result:Double=0.0
        let aDouble=(a as NSString).doubleValue
        let bDouble=(b as NSString).doubleValue
        if operation=="+"{
            result=aDouble+bDouble
            let temp=forTailingZero(temp: result)
            result=(temp as NSString).doubleValue
            //resultLabel.text=String(result)
        }else if operation=="-"{
            result=aDouble-bDouble
            let temp=forTailingZero(temp: result)
            result=(temp as NSString).doubleValue
            //resultLabel.text=String(result)
        }else if operation=="*"{
            result=aDouble*bDouble
            let temp=forTailingZero(temp: result)
            result=(temp as NSString).doubleValue
            //resultLabel.text=String(result)
        }else if operation=="/"{
            result=aDouble/bDouble
            let temp=forTailingZero(temp: result)
            result=(temp as NSString).doubleValue
            //resultLabel.text=String(result)
        }
        //resultLabel.text=String(result)
        return result
    }
    func forTailingZero(temp: Double) -> String{
        let tempVar = String(format: "%g", temp)
        print ("tempvar")
        print (tempVar)
        return tempVar
    }
    // REQUIRED: The responder to a number button being pressed.
    func numberPressed(_ sender: CustomButton) {
        guard Int(sender.content) != nil else { return }
        print("The number \(sender.content) was pressed")
        // Fill me in!
        print(sender.content)
        if tempNum.characters.count==7{
            return
        }
        tempNum+=sender.content
        print (tempNum)
        if tempNum.characters.count>1{
            for (i, elem) in someDataStructure.enumerated(){
                if elem=="Done"{
                    someDataStructure[i-1]=tempNum
                    //someDataStructure[someDataStructure.count-1]="Done"
                    break
                }
            }
            if !someDataStructure.contains("Done"){
                someDataStructure.removeLast()
                someDataStructure.append(tempNum)
            }
            
        }else{
            someDataStructure.append(tempNum)
            swap()
        }
        
        //
        //swap()
        updateResultLabel(tempNum)
        print(someDataStructure)
    }
    
    // REQUIRED: The responder to an operator button being pressed.
    func operatorPressed(_ sender: CustomButton) {
        // Fill me in!
        tempNum=""
        
        print("sender.content is: ")
        print(sender.content)
        if sender.content=="+" || sender.content=="-"{
            someDataStructure.append(sender.content)
            swap()
            //someDataStructure.count==
            if someDataStructure.count>=3{
                calculate()
            }
        }else if sender.content=="*" || sender.content=="/"{
            someDataStructure.append(sender.content)
            swap()
            if someDataStructure.count>=3{
                calculate()
            }
        }else if sender.content=="="{
            calculate()
        }else if sender.content=="C"{
            updateResultLabel("0")
            someDataStructure=[]
        }else if sender.content=="+/-"{
            var modified=false
            for (i,elem) in someDataStructure.enumerated(){
                if elem=="Done"{
                    var oldVal=someDataStructure[i-1]
                    let temp=oldVal.characters.map{String ($0)}
                    //print (oldVal.subjectType)
                    if temp[0]=="-"{
                        oldVal.remove(at: oldVal.startIndex)
                        someDataStructure[i-1]=oldVal
                    }else{
                        someDataStructure[i-1]="-"+oldVal
                    }
                    updateResultLabel(someDataStructure[i-1])
                    modified=true
                    break
                }
            }
            if modified==false{
                var oldVal=someDataStructure[someDataStructure.count-1]
                let temp=oldVal.characters.map{String ($0)}
                //print (oldVal.subjectType)
                if temp[0]=="-"{
                    oldVal.remove(at: oldVal.startIndex)
                    someDataStructure[someDataStructure.count-1]=oldVal
                }else{
                    someDataStructure[someDataStructure.count-1]="-"+oldVal
                }
                updateResultLabel(someDataStructure[someDataStructure.count-1])
            }
        }else if sender.content=="%"{
            var oldVal=someDataStructure[someDataStructure.count-1]
            oldVal=String(format:"%f", (oldVal as NSString).doubleValue/100.0)
            someDataStructure[someDataStructure.count-1]=oldVal
            updateResultLabel(someDataStructure[someDataStructure.count-1])
        }else{
            someDataStructure.append(sender.content)
            swap()
        }
        print (someDataStructure)
    }
    
    // REQUIRED: The responder to a number or operator button being pressed.
    func buttonPressed(_ sender: CustomButton) {
       // Fill me in!
        updateResultLabel(sender.content)
        if sender.content=="."{
            if someDataStructure.count==0{
                someDataStructure.append("0.")
                tempNum="0."
            }else{
                for (i, elem) in someDataStructure.enumerated(){
                    if elem=="Done"{
                        someDataStructure[i-1]=someDataStructure[i-1]+"."
                        //someDataStructure[someDataStructure.count-1]="Done"
                        break
                    }
                }
                if someDataStructure.contains("Done")==false{
                    print ("hello?")
                    print(someDataStructure[someDataStructure.count-1])
                    someDataStructure[someDataStructure.count-1]=someDataStructure[someDataStructure.count-1]+"."
                    tempNum+="."
                    print(someDataStructure[someDataStructure.count-1])
                }
            }
        }
        if sender.content=="0"{
            if tempNum.characters.count==7{
                return
            }
            tempNum+=sender.content
            print (tempNum)
            if tempNum.characters.count>1{
                for (i, elem) in someDataStructure.enumerated(){
                    if elem=="Done"{
                        someDataStructure[i-1]=tempNum
                        //someDataStructure[someDataStructure.count-1]="Done"
                        break
                    }
                }
                if !someDataStructure.contains("Done"){
                    someDataStructure.removeLast()
                    someDataStructure.append(tempNum)
                }
                
            }else{
                someDataStructure.append(tempNum)
                swap()
            }
            updateResultLabel(tempNum)

        }
    }
    
    // IMPORTANT: Do NOT change any of the code below.
    //            We will be using these buttons to run autograded tests.
    
    func makeButtons() {
        // MARK: Adds buttons
        let digits = (1..<10).map({
            return String($0)
        })
        let operators = ["/", "*", "-", "+", "="]
        let others = ["C", "+/-", "%"]
        let special = ["0", "."]
        
        let displayContainer = UIView()
        view.addUIElement(displayContainer, frame: CGRect(x: 0, y: 0, width: w, height: 160)) { element in
            guard let container = element as? UIView else { return }
            container.backgroundColor = UIColor.black
        }
        displayContainer.addUIElement(resultLabel, text: "0", frame: CGRect(x: 70, y: 70, width: w-70, height: 90)) {
            element in
            guard let label = element as? UILabel else { return }
            label.textColor = UIColor.white
            label.font = UIFont(name: label.font.fontName, size: 60)
            label.textAlignment = NSTextAlignment.right
        }
        
        let calcContainer = UIView()
        view.addUIElement(calcContainer, frame: CGRect(x: 0, y: 160, width: w, height: h-160)) { element in
            guard let container = element as? UIView else { return }
            container.backgroundColor = UIColor.black
        }

        let margin: CGFloat = 1.0
        let buttonWidth: CGFloat = w / 4.0
        let buttonHeight: CGFloat = 100.0
        
        // MARK: Top Row
        for (i, el) in others.enumerated() {
            let x = (CGFloat(i%3) + 1.0) * margin + (CGFloat(i%3) * buttonWidth)
            let y = (CGFloat(i/3) + 1.0) * margin + (CGFloat(i/3) * buttonHeight)
            calcContainer.addUIElement(CustomButton(content: el), text: el,
            frame: CGRect(x: x, y: y, width: buttonWidth, height: buttonHeight)) { element in
                guard let button = element as? UIButton else { return }
                button.addTarget(self, action: #selector(operatorPressed), for: .touchUpInside)
            }
        }
        // MARK: Second Row 3x3
        for (i, digit) in digits.enumerated() {
            let x = (CGFloat(i%3) + 1.0) * margin + (CGFloat(i%3) * buttonWidth)
            let y = (CGFloat(i/3) + 1.0) * margin + (CGFloat(i/3) * buttonHeight)
            calcContainer.addUIElement(CustomButton(content: digit), text: digit,
            frame: CGRect(x: x, y: y+101.0, width: buttonWidth, height: buttonHeight)) { element in
                guard let button = element as? UIButton else { return }
                button.addTarget(self, action: #selector(numberPressed), for: .touchUpInside)
            }
        }
        // MARK: Vertical Column of Operators
        for (i, el) in operators.enumerated() {
            let x = (CGFloat(3) + 1.0) * margin + (CGFloat(3) * buttonWidth)
            let y = (CGFloat(i) + 1.0) * margin + (CGFloat(i) * buttonHeight)
            calcContainer.addUIElement(CustomButton(content: el), text: el,
            frame: CGRect(x: x, y: y, width: buttonWidth, height: buttonHeight)) { element in
                guard let button = element as? UIButton else { return }
                button.backgroundColor = UIColor.orange
                button.setTitleColor(UIColor.white, for: .normal)
                button.addTarget(self, action: #selector(operatorPressed), for: .touchUpInside)
            }
        }
        // MARK: Last Row for big 0 and .
        for (i, el) in special.enumerated() {
            let myWidth = buttonWidth * (CGFloat((i+1)%2) + 1.0) + margin * (CGFloat((i+1)%2))
            let x = (CGFloat(2*i) + 1.0) * margin + buttonWidth * (CGFloat(i*2))
            calcContainer.addUIElement(CustomButton(content: el), text: el,
            frame: CGRect(x: x, y: 405, width: myWidth, height: buttonHeight)) { element in
                guard let button = element as? UIButton else { return }
                button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
            }
        }
    }

}

