//
//  HomeViewController.swift
//  Example
//
//  Created by Ahmed M. Hassan on 3/17/20.
//  Copyright © 2020 Ahmed M. Hassan. All rights reserved.
//

import UIKit

struct ExampleModel {
  let title: String
  let segueIdentifier: String
  
  static let allItems: [ExampleModel] = [
    ExampleModel(title: "Instance Example", segueIdentifier: "NormalViewControllerSegue"),
    ExampleModel(title: "Static Example", segueIdentifier: "ClassViewControllerSegue"),
  ]
}

class HomeViewController: UITableViewController {
  
  var list: [ExampleModel] = ExampleModel.allItems
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
    
}

// MARK: - TableView Callback Methods
extension HomeViewController {
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return list.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
    cell.textLabel?.text = list[indexPath.row].title
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let segueIdentifier = list[indexPath.row].segueIdentifier
    performSegue(withIdentifier: segueIdentifier, sender: self)
  }
  
}

// MARK: - Selectors
extension HomeViewController {
  
  
  
}
