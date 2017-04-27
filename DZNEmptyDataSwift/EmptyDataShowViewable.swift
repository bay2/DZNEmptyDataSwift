//
//  EmptyDataShowViewable.swift
//  Examples
//
//  Created by xuemincai on 2016/11/27.
//  Copyright © 2016年 xuemincai. All rights reserved.
//

import UIKit

protocol EmptyDataShowViewable {
    
    
    var emptyDelegate: EmptyDelegate? {set get}
    
    var emptyDataSource: EmptyDataSource? {set get}
    
    var emptyCustomView: UIView? {set get}
    
    var emptyView: UIView? {set get}
    
    var itemsCount: Int {get}
    
    func canDisplay() -> Bool
    
    func invalidate()
    
    func addEmptyView()
    
    func showCustomView(_ view: UIView?) -> EmptyDataSetView?
    
    func swizzleReloadData()
    
    func swizzleEndUpdates()
    
    func emptyReloadData()
    
    func emptyEndUpdates()
    
    func reloadEmptyDataSet()
    
    
}

precedencegroup StepEmptyDataSetView {
    associativity: left
    higherThan: MultiplicationPrecedence
}

infix operator +>: StepEmptyDataSetView

func +> (left: EmptyDataSetView, right: ((EmptyDataSetView) -> EmptyDataSetView)) -> EmptyDataSetView {
    
    return right(left)
    
}


extension EmptyDataShowViewable where Self: UIScrollView {
    
    func emptyReloadData() {
        
        emptyEndUpdates()
        reloadEmptyDataSet()
        
    }
    
    func emptyEndUpdates() {
        
        emptyReloadData()
        reloadEmptyDataSet()
        
    }
    
    func configTitle(_ view: EmptyDataSetView) -> EmptyDataSetView {
        view.titleLable.attributedText = dzn_emptyDataSource?.title(emptyView: self)
        return view
    }
    
    func configDetail(_ view: EmptyDataSetView) -> EmptyDataSetView {
        view.detailLabel.attributedText = dzn_emptyDataSource?.description(emptyView: self)
        return view
    }
    
    func configImage(_ view: EmptyDataSetView) -> EmptyDataSetView {
        
        let imageTintColor = dzn_emptyDataSource?.imageTintColor(emptyView: self)
        let renderingMode = imageTintColor != nil ? UIImageRenderingMode.alwaysTemplate : UIImageRenderingMode.alwaysOriginal
        
        if let image = dzn_emptyDataSource?.image(emptyView: self)  {
            
            view.imageView.image = image.withRenderingMode(renderingMode)
            view.imageView.tintColor = imageTintColor
            
        }
        
        return view
        
    }
    
    func configButton(_ view: EmptyDataSetView) -> EmptyDataSetView {
        
        if let buttonImage = dzn_emptyDataSource?.buttonImage(emptyView: self, state: .normal) {
            
            view.button.setImage(buttonImage, for: .normal)
            view.button.setImage(dzn_emptyDataSource?.buttonImage(emptyView: self, state: .highlighted), for: .highlighted)
            
        }
        
        let buttonTitle = dzn_emptyDataSource?.buttonTitle(emptyView: self, state: .normal)
        
        view.button.setAttributedTitle(buttonTitle, for: .normal)
        view.button.setAttributedTitle(dzn_emptyDataSource?.buttonTitle(emptyView: self, state: .highlighted), for: .highlighted)
        view.button.setBackgroundImage(dzn_emptyDataSource?.buttonBackgroundImage(emptyView: self, forState: .normal), for: .normal)
        view.button.setBackgroundImage(dzn_emptyDataSource?.buttonBackgroundImage(emptyView: self, forState: .highlighted), for: .highlighted)
        
        return view
        
    }
    
    func configVerticalSpace(_ view: EmptyDataSetView) -> EmptyDataSetView {
        
        view.verticalSpace = dzn_emptyDataSource?.spaceHeight(emptyView: self) ?? 0
        
        return view
        
    }
    
    func configVerticalOffset(_ view: EmptyDataSetView) -> EmptyDataSetView {
        
        view.verticalOffset = dzn_emptyDataSource?.verticalOffset(emptyView: self) ?? 0
        
        return view
        
    }
    
    func configBackgroundColor(_ view: EmptyDataSetView) -> EmptyDataSetView {
        
        view.backgroundColor = dzn_emptyDataSource?.backgroundColor(emptyView: self)
        view.isHidden = false
        view.clipsToBounds = false
        
        return view
        
    }
    
    func configTouch(_ view: EmptyDataSetView) -> EmptyDataSetView {
        
        view.isUserInteractionEnabled = dzn_emptyDelegate?.shouldAllowTouch(emptyView: self) ?? true
        
        return view
        
    }
    
    func configFadeIn(_ view: EmptyDataSetView) -> EmptyDataSetView {
        view.fadeInOnDisplay = dzn_emptyDelegate?.shouldFadeIn(emptyView: self) ?? true
        return view
    }
    
    func configConstraints(_ view: EmptyDataSetView) -> EmptyDataSetView {
        
        view.setupConstraints()
        
        UIView.performWithoutAnimation {
            view.layoutIfNeeded()
        }
        
        return view
        
    }
    
    func configAnimation(_ view: EmptyDataSetView) -> EmptyDataSetView {
        
        if dzn_emptyDelegate?.shouldAnimateImageView(emptyView: self) ?? false {
            
            if let animation = dzn_emptyDataSource?.imageAnimation(emptyView: self) {
                view.imageView.layer.add(animation, forKey: kEmptyImageViewAnimationKey)
            }
            
        } else if let _ = emptyView?.imageView.layer.animation(forKey: kEmptyImageViewAnimationKey) {
            view.imageView.layer.removeAnimation(forKey: kEmptyImageViewAnimationKey)
        }
        
        return view
        
    }
    
    func reloadEmptyDataSet() {
        
        guard canDisplay() else {
            return
        }
        
        if (emptyDelegate?.shouldDisplay(emptyView: self) ?? true && itemsCount == 0) ||
            emptyDelegate?.shouldBeForcedToDisplay(emptyView: self) ?? false {
            
            emptyDelegate?.willAppear(emptyView: self)
            
            
            guard var view = emptyView else {
                return
            }
            
            if view.superview == nil {
                
                if self.subviews.count > 1 {
                    insertSubview(view, at: 0)
                } else {
                    addSubview(view)
                }
                
            }
            
            view.prepareForReuse()
            
            
            let customView = dzn_emptyDataSource?.customView(emptyView: self) ?? self.userCostomEmptyView
            
            // 视图布局
            view = (showCustomView(customView) ?? (view +> configTitle
                                                       +> configDetail
                                                       +> configImage
                                                       +> configButton
                                                       +> configVerticalSpace))
                    +> configVerticalOffset
                    +> configBackgroundColor
                    +> configTouch
                    +> configFadeIn
                    +> configConstraints
                    +> configAnimation
            
            
            isScrollEnabled = dzn_emptyDelegate?.shouldAllowScroll(emptyView: self) ?? true
            
            
            dzn_emptyDelegate?.didAppear(emptyView: self)
            
        } else if emptyView?.isHidden ?? false {
            dzn_invalidate()
        }
        
    }
    
    
    
}
