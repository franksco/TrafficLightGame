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
            
            startStopButton.isEnabled = false
            startStopButton.setTitle("", for:[])
                //code that disables the button and makes the text inside the button disappear.
            
            scoreInt = 0
            counterLabel.text = String(scoreInt)
                //Here we are setting the scoreInt to 0 and telling counterLabel to display it as such in the form of a string. 
            
        } else {
            scoreTimer.invalidate()
            //code allows startStopButton to stop scoreTimer when playing the game
        }
        
        if timerInt == 0 {
            
            scoreInt = 0
            startStopButton.setTitle("Restart", for: [])
            
            //this states if timerInt is equal to 0 then when the startStopButton "Stop" is pressed it will display "Restart" as the current text and then set the scoreInt to zero.
        }
        
    }
    
    func updateCounter() {
    
        timerInt -= 1
        
        if timerInt == 2 {
            
            trafficLight.image = UIImage(named: "TrafficLight3")
            
        } else if timerInt == 1 {
            
            trafficLight.image = UIImage(named: "TrafficLight2")
            
            startStopButton.setTitle("Stop", for: [])
            
        } else if timerInt == 0 {
            
            trafficLight.image = UIImage(named: "TrafficLight1")
            
            timer.invalidate()
            
            startStopButton.isEnabled = true
                // ~~~ startStopButton becomes enabled when timer hits 0 and scoreTimer starts.
            
            scoreTimer = Timer.scheduledTimer(timeInterval: 0.0001, target: self, selector: #selector(ViewController.updateScoreTimer), userInfo: nil, repeats: true)
            
                // ~~~ NSTimer really quickly checks to see if the stop button has been pressed and referencing the updateScoreTimer func, until it has been.
            
        }
        
        //func updateCounter subtracts -=1 from timer each time referenced, and telling trafficLight.image to display the correct image based on what number the timer is equal to. Once the timer is equal to 0 it displays the final image and then invalidates that timer, so when we press the timer button again it doesnt create more than one "Game Timer".
    }
    
    func updateScoreTimer() {
        
        scoreInt += 1
        counterLabel.text = String(scoreInt)
        
        
        //this func gets referenced by the scoreTimer, adding += 1 to scoreInt each timer reference and displaying it as a String in counterLabel.
    }
    

}
