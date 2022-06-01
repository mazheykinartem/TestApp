//
//  RouterViewControllerType.swift
//  VKAppNew
//
//  Created by  Artem Mazheykin on 04.11.2017.
//  Copyright © 2017 Morodin. All rights reserved.
//

import Foundation

enum StoryboardViewControllerType:Int {
    case navigationController, mainViewController
    
    var identifier: String {
        
        switch self {
            
        case .navigationController:
            return "navigationController"
            
        case .mainViewController:
            return "mainViewController"
            
        }
    }
}
