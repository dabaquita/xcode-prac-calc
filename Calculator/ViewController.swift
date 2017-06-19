//
//  ViewController.swift
//  Calculator
//
//  Created by Denielle Kirk Abaquita on 5/29/17.
//  Copyright © 2017 Denielle Kirk Abaquita. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var numberOnScreen:Double = 0
    var previousNumber:Double = 0
    var performingMath:Bool = false
    var operation:Double = 0

    @IBOutlet weak var label: UILabel!
    
    // method for all numbers
    @IBAction func numbers(_ sender: UIButton)
    {
        if performingMath == true
        {
            label.text = String(sender.tag - 1)
            numberOnScreen = Double(label.text!)!
            performingMath = false
        }
        else
        {
            label.text = label.text! + String((sender as AnyObject).tag - 1)
            numberOnScreen = Double(label.text!)!
        }
    }
    
  
    // Method for all functional buttons
    @IBAction func buttons(_ sender: UIButton)
    {
        /* operations */
        if label.text != "" && sender.tag != 11 && sender.tag != 16
        {
            previousNumber = Double(label.text!)!
            
            if sender.tag == 12
            { // division
                label.text = "/"
            }
            else if sender.tag == 13
            { // multiplication
                label.text = "x"
            }
            else if sender.tag == 14
            { // subtraction
                label.text = "-"
            }
            else if sender.tag == 15
            { // addition
                label.text = "+"
            }
            
            operation = Double(sender.tag)
            performingMath = true
        }
        /* equal sign */
        else if sender.tag == 16
        {
            if operation == 12
            {
                label.text = String(previousNumber / numberOnScreen)
            }
            else if operation == 13
            {
                label.text = String(previousNumber * numberOnScreen)
            }
            else if operation == 14
            {
                label.text = String(previousNumber - numberOnScreen)
            }
            else if operation == 15
            {
                label.text = String(previousNumber + numberOnScreen)
            }
        }
        /* clear button */
        else if sender.tag == 11
        {
            label.text = ""
            previousNumber = 0
            numberOnScreen = 0
            operation = 0
        }
        
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

