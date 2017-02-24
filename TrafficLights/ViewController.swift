//
//  ViewController.swift
//  TrafficLights
//
//  Created by Cory Franks on 2/23/17.
//  Copyright © 2017 Cory Franks. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var trafficLight: UIImageView!
    @IBOutlet var startStopButton: UIButton!
    @IBOutlet var counterLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func StartStop(_ sender: Any) {
    }

}

