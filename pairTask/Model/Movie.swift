//
//  Movie.swift
//  pairTask
//
//  Created by Haydee Rodriguez on 5/14/18.
//  Copyright © 2018 Haydee Rodriguez. All rights reserved.
//

import Foundation
import ObjectMapper

struct Movie: Mappable {
   
    var title: String
    var thumbnailImage: String
    var headline: String
    var author: String
    var summary: String
    var releaseDate: String?
    var webLink: URL?
    var webLinksRelated: URL?
    
    init?(map: Map) {
         title = ""
         thumbnailImage = ""
         headline = ""
         author = ""
         summary = ""
    }
    
    mutating func mapping(map: Map) {
        title           <- map["display_title"]
        thumbnailImage  <- map["multimedia.src"]
        headline        <- map["headline"]
        author          <- map["byline"]
        summary         <- map["summary_short"]
        releaseDate     <- map["opening_date"]
        webLink         <- (map["link.url"], URLTransform())
        webLinksRelated <- (map["multimedia.src"], URLTransform())
    }
    
    
}
