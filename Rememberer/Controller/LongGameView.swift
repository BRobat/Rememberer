//
//  ViewController.swift
//  Rememberer
//
//  Created by Tohil on 28/10/2017.
//  Copyright © 2017 Tohil. All rights reserved.
//
import Foundation
import UIKit
import CoreData

class GameView: UIViewController {

    var isValid = true
    var time = Double(Values.breakTime)
    var time2 = Double()
    var timer = Timer()
    var timer2 = Timer()
    let interval = 1.0
    
    @IBOutlet var numbers: UILabel!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var points: UILabel!
    @IBOutlet var levelLbl: UILabel!

    
    @objc func action() {
        Values.level = levelSet(exp: Values.experience)
        updateLevelLabel()
        updatePointsLabel()
        
        time -= interval
        if time >= 0.0 {
            timeLabel.text = String(Int(time))
        }
        
        if time <= 0.0 && isValid == true{
            isValid = false
            start()
            timer.invalidate()
            time2 = setTimer()
            if(!timer2.isValid){
                timer2 = Timer.scheduledTimer(timeInterval: interval, target: self, selector: #selector(GameView.action),userInfo: self, repeats: true)
            }
        }
        
        if time <= 0.0{
            
            time2 -= interval
            if time2 <= 0.0 {
                timer2.invalidate()
                turnPageForward()
                
            }
            timeLabel.text = String(Int(time2))
        }
    }
    
    override func viewDidLoad() {
        updateLevel()
        updateLevelLabel()
        updatePointsLabel()
        
        saveExp()
        saveLevel()
        
        super.viewDidLoad()
        
        if(!timer.isValid){
            timer = Timer.scheduledTimer(timeInterval: interval, target: self, selector: #selector(GameView.action),userInfo: self, repeats: true)
        }
    }
    
    
    func updatePointsLabel() {
        points.text! = "  Points: " + String(Values.experience)
    }
    
    func updateLevelLabel(){
        levelLbl.text! = "  Level: " + String(Values.level)
    }
    
    func updateLevel() {
        Values.level = levelSet(exp: Values.experience)
    }
    
    func setTimer() -> Double {
        return Double(Values.level) * 1 + 2
    }
    
    func saveLevel() {
        UserDefaults.standard.set(String(Values.level), forKey: "Level")
    }
    
    func saveExp() {
        UserDefaults.standard.set(String(Values.experience), forKey: "exp")
    }
    
    func start() {
        Values.thatNumber = rand(min: UInt32(difficulityMin(level: Values.level)), max: UInt32(difficulityMax(level: Values.level)))
        numbers.text! = String(Values.thatNumber)
    }
    
    
    func turnPageForward() {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyboard.instantiateViewController(withIdentifier: "NumberView")
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
    
}

