//
//  NumberView.swift
//  Rememberer
//
//  Created by Tohil on 28/10/2017.
//  Copyright © 2017 Tohil. All rights reserved.
//

import Foundation
import UIKit

class NumberView: UIViewController {
    
    @IBOutlet var answer: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func retry(_ sender: UIButton) {
        Values.experience -= 50
        turnPageBack()
    }
    
    @IBAction func check(_ sender: UIButton) {
        if answer.text! == String(Values.thatNumber){
            Values.experience += expGain(level: Values.level)
            turnPageBack()
            
        } else {
            Values.experience -= expGain(level: Values.level)*2
            
            turnPageBack()
        }
    }
    
    func turnPageBack(){
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyboard.instantiateViewController(withIdentifier: "ViewController")
        self.present(newViewController, animated: false, completion: nil)
        
    }
    

    
    //to jest bez sensu kurde
    //no weź, kto pisze tak beznadziejny kod
    
    
    @IBAction func one(_ sender: UIButton) {
        answer.text! += "1"
    }
    
    @IBAction func two(_ sender: UIButton) {
        answer.text! += "2"
    }

    @IBAction func thr(_ sender: UIButton) {
        answer.text! += "3"
    }
    
    @IBAction func fou(_ sender: UIButton) {
        answer.text! += "4"
    }
    
    @IBAction func fiv(_ sender: UIButton) {
        answer.text! += "5"
    }
    
    @IBAction func six(_ sender: UIButton) {
        answer.text! += "6"
    }
    
    @IBAction func sev(_ sender: UIButton) {
        answer.text! += "7"
    }
    
    @IBAction func eig(_ sender: UIButton) {
        answer.text! += "8"
    }
    
    @IBAction func nin(_ sender: UIButton) {
        answer.text! += "9"
    }
    
    @IBAction func zer(_ sender: UIButton) {
        answer.text! += "0"
    }
    
    @IBAction func back(_ sender: UIButton) {
        if answer.text! != "" {
        answer.text!.remove(at: answer.text!.index(before: answer.text!.endIndex))
        }
    }
    
}
