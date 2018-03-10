//
//  FFRequestHelper.swift
//  FGOFinder
//
//  Created by david on 2018/2/23.
//  Copyright © 2018年 okami3363. All rights reserved.
//

import UIKit
import Alamofire

class FFRequestHandler: NSObject {
    
    func getBoolValue(number: Int, completion: (_ result: Bool)->()) {
        if number > 5 {
            completion(true)
        } else {
            completion(false)
        }
    }
    
    func responseJSON(url: URLConvertible, completionHandler: @escaping (DataResponse<Any>) -> Void) -> Void {
        Alamofire.request(url).responseJSON { (dataResponse) in
            completionHandler(dataResponse)
        }
    }

}
