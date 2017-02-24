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
            
            //if statement sets score equal to 0, within that statement it sets the timerInt equal to 3 and sets our trafficLight.image to a black traffic light. Then we create an NSTimer telling it to count every second referencing our updateCounter func each time.
            
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
            
            scoreTimer = Timer.scheduledTimer(timeInterval: 0.0001, target: self, selector: #selector(ViewController.updateScoreTimer), userInfo: nil, repeats: true)
            
            //NSTimer updating the score to display the 
            
        }
        
        //func updateCounter subtracts -=1 from timer each time referenced, and telling trafficLight.image to display the correct image based on what number the timer is equal to. Once the timer is equal to 0 it displays the final image and then invalidates that timer, so when we press the timer button again it doesnt create more than one "Game Timer".
    }
    
    func updateScoreTimer() {
        
        scoreInt += 1
        counterLabel.text = String(scoreInt)
        
    }

}
