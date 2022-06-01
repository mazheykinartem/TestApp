//
//  File.swift
//  VKAppNew
//
//  Created by  Artem Mazheykin on 04.11.2017.
//  Copyright © 2017 Morodin. All rights reserved.
//

import UIKit

protocol Factory: AnyObject{
    
    func mainScreenController() -> UIViewController
    
}
