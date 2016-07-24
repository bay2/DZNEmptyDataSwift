//
//  UIView+DZNConstraintBasedLayoutExtensions.swift
//  Examples
//
//  Created by xuemincai on 16/7/5.
//  Copyright © 2016年 xuemincai. All rights reserved.
//

import UIKit

internal extension UIView {
    
    func equallyRelatedConstraintWithView(view: UIView, attribute: NSLayoutAttribute) -> NSLayoutConstraint {

        return NSLayoutConstraint(item: view, attribute: attribute, relatedBy: .equal, toItem: self, attribute: attribute, multiplier: 1.0, constant: 0)
        
    }
    
}
