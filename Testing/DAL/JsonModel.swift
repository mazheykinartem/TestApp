//
//  JsonModel.swift
//  Testing
//
//  Created by  Artem Mazheykin on 30.05.2022.
//

import Foundation

struct JsonModel: Decodable{
    
    let data: [JsonInnerLayer]?
    let sequence: [String]?
    
    enum CodingKeys: String, CodingKey{
        case data = "data"
        case sequence = "view"
    }
}

struct JsonInnerLayer: Decodable{
    let name: String?
    let data: JsonDoubbleInnerLayer?
    
    enum CodingKeys: String, CodingKey{
        case name = "name"
        case data = "data"
    }
}

struct JsonDoubbleInnerLayer: Decodable{
    let text: String?
    let url: String?
    let seletedId: Int?
    let variants: [JsonTrippleInnerLayer]?
    
    enum CodingKeys: String, CodingKey{
        case text = "text"
        case url = "url"
        case seletedId = "seletedId"
        case variants = "variants"
    }

}

struct JsonTrippleInnerLayer: Decodable{
    
    let id: Int?
    let text: String?
    
    enum CodingKeys: String, CodingKey{
        case id = "id"
        case text = "text"
    }

}
