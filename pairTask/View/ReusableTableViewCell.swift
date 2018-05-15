//
//  ReusableTableViewCell.swift
//  pairTask
//
//  Created by Haydee Rodriguez on 5/14/18.
//  Copyright © 2018 Haydee Rodriguez. All rights reserved.
//

import UIKit
import AlamofireImage

class ReusableTableViewCell: UITableViewCell {

    @IBOutlet weak var leftImage: UIImageView!
    @IBOutlet weak var titlelabel: UILabel!
    @IBOutlet weak var headlinetitle: UILabel!
    @IBOutlet weak var datelabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func config(with movie: Movie){
        if let url = URL(string:movie.thumbnailImage) {
            leftImage.af_setImage(withURL: url)
        }
        titlelabel.text = movie.title
        headlinetitle.text = movie.headline
        datelabel.text = "Opening date: \(movie.releaseDate ?? "ND" )"
    }
    
}
