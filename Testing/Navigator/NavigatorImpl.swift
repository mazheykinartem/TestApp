//
//  NavigatorImpl.swift
//  VKAppNew
//
//  Created by  Artem Mazheykin on 04.11.2017.
//  Copyright © 2017 Morodin. All rights reserved.
//

import UIKit

class NavigatorImpl: Navigator{
    
    let router: Router = RouterImpl()
    private weak var Factory: Factory!
    
    init(Factory: Factory){
        self.Factory = Factory
    }
    
    func showFirstViewController() {
        let vc = Factory.mainScreenController()
        _ = router.presentViewController(nextViewController: vc)
    }
    
}
