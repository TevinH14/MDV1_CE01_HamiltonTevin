//
//  ViewController.swift
//  HamiltonTevin_CE01
//
//  Created by Tevin Hamilton on 9/6/19.
//  Copyright © 2019 Tevin Hamilton. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // create array of star wars film to store the data from the json file
    var sWFilms = [StarWarsFlim]()
    //counter to keep track of current index
    var counter:Int = 0
    //MARK:IBOutlet
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblYear: UILabel!
    @IBOutlet weak var lblGross: UILabel!
    @IBOutlet weak var lblDistributor: UILabel!
    @IBOutlet weak var filmImage: UIImageView!
    @IBOutlet weak var lblCounter: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //get the path to StarWarsFilms json file
        if let path = Bundle.main.path(forResource: "StarWarsFilms", ofType:".json")
        {
            
            //create a url path to the json file
            let url = URL(fileURLWithPath: path)
            
            do
            {
                //create a data object that using the url object above.
                let data = try Data.init(contentsOf: url)
                //create a json object from the data object above.
                let jsonObj = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [Any]
                //call the function below and pass the json object
                AddToStarWarsFilmArray(jsonObject: jsonObj)
            }
                
            //print error message to console
            catch
            {
                print(error.localizedDescription)
            }
        }
        
        // add the first star wars film object stored properties located in the sWfilms array to the correct UI elements
        lblName.text = sWFilms[counter].filmName
        lblYear.text = String(sWFilms[counter].releaseYear)
        lblGross.text = "\(String(sWFilms[counter].totalGross))%"
        
        var distributorString:String
        //check if distributor is true or false
        if sWFilms[counter].distributor == true
        {
            distributorString = "Fox"
        }
        else
        {
            distributorString = "BUENA VISTA"
        }
        lblDistributor.text = "movie Distributor is \(distributorString)"
        filmImage.image = sWFilms[counter].starWarsImage
    }
    
    //parse json object then add to starWarsFilm object and add to array
    func AddToStarWarsFilmArray(jsonObject:[Any]?)
    {
        //optional bonding jsonObject to jsonObj and nil check
        if let jsonObj = jsonObject
        {
            //loop threw jsonObj
            for firstLevelItem in jsonObj
            {
                //parse json object and added new constant
                guard let object = firstLevelItem as? [String:Any],
                    let flimName = object["film_name"] as? String,
                    let year = object["released_year"] as? String,
                    let gross = object["total_gross"] as? String,
                    let studio = object["studio"] as? String
                    else{return}
                
                //created to be filled with UIImage thats in asssest folder to be used to display the correct image.
                var currentimage: UIImage?
                
                //check  year constant to set the proper UIImage
                switch year
                {
                case "1977":
                    currentimage = UIImage(named: "starwars1")
                case "1980":
                    currentimage = UIImage(named: "empireStrikeBack")
                case "1983":
                    currentimage = UIImage(named: "returnOfTheJedi")
                case "1999":
                    currentimage = UIImage(named: "thePhantomMenace")
                case "2002":
                    currentimage = UIImage(named: "AttackOfTheClone")
                case "2005":
                    currentimage = UIImage(named: "revengeOfTheSith")
                case "2015":
                    currentimage = UIImage(named: "theForceAwaken")
                case "2016":
                    currentimage = UIImage(named: "rogueOne")
                case "2017":
                    currentimage = UIImage(named: "thelastjedi")
                case "2018":
                    currentimage = UIImage(named: "solo")
                default:
                    print("something went wrong")
                }
                
                //create a starWarsFilm object and addto sWFilms array
                sWFilms.append(StarWarsFlim(filmName: flimName, releaseYear: (Int(year))!, totalGross: (Float(gross))!, distributor: (Bool(studio))!, starWarsImage: currentimage))
            }
        }
    }
    
    //UIButton next to move to the next object in the object array
    @IBAction func NextButton(_ sender: UIButton)
    {
        //check the current index of the array and if less run the code below
        if counter < 9
        {
            //add one to counter to change the index of the starWarsFilm object
            counter += 1
            lblName.text = sWFilms[counter].filmName
            lblYear.text = String(sWFilms[counter].releaseYear)
            lblGross.text = "\(String(sWFilms[counter].totalGross))%"
            var distributorString:String
            if sWFilms[counter].distributor == true
            {
                distributorString = "Fox"
            }
            else
            {
                distributorString = "BUENA VISTA"
            }
            lblDistributor.text = "movie Distributor is \(distributorString)"
            filmImage.image = sWFilms[counter].starWarsImage
            lblCounter.text = "\(String(counter + 1)) of 10"
        }
        // if array index reachs the end loop back to the front.
        else
        {
            counter = 0
            lblName.text = sWFilms[counter].filmName
            lblYear.text = String(sWFilms[counter].releaseYear)
            lblGross.text = "\(String(sWFilms[counter].totalGross))%"
            var distributorString:String
            if sWFilms[counter].distributor == true
            {
                distributorString = "Fox"
            }
            else
            {
                distributorString = "BUENA VISTA"
            }
            lblDistributor.text = "movie Distributor is \(distributorString)"
            filmImage.image = sWFilms[counter].starWarsImage
            lblCounter.text = "\(String(counter + 1)) of 10"        }
    }
    
    //UIButton to view the previous object in the array
    @IBAction func BackButton(_ sender: UIButton)
    {
        //check if index is greater then 0 if  counter is greater then 0 then run the code below
        if counter > 0
        {
            counter -= 1
            lblName.text = sWFilms[counter].filmName
            lblYear.text = String(sWFilms[counter].releaseYear)
            lblGross.text = "\(String(sWFilms[counter].totalGross))%"
            var distributorString:String
            if sWFilms[counter].distributor == true
            {
                distributorString = "Fox"
            }
            else
            {
                distributorString = "BUENA VISTA"
            }
            lblDistributor.text = "movie Distributor is \(distributorString)"
            filmImage.image = sWFilms[counter].starWarsImage
            lblCounter.text = "\(String(counter + 1)) of 10"
        }
             // if array index reachs the beginning of loop back to the last index.
        else
        {
           
            counter = 9
            lblName.text = sWFilms[counter].filmName
            lblYear.text = String(sWFilms[counter].releaseYear)
            lblGross.text = "\(String(sWFilms[counter].totalGross))%"
            var distributorString:String
            if sWFilms[counter].distributor == true
            {
                distributorString = "Fox"
            }
            else
            {
                distributorString = "BUENA VISTA"
            }
            lblDistributor.text = "movie Distributor is \(distributorString)"
            filmImage.image = sWFilms[counter].starWarsImage
            lblCounter.text = "\(String(counter + 1)) of 10"
        }
    }
    
    
    
}
