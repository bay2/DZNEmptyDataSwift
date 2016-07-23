//
//  Swizzling.swift
//  DZNEmptyDataSwift
//
//  Created by xuemincai on 16/6/24.
//  Copyright © 2016年 xuemincai. All rights reserved.
//

import UIKit

let DZNSwizzleInfoOwnerKey    = "owner"
let DZNSwizzleInfoSelectorKey = "selector"
let DZNSwizzleInfoPointerKey  = "pointer"


let kEmptyImageViewAnimationKey = "com.dzn.emptyDataSet.imageViewAnimation"


struct Static {
    static var isSwizzleEndUpdates = false
    static var isSwizzleReloadData = false
}

extension UIScrollView {
    
    
    
    func swizzleReloadData() {
        
        if Static.isSwizzleReloadData {
            return
        }
        
        
        if self.isKind(of: UITableView.classForCoder()) {
            swizzleMethod(originalSelector: #selector(UITableView.reloadData), swizzledSelector: #selector(UIScrollView.dzn_reloadData))
        }
        
        if self.isKind(of: UICollectionView.classForCoder()) {
            swizzleMethod(originalSelector: #selector(UICollectionView.reloadData), swizzledSelector: #selector(UIScrollView.dzn_reloadData))
        }
        
        Static.isSwizzleReloadData = true
        
    }
    
    func swizzleEndUpdates() {
        
        if Static.isSwizzleEndUpdates {
            return
        }
        
        guard self.isKind(of: UITableView.classForCoder()) else {
            return
        }
        
        swizzleMethod(originalSelector: #selector(UITableView.endUpdates), swizzledSelector: #selector(UIScrollView.dzn_endUpdates))
        
        Static.isSwizzleEndUpdates = true
        
        
    }
    
    func swizzleMethod(originalSelector: Selector, swizzledSelector: Selector) {
        
        let originalMethod = class_getInstanceMethod(self.classForCoder, originalSelector)
        let swizzledMethod = class_getInstanceMethod(self.classForCoder, swizzledSelector)
        
        let didAddMethod = class_addMethod(self.classForCoder, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod))
        
        
        if didAddMethod {
            class_replaceMethod(self.classForCoder, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod))
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
        
    }
    
    func dzn_reloadData() {
        
        self.dzn_reloadData()
        self.dzn_reloadEmptyDataSet()
        
    }
    
    func dzn_endUpdates() {
        
        self.dzn_endUpdates()
        self.dzn_reloadEmptyDataSet()
        
    }
    
    func reloadEmptyDataSet() {
        
        self.dzn_reloadEmptyDataSet()
        
    }
    

    func dzn_reloadEmptyDataSet() {
        
        guard self.dzn_canDisplay() else {
            return
        }
        
        if (self.dzn_emptyDelegate?.shouldDisplay?(emptyView: self) ?? true && self.dzn_itemsCount == 0) ||
            self.dzn_emptyDelegate?.shouldBeForcedToDisplay?(emptyView: self) ?? false {
            
            self.dzn_emptyDelegate?.willAppear?(emptyView: self)
            
            guard let view = self.emptyView else {
                return
            }
            
            if view.superview == nil {
                
                if (self.isKind(of: UITableView.classForCoder()) || self.isKind(of: UICollectionView.classForCoder())) && self.subviews.count > 1 {
                    self.insertSubview(view, at: 0)
                } else {
                    self.addSubview(view)
                }
            }
            
            view.prepareForReuse();
            
            if let customView = self.dzn_emptyDataSource?.customView?(emptyView: self) {
                
                view.customView = customView
                
            } else {
                
                view.titleLable.attributedText = self.dzn_emptyDataSource?.title?(emptyView: self)
                view.detailLabel.attributedText = self.dzn_emptyDataSource?.description?(emptyView: self)
                
                if let buttonImage = self.dzn_emptyDataSource?.buttonImage?(emptyView: self, state: UIControlState()) {
                    
                    view.button.setImage(buttonImage)
                    view.button.setImage(self.dzn_emptyDataSource?.buttonImage?(emptyView: self, state: .highlighted), for: .highlighted)
                    
                }
                
                let imageTintColor = self.dzn_emptyDataSource?.imageTintColor?(emptyView: self)
                let renderingMode = imageTintColor != nil ? UIImageRenderingMode.alwaysTemplate : UIImageRenderingMode.alwaysOriginal
                view.verticalSpace = self.dzn_emptyDataSource?.spaceHeight?(emptyView: self) ?? 0
                
                
                if let image = self.dzn_emptyDataSource?.image?(emptyView: self) {
                    
                    view.imageView.image = image.withRenderingMode(renderingMode)
                    view.imageView.tintColor = imageTintColor
                    
                }
                
                let buttonTitle = self.dzn_emptyDataSource?.buttonTitle?(emptyView: self, state: .normal)
                
                view.button.setAttributedTitle(buttonTitle, for: .normal)
                view.button.setAttributedTitle(self.dzn_emptyDataSource?.buttonTitle?(emptyView: self, state: .highlighted), for: .highlighted)
                view.button.setBackgroundImage(self.dzn_emptyDataSource?.buttonBackgroundImage?(emptyView: self, forState: .normal), for: .normal)
                view.button.setBackgroundImage(self.dzn_emptyDataSource?.buttonBackgroundImage?(emptyView: self, forState: .highlighted), for: .highlighted)
                
                
                view.verticalOffset = self.dzn_emptyDataSource?.verticalOffset?(emptyView: self) ?? 0
                
                view.backgroundColor = self.dzn_emptyDataSource?.backgroundColor?(emptyView: self)
                view.isHidden = false
                view.clipsToBounds = false
                
                // 配置可被点击
                view.isUserInteractionEnabled = self.dzn_emptyDelegate?.shouldAllowTouch?(emptyView: self) ?? true
                
                view.fadeInOnDisplay = self.dzn_emptyDelegate?.shouldFadeIn?(emptyView: self) ?? true
                
                view.setupConstraints()
                
                UIView.performWithoutAnimation {
                    view.layoutIfNeeded()
                }
                
                self.isScrollEnabled = self.dzn_emptyDelegate?.shouldAllowScroll?(emptyView: self) ?? true
                
                if self.dzn_emptyDelegate?.shouldAnimateImageView?(emptyView: self) ?? false {
                    
                    if let animation = self.dzn_emptyDataSource?.imageAnimation?(emptyView: self) {
                        self.emptyView?.imageView.layer.add(animation, forKey: kEmptyImageViewAnimationKey)
                    }
                    
                } else if let _ = self.emptyView?.imageView.layer.animation(forKey: kEmptyImageViewAnimationKey) {
                    self.emptyView?.imageView.layer.removeAnimation(forKey: kEmptyImageViewAnimationKey)
                }
                
                
                self.dzn_emptyDelegate?.didAppear?(emptyView: self)
                
            }
            
        } else if self.emptyView?.isHidden ?? false {
            self.dzn_invalidate()
        }
        
    }
    

   
}


