//
//  FabrikaImpl.swift
//  VKAppNew
//
//  Created by  Artem Mazheykin on 04.11.2017.
//  Copyright © 2017 Morodin. All rights reserved.
//

import UIKit

class FabrikaImpl: Fabrika{
    
    private let storyboard: Storyboard = StoryboardImpl()
    private var navigator: Navigator!
//    private var systemParametersService: SystemParametersService!
//    private var songService: SongService!
    
    private func initDAL(){
//        initSystemParametersService()
//        initSongService()
    }
    
//    private func initSystemParametersService(){
//        let systemParametersService = SystemParametersServiceImpl()
//        systemParametersService.repository = SystemParametersRepositoryImpl()
//        self.systemParametersService = systemParametersService
//    }
    
//    private func initSongService(){
//        let songService = SongServiceImpl()
//        songService.repository = SongRepositoryImpl()
//        self.songService = songService
//    }

    init(){
        let navigator = NavigatorImpl(fabrika: self)
        self.navigator = navigator
        initDAL()
        navigator.showFirstViewController()
    }
    
    
    func mainScreenController() -> UIViewController{
        
        if let navc = storyboard.getViewController(type: .navigationController) as? UINavigationController{
            if navc.viewControllers.count > 0{
                if let mainViewController = navc.viewControllers[0] as? MainViewController{
                    mainViewController.navigator = navigator
                }
            }
            return navc
        }
        return UIViewController()
        
    }
}


