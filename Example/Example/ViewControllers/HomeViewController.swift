//
//  HomeViewController.swift
//  Example
//
//  Created by Ahmed M. Hassan on 3/17/20.
//  Copyright © 2020 Ahmed M. Hassan. All rights reserved.
//

import UIKit

struct VCModel {
  let title: String
  let identifier: String
  
  static let allItems: [VCModel] = [
    VCModel(title: "No Rides Avaiable (XIB)", identifier: "\(RideBookingViewController.self)"),
    VCModel(title: "Connection Error (Programatically)", identifier: "\(ConnectionErrorViewController.self)"),
    VCModel(title: "LinkedIn Post", identifier: "\(PostDetailsViewController.self)"),
    VCModel(title: "Items Selection", identifier: "\(ItemsViewController.self)"),
  ]
}

class HomeViewController: UITableViewController {
  
  var list: [VCModel] = VCModel.allItems
  
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
    let item = list[indexPath.row]
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let viewController = storyboard.instantiateViewController(withIdentifier: item.identifier)
    viewController.title = item.title
    navigationController?.pushViewController(viewController, animated: true)
  }
  
}

// MARK: - Selectors
extension HomeViewController {
  
  
  
}
