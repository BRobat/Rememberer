//
//  MainGameSettings.swift
//  Rememberer
//
//  Created by Tohil on 19/11/2017.
//  Copyright © 2017 Tohil. All rights reserved.
//

import UIKit

class MainGameSettings: UIViewController {

    @IBOutlet weak var levelLbl: UILabel!
    @IBOutlet weak var pointsLbl: UILabel!
    @IBOutlet weak var breakTimeLbl: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updatePointsLabel()
        updateLevelLabel()
        updateBreakTimeLbl()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func plusBtnPressed(_ sender: Any) {
        if Values.breakTimeSpd < 15 {
        plus()
        updateBreakTimeLbl()
        }
    }
    
    @IBAction func minusBtnPressed(_ sender: Any) {
        if Values.breakTimeSpd > 0{
        minus()
        updateBreakTimeLbl()
        }
    }
    
    @IBAction func resetBtnPressed(_ sender: Any) {
        reset()
        updateLevelLabel()
        updatePointsLabel()
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        saveBreakTime()
        saveLevel()
        saveExp()
    }
    
    
    func updatePointsLabel() {
        pointsLbl.text! = "  Points: " + String(Values.experience)
    }
    
    func updateLevelLabel(){
        levelLbl.text! = "  Level: " + String(Values.level)
    }
    
    func updateBreakTimeLbl(){
        breakTimeLbl.text! = String(Values.breakTime)
    }
    
    func reset() {
        Values.level = 1
        Values.experience = 0
    }
    
    func plus() {
        Values.breakTime += 1
    }
    
    func minus() {
        Values.breakTime -= 1
    }
    
    func saveBreakTime() {
        UserDefaults.standard.set(String(Values.breakTime), forKey: "break")
    }
    
    func saveLevel() {
        UserDefaults.standard.set(String(Values.level), forKey: "Level")
    }
    
    func saveExp() {
        UserDefaults.standard.set(String(Values.experience), forKey: "exp")
    }
    
    
    
}
