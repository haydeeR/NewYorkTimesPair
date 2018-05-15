//
//  APIHandler.swift
//  pairTask
//
//  Created by Haydee Rodriguez on 5/14/18.
//  Copyright © 2018 Haydee Rodriguez. All rights reserved.
//

import Foundation
import Alamofire
import PromiseKit

struct APIHandler {
    
    static func getMovies() -> Promise<[String: Any]> {
        return Promise { seal in
            Alamofire.request(APIRouter.getMovies).responseJSON { (response) in
                switch response.result {
                case .success:
                    if let json = response.result.value as? [String: Any] {
                        seal.fulfill(json)
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                    seal.reject(error)
                }
            }
        }
    }
}
