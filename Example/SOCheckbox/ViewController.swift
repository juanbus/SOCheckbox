//
//  ViewController.swift
//  SOCheckbox
//
//  Created by Sebastian Osiński on 10/21/2015.
//  Copyright (c) 2015 Sebastian Osiński. All rights reserved.
//

import UIKit
import SOCheckbox

class ViewController: UIViewController {

    @IBOutlet weak var checkbox: SOCheckbox!
    @IBOutlet weak var label: UILabel!
    @IBAction func selectStyle(sender: UISegmentedControl) {
        checkbox.style = (sender.selectedSegmentIndex == 0) ? .Fill : .Tick
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = checkbox.checked ? "checked" : "unchecked"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func checkboxClicked(sender: SOCheckbox) {
        label.text = sender.checked ? "checked" : "unchecked"
    }
    

}

