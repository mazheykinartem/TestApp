//
//  ViewModel.swift
//  Testing
//
//  Created by  Artem Mazheykin on 29.05.2022.
//

import Foundation
import PromiseKit


class MainViewModel{
    
    var network: Network!
    let urlString = "https://pryaniky.com/static/json/sample.json"
    
    var arrayOfCellsHzModel:[CellHzModel] = []
    var arrayOfCellsPictureModel:[CellPictureModel] = []
    var arrayOfCellsSelectorModel:[CellSelectorModel] = []


    var sequence: [String] = []
    
    var arrayOfSequenceCells: [AnyObject] = []
    

    init(){
        self.network = NetworkImpl()
    }
    
    
    func getData(from jsonModel: JsonModel){

        if let cells = jsonModel.data{
            for cell in cells{
                if let cellName = cell.name, cellName == "hz"{
                    guard let cellDataText = cell.data?.text else {return}
                    let cell = CellHzModel(nameText: cellName, dataText: cellDataText)
                    arrayOfCellsHzModel.append(cell)
                }
                if let cellname = cell.name, cellname == "picture"{
                    guard let cellPictureName = cell.data?.text, let cellPictureUrl = cell.data?.url else {return}
                    let cell = CellPictureModel(nameText: cellname, pictureName: cellPictureName, pictureUrl: cellPictureUrl)
                    arrayOfCellsPictureModel.append(cell)
                }
                if let cellsname = cell.name, cellsname == "selector"{
                    if let arrayOfSelectorCells = cell.data?.variants{
                        for selectorCell in arrayOfSelectorCells{
                            guard let id = selectorCell.id, let text = selectorCell.text else {return}
                            let cell = CellSelectorModel(IdNumber: id, text: text)
                            arrayOfCellsSelectorModel.append(cell)
                        }
                    }
                    
                }
                    
            }
        }

        if let sequence = jsonModel.sequence {
            self.sequence = sequence
        }
        
        for cellTag in sequence{
            switch cellTag{
            case SequenceTags.hz.rawValue: arrayOfSequenceCells += arrayOfCellsHzModel
            case SequenceTags.selector.rawValue: arrayOfSequenceCells += arrayOfCellsSelectorModel
            case SequenceTags.picture.rawValue: arrayOfSequenceCells += arrayOfCellsPictureModel
            default: break
        }
        }
        
        print("SELECTORS CELLS: \(arrayOfCellsSelectorModel), PICTURE CELLS: \(arrayOfCellsPictureModel), HZ CELLS: \(arrayOfCellsHzModel)")
        
    }
    
    func parseJsonAndGetModel() -> Promise<Void>{
        
        return Promise {seal in
            firstly {
                network.getDataRequest(from: urlString)}.done { response in
                    guard let optData = response.value, let data = optData else {return}
                    let json = try JSONDecoder().decode(JsonModel.self, from: data)
                    self.getData(from: json)
                    if let sequence = json.sequence {
                        self.sequence = sequence
                    }
                    seal.fulfill_()
                }.catch { error in
                        print("Error decoding == \(error)")
                    }
        }

        }
}
