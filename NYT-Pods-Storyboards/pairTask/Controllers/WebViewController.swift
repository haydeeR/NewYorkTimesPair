//
//  WebViewController.swift
//  pairTask
//
//  Created by Haydee Rodriguez on 5/14/18.
//  Copyright © 2018 Haydee Rodriguez. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    @IBOutlet weak var webViewUrl: WKWebView!
    var articleURL: URL?

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let url = articleURL else {
            return
        }
        let myRequest = URLRequest(url: url)
        webViewUrl.load(myRequest)
    }
}
