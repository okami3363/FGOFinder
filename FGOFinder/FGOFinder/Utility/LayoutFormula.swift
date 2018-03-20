//
//  LayoutFormula.swift
//  FGOFinder
//
//  Created by david on 2018/2/22.
//  Copyright © 2018年 okami3363. All rights reserved.
//

import UIKit

class LayoutFormula: NSObject {
    
    func servantPhotoSize() -> CGSize {
        let scale = CGFloat(512.0/724.0)
        let height = CGFloat(UIScreen.main.bounds.size.height)
        let width = CGFloat(height)*CGFloat(scale)
        
        return CGSize (width: Int(width), height: Int(height))
    }
    
    func sizeOfStringAndFont(string: String, font: UIFont) -> CGSize {
        return string.size(withAttributes: [NSAttributedStringKey.font: font])
    }
    
    func landscapeAdditionalSafeAreaInsets() -> UIEdgeInsets {
        var insets: UIEdgeInsets!
        if UIDevice().userInterfaceIdiom == .phone {
            switch UIScreen.main.nativeBounds.height {
            case 2436:
                insets = UIEdgeInsetsMake(0, 44, 21, 44)
            default:
                insets = UIEdgeInsetsMake(0, 0, 0, 0)
            }
        }
        return insets
    }
    
    func materialCellWidth() -> Int {
        let insets = landscapeAdditionalSafeAreaInsets()
        let photoSize = servantPhotoSize()
        return Int(UIScreen.main.bounds.size.width-insets.left-insets.right-photoSize.width)
    }
}
