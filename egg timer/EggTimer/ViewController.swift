//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var egglabel: UILabel!
    
    @IBOutlet weak var progressbar: UIProgressView!
    
    let eggTimes = ["Soft":5,"Medium":7,"Hard":12]
    
    var totalTime = 0
    
    var secondPassed = 0
    
    var timer = Timer()

    @IBAction func eggbutton(_ sender: UIButton) {
        timer.invalidate()
        
        let hardness = sender.currentTitle!
        
        totalTime = eggTimes[hardness]!
        
        progressbar.progress = 0.0
        
        secondPassed = 0
        
        egglabel.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    @objc func updateTime(){
        if secondPassed < totalTime{
            
            secondPassed += 1
            
            progressbar.progress = Float(secondPassed) / Float (totalTime)
        }else{
            timer.invalidate()
            egglabel.text = "Done"
        }
    }
}
