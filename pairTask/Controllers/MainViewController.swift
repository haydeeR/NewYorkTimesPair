//
//  ViewController.swift
//  pairTask
//
//  Created by Haydee Rodriguez on 5/14/18.
//  Copyright © 2018 Haydee Rodriguez. All rights reserved.
//

import UIKit
import PromiseKit

class MainViewController: UITableViewController {

    var movies: [Movie] = []    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        registerCells()
        getMoview()
    }
    
    func setupView(){
        navigationItem.title = "NYT Movies"
    }
    
    func registerCells() {
        let nib = UINib(nibName: ReusableTableViewCell.reusableId, bundle:  nil)
        tableView.register(nib, forCellReuseIdentifier: ReusableTableViewCell.reusableId)
    }

    func getMoview(){
        firstly {
            DataHandler.getMovies()
        }.done { movies in
            self.movies = movies
            self.tableView.reloadData()
        }.catch { error in
            print(error)
        }
    }
    
    // MARK -:  Datasource delegate
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (tableView.dequeueReusableCell(withIdentifier: ReusableTableViewCell.reusableId, for: indexPath) as? ReusableTableViewCell)!
        cell.config(with: movies[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedMovie = movies[indexPath.row]
        performSegue(withIdentifier: SeguesIdentifier.detailSegue.rawValue, sender: selectedMovie)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifierString = segue.identifier, let identifier = SeguesIdentifier(rawValue: identifierString) else {
            return
        }
        if identifier == SeguesIdentifier.detailSegue {
            guard let controller = segue.destination as? DetailTableViewController else {
                return
            }
            guard let movie = sender as? Movie else {
                return
            }
            controller.movie = movie
        }
    }
}

