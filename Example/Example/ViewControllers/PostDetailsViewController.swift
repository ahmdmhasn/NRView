//
//  PostDetailsViewController.swift
//  Example
//
//  Created by Ahmed M. Hassan on 3/19/20.
//  Copyright © 2020 Ahmed M. Hassan. All rights reserved.
//

import UIKit

class PostDetailsViewController: UITableViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Configure TableView
    tableView.register(NRTableViewCell.self, forCellReuseIdentifier: "\(NRTableViewCell.self)")
  }
    
  // MARK: - Table view data source
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    // return the number of sections
    return 2
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // return the number of rows
    return 1
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    switch indexPath.section {
    case 0:
      let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
      return cell

    case 1:
      let cell = tableView.dequeueReusableCell(withIdentifier: "\(NRTableViewCell.self)") as! NRTableViewCell
      
      return cell
      
    default:
      return UITableViewCell()
    }
    
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    switch indexPath.section {
    case 0:
      // Size of the mock image, as an example only...
      return tableView.bounds.width * 955 / 745
    default:
      return UITableView.automaticDimension
    }
  }
  
}
