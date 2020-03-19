//
//  ItemsViewController.swift
//  Example
//
//  Created by Ahmed M. Hassan on 3/19/20.
//  Copyright © 2020 Ahmed M. Hassan. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class ItemsViewController: UICollectionViewController {
  
  private let itemsCount = 10
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Register cell classes
    self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    self.collectionView.register(NRCollectionViewCell.self, forCellWithReuseIdentifier: "\(NRCollectionViewCell.self)")
    // Do any additional setup after loading the view.
  }
  
  // MARK: UICollectionViewDataSource
  
  override func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return itemsCount
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    if indexPath.row == itemsCount - 1 {
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(NRCollectionViewCell.self)", for: indexPath)
      return cell
      
    } else {
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
      let randomColor = UIColor(
        red: .random(in: 0...1),
        green: .random(in: 0...1),
        blue: .random(in: 0...1),
        alpha: 1.0
      )
      cell.backgroundColor = randomColor
      return cell
    }
  }
    
}

// MARK: UICollectionViewDelegateFlowLayout

extension ItemsViewController: UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    print(indexPath)
    let lenght = (collectionView.bounds.width - 10) / 2
    return CGSize(width: lenght, height: lenght)
  }
  
}
