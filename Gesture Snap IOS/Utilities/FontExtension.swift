//
//  FontExtension.swift
//  Gesture Snap
//
//  Created by Admin on 29/10/25.
//

import UIKit

enum PoppinsStyle: String {
    case bold = "Bold"
    case medium = "Medium"
    case regular = "Regular"
    case semibold = "SemiBold"
}

extension UILabel {
    func applyPoppins(style: PoppinsStyle, size: CGFloat) {
        let fontName = "Poppins-\(style.rawValue)"
        if let customFont = UIFont(name: fontName, size: size.scaledFontSize) {
            self.font = customFont
        } else {
            print("Error: Could not find font named \(fontName)")
        }
    }
    
    func applyFugazone(size: CGFloat) {
        let fontName = "Fugazone-Regular"
        if let customFont = UIFont(name: fontName, size: size.scaledFontSize) {
            self.font = customFont
        } else {
            print("Error: Could not find font named \(fontName)")
        }
    }
}

extension CGFloat {
    // Sử dụng chung scaledWidth cho cả chiều rộng và kích thước chữ (SSP tương đương)
    var scaledWidth: CGFloat {
        let REFERENCE_WIDTH: CGFloat = 360.0
        let screenWidth = UIScreen.main.bounds.size.width
        return self * (screenWidth / REFERENCE_WIDTH)
    }
    
    // Đặt tên tường minh hơn cho kích thước chữ (SSP)
    var scaledFontSize: CGFloat {
        return self.scaledWidth
    }
}


