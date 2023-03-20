//
//  Bird.swift
//  HW_Lesson3.2_Grossman
//
//  Created by Elizabeth on 20/03/2023.
//

import Foundation

struct Bird: Decodable {
    let comName: String
    let sciName: String
    let locName: String
    let obsDt: String
    let howMany: Int?
}
