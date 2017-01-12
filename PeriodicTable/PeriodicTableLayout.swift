//
//  PeriodicTableLayout.swift
//  PeriodicTable
//
//  Created by Robert Ryan on 1/9/17.
//  Copyright © 2017 Robert Ryan. All rights reserved.
//

import UIKit

protocol ElementDataSource {
    var elements: [Element]? { get }
}

class PeriodicTableLayout: UICollectionViewLayout {
    let rows = 9
    let columns = 18
    var size: CGSize!
    let spacing: CGFloat = 2
    let fBlockAdditionalSpacing: CGFloat = 5
    
    let fitTableToCollectionView = true  // if you want it to fit, set to `true`; if you want fixed cell sizes and let you scroll, set to `false`
    
    override func prepare() {
        if fitTableToCollectionView {
            let bounds = collectionView!.bounds
            let inset = collectionView!.contentInset
            size = CGSize(width: (bounds.size.width - inset.left - inset.right - CGFloat(columns + 1) * spacing) / CGFloat(columns),
                          height: (bounds.size.height - inset.top - inset.bottom - CGFloat(rows + 1) * spacing - fBlockAdditionalSpacing) / CGFloat(rows))
        } else {
            size = CGSize(width: 50, height: 50)
        }
    }
    
    // The size of the overall periodic table. This consists of 18 columns (one associated with each
    // group) and 9 rows (the 7 "periods", plus two more for the f-block lanthanides and actinides).
    
    override var collectionViewContentSize: CGSize {
        return CGSize(width: CGFloat(columns + 1) * spacing + CGFloat(columns) * size.width,
                      height: CGFloat(rows + 1) * spacing + CGFloat(rows) * size.height)
    }
    
    // For a particular `IndexPath`, this returns the `size` and `center` of the `Element` in
    // question in the collection view.
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        let element = elementAt(indexPath.row)
        let rect = rectFor(element)
        
        let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
        attributes.size = size
        attributes.center = CGPoint(x: rect.midX, y: rect.midY)
        
        return attributes
    }
    
    // This
    //    1. gets the array of elements
    //    2. identifies which intersect with the `CGRect` in question
    //    3. determines the `IndexPath` associated with those filtered `Element` objects
    //    4. Calls the `layoutAttributesForItem` for each of those `IndexPath` references.
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return (collectionView?.dataSource as! ElementDataSource).elements!
            .filter { rect.intersects(self.rectFor($0)) }
            .map { IndexPath(item: $0.atomicNumber - 1, section: 0) }
            .map { self.layoutAttributesForItem(at: $0)! }
    }
}

extension PeriodicTableLayout {
    
    /// Element associated particular collection view item number.
    ///
    /// - Parameter index: The item number of the collection view cell.
    /// - Returns: The `Element` associated with that cell.
    
    fileprivate func elementAt(_ index: Int) -> Element {
        return (collectionView?.dataSource as! ElementDataSource).elements![index]
    }
    
    /// The `CGRect` associated with a particular element.
    ///
    /// The `Element` has zero-based `row` and `column` numbers that indicate where in the
    /// periodic table the element should appear. This translates that to `CGRect` value.
    ///
    /// - Parameter element: The `Element`.
    /// - Returns: The `CGRect` associated with that `Element`.
    
    fileprivate func rectFor(_ element: Element) -> CGRect {
        let row = element.row
        let column = element.column
        
        let x = CGFloat(column + 1) * spacing + CGFloat(column) * size.width
        
        var y = CGFloat(row + 1) * spacing + CGFloat(row) * size.height
        y += row > 6 ? fBlockAdditionalSpacing : 0.0
        
        let origin = CGPoint(x: x, y: y)
        
        return CGRect(origin: origin, size: size)
    }
}
