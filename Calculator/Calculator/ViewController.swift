//
//  ViewController.swift
//  Calculator
//
//  Created by Nikita Belov on 17.07.2021.
//


import UIKit

class ViewController: UIViewController {
    
    var numberFromScreen:Double = 0;
    var operation:Int = 0;
    var firstNum:Double = 0;
    var mathSign:Bool = false;

    @IBOutlet weak var result:UILabel!
    
    @IBAction func digits(_ sender: UIButton) {
        if mathSign == true {
            result.text = String(sender.tag)
            mathSign = false
        }
        else {
        result.text = result.text! + String(sender.tag)
        }
        numberFromScreen = Double(result.text!)!
        
    }
    
    func clear() { // clear function
        result.text = ""
        firstNum = 0
        numberFromScreen = 0
        operation = 0
    }
    @IBAction func buttons(_ sender: UIButton) {
        if result.text != "" && sender.tag != 10 && sender.tag != 15 {
            firstNum = Double(result.text!)!
            
            if sender.tag == 11 { // division
                result.text = "/";
            } else if sender.tag == 12 { // multyply
                result.text = "X";
            } else if sender.tag == 13 { // subtraction
                result.text = "-";
            } else if sender.tag == 14 { // addition
                result.text = "+";
            }
            
            operation = sender.tag
            mathSign = true;
        }
        else if sender.tag == 15 { // Посчитать всё
            if operation == 11 && numberFromScreen != 0{
                result.text = String(firstNum / numberFromScreen)
            } else if operation == 11 && numberFromScreen == 0 {
                result.text = String("ERR")
            } else if operation == 12 {
                result.text = String(firstNum * numberFromScreen)
            } else if operation == 13 {
                result.text = String(firstNum - numberFromScreen)
            } else if operation == 14 {
                result.text = String(firstNum + numberFromScreen)
            }

        }
        else if sender.tag == 10{
            clear()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

