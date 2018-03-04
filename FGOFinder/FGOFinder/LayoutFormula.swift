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

}
