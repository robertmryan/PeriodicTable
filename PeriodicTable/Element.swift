//
//  Element.swift
//  PeriodicTable
//
//  Created by Robert Ryan on 1/9/17.
//  Copyright © 2017 Robert Ryan. All rights reserved.
//

import Foundation

struct Element {
    let number: Int
    let symbol: String
    let name: String
    let origin: String
    let group: Int?
    let period: Int
    let atomicWeight: String
    let density: String
    let melt: String
    let boil: String
    let c10: String
    let x10: String
    let abundance: String
    
    init(dictionary: [String: Any]) {
        number       = Int(dictionary["Element"] as! String)!
        symbol       = dictionary["Symbol"] as! String
        name         = dictionary["Name"] as! String
        origin       = dictionary["Origin"] as! String
        group        = Int(dictionary["Group"] as! String)
        period       = Int(dictionary["Period"] as! String)!
        atomicWeight = dictionary["Atomic weight"] as! String
        density      = dictionary["Density"] as! String
        melt         = dictionary["Melt"] as! String
        boil         = dictionary["Boil"] as! String
        c10          = dictionary["C10"] as! String
        x10          = dictionary["X10"] as! String
        abundance    = dictionary["Abundance"] as! String
    }
    
    var row: Int {
        switch number {
        case 57 ... 70:
            return 8 - 1
        case 89 ... 102:
            return 9 - 1
        default:
            return period - 1
        }
    }
    
    var column: Int {
        switch number {
        case 57 ... 70:
            return number - 57 + 2
        case 89 ... 102:
            return number - 89 + 2
        default:
            return group! - 1
        }
    }
}
