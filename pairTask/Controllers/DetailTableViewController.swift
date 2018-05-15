//
//  DetailTableViewController.swift
//  pairTask
//
//  Created by Haydee Rodriguez on 5/14/18.
//  Copyright © 2018 Haydee Rodriguez. All rights reserved.
//

import UIKit

class DetailTableViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var movie: Movie?
    var urlArticle: URL?
    
    fileprivate enum tableRowType: Int {
        case image
        case title
        case headline
        case author
        case summary
        case releaseDate
        case webLinkFullArticle
        case webLinksRelated
    }
    
    fileprivate let rowAmount = 7
    fileprivate let textCellIdentifier = "Cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView(frame: .zero)
        navigationItem.title = movie?.title
        navigationItem.backBarButtonItem?.title = "NYT Movies"
    }

    private func registerCells() {
        let nib = UINib(nibName: ReusableImgTableViewCell.reusableId, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: ReusableImgTableViewCell.reusableId)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == SeguesIdentifier.webSegue.rawValue {
            let controller = (segue.destination as? WebViewController)!
            controller.articleURL = urlArticle
        }
    }
}

extension DetailTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case tableRowType.image.rawValue:
            return 270
        default:
            return UITableViewAutomaticDimension
        }
    }
}

extension DetailTableViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowAmount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case tableRowType.image.rawValue:
           let cell = tableView.dequeueReusableCell(withIdentifier: ReusableImgTableViewCell.reusableId, for: indexPath) as! ReusableImgTableViewCell
           cell.config(with: movie!)
            return cell
        default:
            return configDetailCell(type: indexPath.row)
        }
    }
    
    func configDetailCell(type: Int) -> UITableViewCell {
        var txt = ""
        let cell = UITableViewCell.init(style: .default, reuseIdentifier: textCellIdentifier)
        switch type {
        case tableRowType.title.rawValue:
            txt = movie?.title ?? ""
        case tableRowType.headline.rawValue:
            txt = movie?.headline ?? ""
        case tableRowType.author.rawValue:
            txt = movie?.author ?? ""
        case tableRowType.summary.rawValue:
            txt = movie?.summary ?? ""
        case tableRowType.releaseDate.rawValue:
            txt = "\(movie?.releaseDate ?? "ND" )"
        case tableRowType.webLinkFullArticle.rawValue:
            if let urlComplete = movie?.webLink {
                txt = "\(urlComplete)"
            }
        default:
            if let urlRelated = movie?.webLinksRelated {
                txt = "\(urlRelated)"
            }
        }
        cell.textLabel?.text = txt
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case tableRowType.webLinksRelated.rawValue:
            urlArticle = movie?.webLinksRelated
            performSegue(withIdentifier: SeguesIdentifier.webSegue.rawValue, sender: nil)
        case tableRowType.webLinkFullArticle.rawValue:
            urlArticle = movie?.webLink
            performSegue(withIdentifier: SeguesIdentifier.webSegue.rawValue, sender: nil)
        default:
            break
        }
    }
    
}

