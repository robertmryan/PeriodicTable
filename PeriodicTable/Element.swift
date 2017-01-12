//
//  Element.swift
//  PeriodicTable
//
//  Created by Robert Ryan on 1/9/17.
//  Copyright © 2017 Robert Ryan. All rights reserved.
//

import Foundation

struct Element {
    let atomicNumber: Int
    let symbol: String
    let name: String
    let origin: String
    let group: Int?              // 1-based group number (corresponding to the column in the table), from 1 to 18 (but f-block lanthanides and actinides have no `group` value
    let period: Int              // 1-based row number (corresponding to the row in the table), from 1 to 7 (note, f-block lanthanides and actinides will be visually represented on separate rows in table)
    let atomicWeight: String
    let density: String
    let melt: String
    let boil: String
    let c10: String
    let x10: String
    let abundance: String
    
    init(dictionary: [String: Any]) {
        atomicNumber = Int(dictionary["Element"] as! String)!
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
    
    /// A zero-based row number.
    ///
    /// This largely corresponds to the 1-based `period`, though the f-block elements
    /// have been moved down below the main table and have their own rows.
    
    var row: Int {
        switch atomicNumber {
        case 57 ... 70:             // f-block lan­thanides
            return 8 - 1
        case 89 ... 102:            // f-block actinides
            return 9 - 1
        default:
            return period - 1
        }
    }
    
    /// A zero-based column number.
    ///
    /// This largely corresponds to the 1-based `group`, though the f-block elements
    /// have been moved down below the main table and show up, starting under the `group`
    /// 3 elements.
    
    var column: Int {
        switch atomicNumber {
        case 57 ... 70:             // f-block lan­thanides
            return atomicNumber - 57 + 2
        case 89 ... 102:            // f-block actinides
            return atomicNumber - 89 + 2
        default:
            return group! - 1
        }
    }
}
