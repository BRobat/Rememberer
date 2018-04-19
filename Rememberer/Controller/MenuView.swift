//
//  MenuView.swift
//  Rememberer
//
//  Created by Tohil on 19/11/2017.
//  Copyright © 2017 Tohil. All rights reserved.
//

import UIKit

class MenuView: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        loadLevel()
        loadExp()
        loadBreakTime()
        loadBreakTimespd()
        resetSpdLives()
        resetSpdLevel()
    }
    
    func loadLevel(){
        if let level = UserDefaults.standard.value(forKey: "Level") as? String {
            Values.level = Int(level)!
        }
    }
    
    func loadExp() {
        if let exp = UserDefaults.standard.value(forKey: "exp") as? String {
            Values.experience = Int(exp)!
        }
    }
    
    func loadBreakTime() {
        if let br = UserDefaults.standard.value(forKey: "break") as? String {
            Values.breakTime = Int(br)!
        }
    }
    
    func loadBreakTimespd() {
        if let br = UserDefaults.standard.value(forKey: "breakspd") as? String {
            Values.breakTimeSpd = Int(br)!
        }
    }
    
    
    func resetSpdLives() {
        Values.lives = 3
    }
    
    func resetSpdLevel() {
        Values.levelSpd = 1
    }

}
