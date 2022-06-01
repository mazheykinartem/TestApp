//
//  Network.swift
//  Testing
//
//  Created by  Artem Mazheykin on 29.05.2022.
//

import Foundation
import Alamofire
import Kingfisher
import PromiseKit

class NetworkImpl: Network{
    
    func getDataRequest (from urlString: String) -> Promise<AFDataResponse<Data?>>{

        return Promise<AFDataResponse<Data?>> { seal in
            let _ = AF.request(urlString).response { response in
                seal.fulfill(response)
    //            debugPrint(response)
            }
        }
    }
}
