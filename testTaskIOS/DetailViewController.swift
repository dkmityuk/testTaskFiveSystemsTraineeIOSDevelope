//
//  DetailViewController.swift
//  testTaskIOS
//
//  Created by Admin on 27.06.2022.
//

import UIKit

class DetailViewController: UIViewController {

    var city: City!
    
    let countryLabel = UILabel()
    let populationLabel = UILabel()
    let foundedLabel = UILabel()
    let squereLabel = UILabel()
    
    
    var cityImage = UIImageView()


    
    override func viewDidLoad() {
        
        cityImage.frame = CGRect(x: 15, y: 150, width: 385, height: 300)
        cityImage.contentMode = .scaleAspectFill
        cityImage.semanticContentAttribute = .unspecified
        countryLabel.frame = CGRect(x: 15, y: 450, width: 200, height: 50)
        populationLabel.frame = CGRect(x: 15, y: 500, width: 200, height: 50)
        foundedLabel.frame = CGRect(x: 15, y: 550, width: 200, height: 50)
        squereLabel.frame = CGRect(x: 15, y: 600, width: 200, height: 50)
        countryLabel.text = "🗺️Country:\(city.country)"
        populationLabel.text = "🙋‍♂️Population:\(city.population)"
        foundedLabel.text = "🏛️Was found at:\(city.founded)"
        squereLabel.text = "🌆Squere:\(city.squere)km²"
        self.view.addSubview(countryLabel)
        self.view.addSubview(populationLabel)
        self.view.addSubview(foundedLabel)
        self.view.addSubview(squereLabel)
        super.viewDidLoad()

        self.view.addSubview(cityImage)
//        descriptionLabel.text = "\(city.description)"
        self.view.addSubview(countryLabel)
        title = city.name
        

        
        cityImage.image = UIImage(named: city.name)
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
