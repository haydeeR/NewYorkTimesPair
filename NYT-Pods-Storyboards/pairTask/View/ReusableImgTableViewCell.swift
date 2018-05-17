//
//  ReusableImgTableViewCell.swift
//  pairTask
//
//  Created by Haydee Rodriguez on 5/14/18.
//  Copyright © 2018 Haydee Rodriguez. All rights reserved.
//

import UIKit
import AlamofireImage

class ReusableImgTableViewCell: UITableViewCell {

    @IBOutlet weak var imageTop: UIImageView!
    func config(with movie: Movie) {
        if let url = URL(string:movie.thumbnailImage) {
            imageTop.af_setImage(withURL: url)
        }
    }
    
    
}
