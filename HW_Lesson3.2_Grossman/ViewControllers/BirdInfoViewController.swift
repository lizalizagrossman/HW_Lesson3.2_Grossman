//
//  BirdInfoViewController.swift
//  HW_Lesson3.2_Grossman
//
//  Created by Elizabeth on 23/03/2023.
//

import UIKit

final class BirdInfoViewController: UIViewController {
    
    var bird: Bird!
    
    // MARK: - IBOutlets
    @IBOutlet var commonNameLabel: UILabel!
    @IBOutlet var scientificNamelabel: UILabel!
    @IBOutlet var locationNameLabel: UILabel!
    @IBOutlet var dateLastSeenLabel: UILabel!
    @IBOutlet var numberOfBirdsSeenLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTitles()
        navigationItem.title = bird.comName
    }
    
    // MARK: - Private functions
    private func setTitles() {
        commonNameLabel.text = bird.comName
        scientificNamelabel.text = bird.sciName
        locationNameLabel.text = bird.locName
        dateLastSeenLabel.text = bird.obsDt
        numberOfBirdsSeenLabel.text = "\(bird.howMany ?? 0)"
    }
}
