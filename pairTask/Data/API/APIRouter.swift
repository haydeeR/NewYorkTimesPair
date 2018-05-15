//
//  APIRouter.swift
//  pairTask
//
//  Created by Haydee Rodriguez on 5/14/18.
//  Copyright © 2018 Haydee Rodriguez. All rights reserved.
//

import Foundation
import Alamofire

enum APIRouter : URLRequestConvertible {
    
    case getMovies
    
    var method: HTTPMethod {
        switch self {
        case .getMovies:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .getMovies:
            return "reviews/dvd-picks.json"
        }
    }
    
    var parameters: [String:Any]{
        switch self {
        case .getMovies:
            return ["api-key":APIManager.apiKey]
        }
    }
    // MARK: URLRequestConvertible
    
    func asURLRequest() throws -> URLRequest {
        let url = try APIManager.basicUrl.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        return try URLEncoding.methodDependent.encode(urlRequest, with: parameters)
    }
}
