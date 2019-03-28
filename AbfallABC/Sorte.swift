//
//  Sorte.swift
//  AbfallABC
//
//  Created by Benedikt Kurz on 28.03.19.
//  Copyright © 2019 Benedikt Kurz. All rights reserved.
//

import Foundation


struct Sorten : Decodable {
    var sorten: [Sorte]
}

struct Sorte : Codable {
    
    var Name: String
    var avv: String
    
}
