//
//  UITableViewCell+ReusableId.swift
//  pairTask
//
//  Created by Haydee Rodriguez on 5/14/18.
//  Copyright © 2018 Haydee Rodriguez. All rights reserved.
//

import UIKit

extension UITableViewCell {
    static var reusableId: String {
        return String(describing: self)
    }
}

