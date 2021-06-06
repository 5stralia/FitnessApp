//
//  UICollectionViewLeftAlignedFlowLayout.swift
//  FitnessApp
//
//  Created by 최호주 on 2021/06/06.
//

import UIKit

final class UICollectionViewLeftAlignedFlowLayout: UICollectionViewFlowLayout {
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var newAttributesArray = [UICollectionViewLayoutAttributes]()
           let superAttributesArray = super.layoutAttributesForElements(in: rect)!
           for (index, attributes) in superAttributesArray.enumerated() {
               if index == 0 || superAttributesArray[index - 1].frame.origin.y != attributes.frame.origin.y {
                   attributes.frame.origin.x = sectionInset.left
               } else {
                   let previousAttributes = superAttributesArray[index - 1]
                   let previousFrameRight = previousAttributes.frame.origin.x + previousAttributes.frame.width
                   attributes.frame.origin.x = previousFrameRight + minimumInteritemSpacing
               }
               newAttributesArray.append(attributes)
           }
           return newAttributesArray
    }
}
