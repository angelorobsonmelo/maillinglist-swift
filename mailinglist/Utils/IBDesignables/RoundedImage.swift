//
//  RoundedImage.swift
//  mailinglist
//
//  Created by Stant 02 on 12/07/18.
//  Copyright © 2018 angelorobson. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedImageView: UIImageView {
    
    @IBInspectable var cornerRadius: CGFloat = 2.0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        didSet {
            layer.borderColor = borderColor?.cgColor
        }
    }
    
    func resetBorderColor() {
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 0.5
    }
    
    func highlightBorderColor() {
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 1.0
    }
    
    func defaultRadius() {
        layer.cornerRadius = self.frame.height/2
    }
}
