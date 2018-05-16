//
//  MovieResponse.swift
//  pairTask
//
//  Created by Haydee Rodriguez on 5/14/18.
//  Copyright © 2018 Haydee Rodriguez. All rights reserved.
//

import Foundation
import ObjectMapper

struct  MovieResponse: Mappable {
    var movies: [Movie]?
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        movies <- map["results"]
    }
}
