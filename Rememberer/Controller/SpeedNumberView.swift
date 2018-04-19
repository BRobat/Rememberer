//
//  SpeedNumberView.swift
//  Rememberer
//
//  Created by Tohil on 14/02/2018.
//  Copyright © 2018 Tohil. All rights reserved.
//

import UIKit

class SpeedNumberView: UIViewController {

    @IBOutlet var answer: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func retry(_ sender: UIButton) {
        liveLost()
        turnPageBack()
    }
    
    @IBAction func check(_ sender: UIButton) {
        if answer.text! == String(Values.thatNumber){
            addLevel()
            turnPageBack()
            
        } else {
            liveLost()
            if Values.lives == 0 {
                turnPageBackToMenu()
            }
            turnPageBack()
        }
    }

    func turnPageBack(){
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyboard.instantiateViewController(withIdentifier: "SpeedRunView")
        self.present(newViewController, animated: false, completion: nil)
    }
    
    func turnPageBackToMenu(){
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyboard.instantiateViewController(withIdentifier: "MainPage")
        self.present(newViewController, animated: false, completion: nil)
    }
    
    func liveLost() {
        Values.lives -= 1
    }
    
    func addLevel() {
        Values.levelSpd += 1
    }
    
    
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
