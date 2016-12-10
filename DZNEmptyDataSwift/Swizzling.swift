//
//  Swizzling.swift
//  DZNEmptyDataSwift
//
//  Created by xuemincai on 16/6/24.
//  Copyright © 2016年 xuemincai. All rights reserved.
//

import UIKit

internal let DZNSwizzleInfoOwnerKey    = "owner"
internal let DZNSwizzleInfoSelectorKey = "selector"
internal let DZNSwizzleInfoPointerKey  = "pointer"

internal let kEmptyImageViewAnimationKey = "com.dzn.emptyDataSet.imageViewAnimation"


internal struct Static {
    static var isSwizzleEndUpdates = false
    static var isSwizzleReloadData = false
}

internal extension UIScrollView {
    
    func swizzleReloadData() {
        
        if Static.isSwizzleReloadData {
            return
        }
        
        
        if self is UITableView {
            swizzleMethod(#selector(UITableView.reloadData), swizzledSelector: #selector(UIScrollView.dzn_reloadData))
        }
        
        if self is UICollectionView {
            swizzleMethod(#selector(UICollectionView.reloadData), swizzledSelector: #selector(UIScrollView.dzn_reloadData))
        }
        
        Static.isSwizzleReloadData = true
        
    }
    
    func swizzleEndUpdates() {
        
        if Static.isSwizzleEndUpdates {
            return
        }
        
        if self is UITableView {
            
            swizzleMethod(#selector(UITableView.endUpdates), swizzledSelector: #selector(UIScrollView.dzn_endUpdates))
            
            Static.isSwizzleEndUpdates = true
            
        }
        
        
    }
    
    func swizzleMethod(_ originalSelector: Selector, swizzledSelector: Selector) {
        
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
        
        dzn_reloadData()
        dzn_reloadEmptyDataSet()
        
    }
    
    func dzn_endUpdates() {
        
        dzn_endUpdates()
        dzn_reloadEmptyDataSet()
        
    }
    

    func dzn_reloadEmptyDataSet() {
        
        guard dzn_canDisplay() else {
            return
        }
        
        if (dzn_emptyDelegate?.shouldDisplay(emptyView: self) ?? true && dzn_itemsCount == 0) ||
            dzn_emptyDelegate?.shouldBeForcedToDisplay(emptyView: self) ?? false {
            
            dzn_emptyDelegate?.willAppear(emptyView: self)
            
            guard let view = emptyView else {
                return
            }
            
            if view.superview == nil {
                
                if (self is UITableView || self is UICollectionView) && self.subviews.count > 1 {
                    insertSubview(view, at: 0)
                } else {
                    addSubview(view)
                }
            }
            
            view.prepareForReuse()
            
            let customView = dzn_emptyDataSource?.customView(emptyView: self) ?? self.userCostomEmptyView
            
            if let customView = customView {
                
                view.customView = customView
                
                view.setupConstraints()
                
            } else {
                
                view.titleLable.attributedText = dzn_emptyDataSource?.title(emptyView: self)
                view.detailLabel.attributedText = dzn_emptyDataSource?.description(emptyView: self)
                
                if let buttonImage = dzn_emptyDataSource?.buttonImage(emptyView: self, state: .normal) {
                    
                    view.button.setImage(buttonImage, for: .normal)
                    view.button.setImage(dzn_emptyDataSource?.buttonImage(emptyView: self, state: .highlighted), for: .highlighted)
                    
                }
                
                let imageTintColor = dzn_emptyDataSource?.imageTintColor(emptyView: self)
                let renderingMode = imageTintColor != nil ? UIImageRenderingMode.alwaysTemplate : UIImageRenderingMode.alwaysOriginal
                view.verticalSpace = dzn_emptyDataSource?.spaceHeight(emptyView: self) ?? 0
                
                if let image = dzn_emptyDataSource?.image(emptyView: self)  {
                    
                    view.imageView.image = image.withRenderingMode(renderingMode)
                    view.imageView.tintColor = imageTintColor
                    
                }
                
                let buttonTitle = dzn_emptyDataSource?.buttonTitle(emptyView: self, state: .normal)
                
                view.button.setAttributedTitle(buttonTitle, for: .normal)
                view.button.setAttributedTitle(dzn_emptyDataSource?.buttonTitle(emptyView: self, state: .highlighted), for: .highlighted)
                view.button.setBackgroundImage(dzn_emptyDataSource?.buttonBackgroundImage(emptyView: self, forState: .normal), for: .normal)
                view.button.setBackgroundImage(dzn_emptyDataSource?.buttonBackgroundImage(emptyView: self, forState: .highlighted), for: .highlighted)
                
                
                
                
            }
            
            view.verticalOffset = dzn_emptyDataSource?.verticalOffset(emptyView: self) ?? 0
            
            view.backgroundColor = dzn_emptyDataSource?.backgroundColor(emptyView: self)
            view.isHidden = false
            view.clipsToBounds = false
            
            // 配置可被点击
            view.isUserInteractionEnabled = dzn_emptyDelegate?.shouldAllowTouch(emptyView: self) ?? true
            
            view.fadeInOnDisplay = dzn_emptyDelegate?.shouldFadeIn(emptyView: self) ?? true
            
            view.setupConstraints()
            
            UIView.performWithoutAnimation {
                view.layoutIfNeeded()
            }
            
            isScrollEnabled = dzn_emptyDelegate?.shouldAllowScroll(emptyView: self) ?? true
            
            if dzn_emptyDelegate?.shouldAnimateImageView(emptyView: self) ?? false {
                
                if let animation = dzn_emptyDataSource?.imageAnimation(emptyView: self) {
                    emptyView?.imageView.layer.add(animation, forKey: kEmptyImageViewAnimationKey)
                }
                
            } else if let _ = emptyView?.imageView.layer.animation(forKey: kEmptyImageViewAnimationKey) {
                emptyView?.imageView.layer.removeAnimation(forKey: kEmptyImageViewAnimationKey)
            }
            
            
            dzn_emptyDelegate?.didAppear(emptyView: self)
            
        } else if emptyView?.isHidden ?? false {
            dzn_invalidate()
        }
        
    }
    

   
}


