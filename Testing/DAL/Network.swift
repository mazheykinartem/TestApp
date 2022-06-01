//
//  Network.swift
//  Testing
//
//  Created by  Artem Mazheykin on 29.05.2022.
//

import Foundation
import Alamofire
import PromiseKit

protocol Network: AnyObject{
    func getDataRequest (from urlString: String) -> Promise<AFDataResponse<Data?>>
}
