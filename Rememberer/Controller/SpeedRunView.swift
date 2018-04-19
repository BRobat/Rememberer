//
//  SpeedRunView.swift
//  Rememberer
//
//  Created by Tohil on 14/02/2018.
//  Copyright © 2018 Tohil. All rights reserved.
//

import UIKit
import Foundation
import CoreData

class SpeedRunView: UIViewController {
    
    var isValid = true
    var time = Double(Values.breakTimeSpd)
    var time2 = Double()
    var timer = Timer()
    var timer2 = Timer()
    let interval = 1.0


    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var number: UILabel!
    
    @IBOutlet weak var level: UILabel!
    @IBOutlet weak var lives: UILabel!
    
    @objc func action() {
        cantPlay()
        time -= interval
        if time >= 0.0 {
            label.text = String(Int(time))
        }
        
        if time <= 0.0 && isValid == true{
            isValid = false
            start()
            timer.invalidate()
            time2 = setTimer()
            if (!timer2.isValid){
                timer2 = Timer.scheduledTimer(timeInterval: interval, target: self, selector: #selector(SpeedRunView.action), userInfo: self, repeats: true)
            }
        }
        
        if time <= 0.0{
            
            time2 -= interval
            if time2 <= 0.0 {
                timer2.invalidate()
                turnPageForward()
            }
            label.text = String(Int(time2))
        }
    }
    
    
    override func viewDidLoad() {
        updateLevelLabel()
        updateLivesLabel()
        cantPlay()
        
        super.viewDidLoad()
        
        if(!timer.isValid){
            timer = Timer.scheduledTimer(timeInterval: interval, target: self, selector: #selector(GameView.action),userInfo: self, repeats: true)
        }
    }
    

    func updateLevelLabel(){
        level.text! = " Level: " + String(Values.levelSpd)
    }
    
    func updateLivesLabel() {
        lives.text! = " Lives: " + String(Values.lives)
    }
    
    
    func setTimer() -> Double {
        return Double(Values.levelSpd) * 1 + 2
    }
    
    func start() {
        Values.thatNumber = rand(min: UInt32(difficulityMin(level: Values.levelSpd)), max: UInt32(difficulityMax(level: Values.levelSpd)))
        number.text! = String(Values.thatNumber)
    }
    
    func turnPageForward() {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyboard.instantiateViewController(withIdentifier: "SpeedNumberView")
        self.present(newViewController, animated: false, completion: nil)
    }
    
    func rand(min: UInt32, max: UInt32) -> Int {
        let r = arc4random_uniform(max - min) + min
        return Int(r)
    }
    
    func timeFlow() {
        time -= interval
    }
    
    func time2Flow() {
        time2 -= interval
    }
    
    func cantPlay() {
        if Values.lives == 0 {
            let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyboard.instantiateViewController(withIdentifier: "MainPage")
            self.present(newViewController, animated: false, completion: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    

}
