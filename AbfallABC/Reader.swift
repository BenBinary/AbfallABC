//
//  Reader.swift
//  AbfallABC
//
//  Created by Benedikt Kurz on 28.03.19.
//  Copyright © 2019 Benedikt Kurz. All rights reserved.
//

import Foundation


struct Reader {
    
    let encoder = JSONEncoder()
    
    
    init() {
        
        
        
    }
    
    static func getStoffe() -> [Stoff]? {
        let decoder = JSONDecoder()
        
        
      
            if let url = Bundle.main.url(forResource: "stoff", withExtension: "json") {
                
                if let data = try? Data(contentsOf: url) {
                    
                    if let jsonData = try? decoder.decode(Stoffe.self, from: data) {
                        
                        return jsonData.stoffe
                        
                    } else { return nil }
                    
                } else { return nil }
                
            } else { return nil }
 
        
        
        
        
    }
    
    
    static func getPersonen() -> [Person]? {
        let decoder = JSONDecoder()
        
        if let path = Bundle.main.path(forResource: "personen", ofType: "json") {
            
            
            if let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe) {
                if let jsonData = try? decoder.decode(Personen.self, from: (data)) {
                    return jsonData.person
                } else { return nil }
                
            } else { return nil}
            
        } else { return nil }
    }
    
}
