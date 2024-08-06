//
//  User.swift
//  Appetizers
//
//  Created by Kanwar Sandhu on 2024-08-05.
//

import Foundation

struct User : Codable {
    var firstName = ""
    var lastName = ""
    var email = ""
    var birthDate = Date()
    var extraNap = false
    var freqRefills = false
}
