//
//  JsonModel.swift
//  Testing
//
//  Created by  Artem Mazheykin on 30.05.2022.
//

import Foundation

class CellSelectorModel{
    
    let IdNumber: Int
    let text: String
    
    init(IdNumber: Int, text: String){
        self.IdNumber = IdNumber
        self.text = text
    }
    
}

class SelectorModel{
    let nameText: String
    let data: [CellSelectorModel]
    
    init(nameText: String, data: [CellSelectorModel]){
        self.nameText = nameText
        self.data = data
    }
}

