//
//  Logic.swift
//  Rememberer
//
//  Created by Tohil on 05/11/2017.
//  Copyright © 2017 Tohil. All rights reserved.
//

import Foundation
import UIKit
import CoreData

func powah(a: Int, b:Int) -> Int{
    //I've needed Integral power operator
    var a2 = a
    var i = 1
    while i < b {
        a2 *= a
        i += 1
    }
    return a2
}


func factorial(a: Int) -> Int {
    //why do I need this?
    var i = 0
    var j = 0
    while i < a{
        i += 1
        j += i
    }
    return j
}

func levelSet(exp: Int) -> Int{
    //that's why I need factorial
    for x in 1...1000{
        
        if exp < factorial(a: x)*100 {
            return x
        }
    }
    return 0
}

func difficulityMax(level: Int) -> Int {
    //sets max number on each level
    
    return powah(a: 10,b: level) * 100
}

func difficulityMin(level: Int) -> Int {
    
    return powah(a: 10,b: level) * 10
}

func expGain(level: Int) -> Int {
    
    return 25 * level
}







