//
//  SpeedRunSettings.swift
//  Rememberer
//
//  Created by Tohil on 17/02/2018.
//  Copyright © 2018 Tohil. All rights reserved.
//

import UIKit

class SpeedRunSettings: UIViewController {
    
    @IBOutlet weak var breakTimeLbl: UILabel!
    
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

    override func viewDidLoad() {
        super.viewDidLoad()
        updateBreakTimeLbl()
    }
    
    func updateBreakTimeLbl(){
        breakTimeLbl.text! = String(Values.breakTimeSpd)
    }
    
    func plus() {
        Values.breakTimeSpd += 1
    }
    
    func minus() {
        Values.breakTimeSpd -= 1
    }
    
    func saveBreakTime() {
        UserDefaults.standard.set(String(Values.breakTimeSpd), forKey: "breakspd")
    }

}
