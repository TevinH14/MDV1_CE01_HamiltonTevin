//
//  StarWarsCharater.swift
//  HamiltonTevin_CE02
//
//  Created by Tevin Hamilton on 3/18/20.
//  Copyright © 2020 Tevin Hamilton. All rights reserved.
//

import Foundation
import UIKit

class StarWarsCharacters {
    let name:String
    let faction:String
    let imageNumber:String
  
    
    init(name: String, faction:String, imageNumber:String) {
        self.name = name
        self.faction = faction
        self.imageNumber = imageNumber
    }
}
