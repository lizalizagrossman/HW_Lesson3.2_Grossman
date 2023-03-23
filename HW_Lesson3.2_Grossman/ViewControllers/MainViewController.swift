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
    private var countryChosen: Int! {
        didSet {}
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countryUIpickerView.delegate = self
        countryUIpickerView.dataSource = self
    }
    //MARK: - Navigation
    
    
    //MARK: - IB Actions
    @IBAction func buttonTapped(_ sender: UIButton) {
        
    }
    
    
    
    //MARK: - Networking
    
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
        var countryTitle = ""
        if row == 0 {
            countryTitle = Link.israel.rawValue
        } else if row == 1 {
            countryTitle = Link.russia.rawValue
        } else if row == 2 {
            countryTitle = Link.belarus.rawValue
        } else if row == 3 {
            countryTitle = Link.israel.rawValue
        } else if row == 4 {
            countryTitle = Link.armenia.rawValue
        } else if row == 5 {
            countryTitle = Link.kazakhstan.rawValue
        }
        return countryTitle
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
     {
         countryChosen = row
    }
}
