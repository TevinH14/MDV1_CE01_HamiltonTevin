//
//  StarWarsFlim.swift
//  HamiltonTevin_CE01
//
//  Created by Tevin Hamilton on 9/6/19.
//  Copyright © 2019 Tevin Hamilton. All rights reserved.
//

import Foundation
//import UIkit to be able to save UIImages to a star wars film image
import UIKit

class StarWarsFlim
{
    //MARK:stored properties
    let filmName:String
    let releaseYear:Int
    let totalGross:Float
    let distributor:Bool
    let starWarsImage:UIImage?
    
    //MARK:initialzer
    init(filmName:String,releaseYear:Int,totalGross:Float,distributor:Bool,starWarsImage:UIImage?)
    {
        self.filmName = filmName
        self.releaseYear = releaseYear
        self.totalGross = totalGross
        self.distributor = distributor
        self.starWarsImage = starWarsImage
    }
    
}
