//
//  City.swift
//  testTaskIOS
//
//  Created by Admin on 27.06.2022.
//

import Foundation

class City: Codable{
    
    
    var name: String
    var country: String
    var population: Int
    var squere: Int
    var founded: Int
    
    init(name: String, country: String, population: Int, squere: Int, founded: Int){
        self.name = name
        self.country = country
        self.population = population
        self.squere = squere
        self.founded = founded
    }
    
    
        enum CodingKeys: String, CodingKey {
        case name, country, population, squere, founded
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        
        self.name = try container.decode(String.self, forKey: .name)
        self.country = try container.decode(String.self, forKey: .country)
        self.population = try container.decode(Int.self, forKey: .population)
        self.squere = try container.decode(Int.self, forKey: .squere)
        self.founded = try container.decode(Int.self, forKey: .founded)
        
    }
    
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        
        try container.encode(self.name, forKey: .name)
        try container.encode(self.country, forKey: .country)
        try container.encode(self.population, forKey: .population)
        try container.encode(self.squere, forKey: .squere)
        try container.encode(self.founded, forKey: .founded)
    }
    
    
   
    
}


extension UserDefaults{
    
    func set<T: Encodable>(encodable: T, forKey key: String){
        if let data = try? JSONEncoder().encode(encodable){
        set(data, forKey: key)
    }
}
    
    func value<T:Decodable>(_ type: T.Type, for key: String) -> T? {
        if let data = object(forKey: key) as? Data,
           let value = try? JSONDecoder().decode(type, from: data) {
            return value
        }
        return nil
    }
    
}
