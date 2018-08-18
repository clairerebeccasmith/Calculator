//
//  ViewController.swift
//  Calculator
//
//  Created by Claire Smith on 06/08/2018.
//  Copyright © 2018 Claire Smith. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    var numberOnScreen:Double = 0;
    var previousNumber:Double = 0;
    var performingCal = false;
    var operation = 0;
    
    @IBAction func numbers(_ sender: UIButton)
    {
        if (performingCal == true)
        {
            label.text = String(sender.tag-1)
            numberOnScreen = Double(label.text!)!;
            performingCal = false;
        }
        else
        {
            label.text = label.text! + String(sender.tag-1)
            numberOnScreen = Double(label.text!)!
        }
       
    }
    
    @IBAction func buttons(_ sender: UIButton)
    {
        if label.text != "" && sender.tag != 11 && sender.tag != 16
        {
            previousNumber = Double(label.text!)!;
            if(sender.tag == 12) //mulitply
            {
                label.text = "x";
            }
            else if(sender.tag == 13) //divide
            {
                label.text = "/";
            }
            else if(sender.tag == 14) //substract
            {
                label.text = "-";
            }
            else if(sender.tag == 15) //add
            {
                label.text = "+";
            }
            operation = sender.tag;
            performingCal = true;
        }
        else if (sender.tag == 16)
        {
            if (operation == 12) //multiply
            {
                label.text = String(previousNumber * numberOnScreen);
            }
            if (operation == 13) //divide
            {
                label.text = String(previousNumber / numberOnScreen);
            }
            if (operation == 14) //subtract
            {
                label.text = String(previousNumber - numberOnScreen);
            }
            if (operation == 15) //add
            {
                label.text = String(previousNumber + numberOnScreen);
            }
        }
        else if (sender.tag == 11)
        {
            label.text = "";
            previousNumber = 0;
            numberOnScreen = 0;
            operation = 0;
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

