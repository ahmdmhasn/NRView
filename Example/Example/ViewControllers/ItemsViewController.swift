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
  
  private let itemsCount = 8
  private let spacing: CGFloat = 8
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Configure collection view
    collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    collectionView.register(NRCollectionViewCell.self, forCellWithReuseIdentifier: "\(NRCollectionViewCell.self)")
    collectionView.contentInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
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
      setRoundedCorners(for: cell)
      return cell
      
    } else {
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
      setRoundedCorners(for: cell)
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
  
  private func setRoundedCorners(for cell: UICollectionViewCell) {
    cell.layer.cornerRadius = 8
    cell.layer.masksToBounds = true
  }
    
}

// MARK: UICollectionViewDelegateFlowLayout

extension ItemsViewController: UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    print(indexPath)
    let lenght = (collectionView.bounds.width - spacing * 2 - 10) / 2
    return CGSize(width: lenght, height: lenght)
  }
  
}
