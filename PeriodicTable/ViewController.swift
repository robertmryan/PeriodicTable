//
//  ViewController.swift
//  PeriodicTable
//
//  Created by Robert Ryan on 1/9/17.
//  Copyright © 2017 Robert Ryan. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController, ElementDataSource {
    
    var elements: [Element]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadElements()
        collectionView?.collectionViewLayout = PeriodicTableLayout()
    }
    
    private func loadElements() {
        let fileURL = Bundle.main.url(forResource: "Elements", withExtension: "json")!
        let data = try! Data(contentsOf: fileURL)
        let json = try! JSONSerialization.jsonObject(with: data) as! [[String: Any]]
        elements = json.map { Element(dictionary: $0) }
    }
}

extension ViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return elements?.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ElementCell", for: indexPath) as! ElementCell
        let element = elements![indexPath.row]
        cell.numberLabel.text = "\(element.number)"
        cell.symbolLabel.text = element.symbol
        return cell
    }
}
