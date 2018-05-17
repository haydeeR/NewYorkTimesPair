//
//  Parse.swift
//  pairTask
//
//  Created by Haydee Rodriguez on 5/14/18.
//  Copyright © 2018 Haydee Rodriguez. All rights reserved.
//

import Foundation
import ObjectMapper

struct ParseHandler {
    static func parseMovies(json: [String: Any]) -> [Movie]? {
        guard let movies = Mapper<MovieResponse>().map(JSON: json)?.movies else {
            return nil
        }
        return movies
    }
}
