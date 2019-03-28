//
//  Person.swift
//  AbfallABC
//
//  Created by Benedikt Kurz on 28.03.19.
//  Copyright © 2019 Benedikt Kurz. All rights reserved.
//

import Foundation

struct Personen: Decodable {
    var person: [Person]
}

struct Person: Codable {
    
    var age:String
    var employed:String
    var name:String
    
    
}
