//
//  MainViewController.swift
//  HW_Lesson3.2_Grossman
//
//  Created by Elizabeth on 20/03/2023.
//

import UIKit

final class MainViewController: UIViewController {
    
    //MARK: - IB Outlets
    @IBOutlet var countryUIpickerView: UIPickerView!
    
    //MARK: - Private outlets
    private let networkManager = NetworkManager.shared
    private let countries = Link.allCases
    private var countryChosen: Link = .israel {
        didSet {}
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countryUIpickerView.delegate = self
        countryUIpickerView.dataSource = self
        
    }
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showBirdList" {
            let birdInfoVC = segue.destination as? BirdsListTableViewController
            birdInfoVC?.country = countryChosen
        }
    }
    
    //MARK: - IB Actions
    @IBAction func buttonTapped(_ sender: UIButton) {
    }
    
    
    //MARK: - Private func
    

    
}
    //MARK: - UIPickerViewDataSource and UIPickerViewDelegate

extension MainViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        print("pep")
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        Link.allCases.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return countries[row].description
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
         let currentItem = countries[pickerView.selectedRow(inComponent: component)]
         print(row)
         countryChosen = currentItem
    }
}


