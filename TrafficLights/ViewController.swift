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
    
    var timer = Timer()
    var scoreTimer = Timer()
    
    var timerInt = 0
    var scoreInt = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        scoreInt = 0
        counterLabel.text =  String(scoreInt)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func StartStop(_ sender: Any) {
        
        if scoreInt == 0 {
            
            timerInt = 3
            
            trafficLight.image = UIImage(named: "TrafficLight")
            
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.updateCounter), userInfo: nil, repeats: true)
            
        }
        
    }
    
    func updateCounter() {
    
        timerInt -= 1
        
        if timerInt == 2 {
            
            trafficLight.image = UIImage(named: "TrafficLight3")
            
        } else if timerInt == 1 {
            
            trafficLight.image = UIImage(named: "TrafficLight2")
            
        } else if timerInt == 0 {
            
            trafficLight.image = UIImage(named: "TrafficLight1")
            
            timer.invalidate()
            
        }
    }

}
