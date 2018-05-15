//
//  Handler.swift
//  pairTask
//
//  Created by Haydee Rodriguez on 5/14/18.
//  Copyright © 2018 Haydee Rodriguez. All rights reserved.
//

import Foundation
import PromiseKit

struct DataHandler {
    static func getMovies()-> Promise<[Movie]> {
        return APIHandler.getMovies().map({ (moviesResponse) -> [Movie] in
            return ParseHandler.parseMovies(json: moviesResponse)!
        })
    }
}
