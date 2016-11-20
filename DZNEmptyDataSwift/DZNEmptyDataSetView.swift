//
//  DZNEmptyDataSetView.swift
//  DZNEmptyDataSwift
//
//  Created by xuemincai on 16/6/26.
//  Copyright © 2016年 xuemincai. All rights reserved.
//

import UIKit

internal class DZNEmptyDataSetView: UIView {
    
    //MARK: - 属性
    var verticalOffset: CGFloat = 0
    var verticalSpace: CGFloat = 0
    var fadeInOnDisplay: Bool = true
    var tapGesture: UITapGestureRecognizer?

    lazy var contentView: UIView = {

        
        let newView = UIView()
        newView.translatesAutoresizingMaskIntoConstraints = false
        newView.backgroundColor = UIColor.clear
        newView.isUserInteractionEnabled = true
        newView.alpha = 0
        
        return newView
     
    }()
    
    var customView: UIView? {
        
        willSet(view) {
            
            guard let _ = view else {
                return
            }
            
            self.customView?.removeFromSuperview()
            
            
            
            
        }
        
        didSet (view) {
            
            if let newView = self.customView {
                
                newView.translatesAutoresizingMaskIntoConstraints = false
                
                self.contentView.addSubview(newView)
                
            }
            
            
            
        }
        
    }
    
    lazy var imageView: UIImageView = {
        
        let newImageView = UIImageView()
       
        newImageView.translatesAutoresizingMaskIntoConstraints = false
        newImageView.backgroundColor = UIColor.clear
        newImageView.contentMode = .scaleAspectFit
        newImageView.isUserInteractionEnabled = false
        newImageView.accessibilityIdentifier = "empty set background image"
        
        self.contentView.addSubview(newImageView)
        
        return newImageView
    }()
    
    lazy var titleLable: UILabel = {
        
        let newLable = UILabel()
        newLable.translatesAutoresizingMaskIntoConstraints = false
        
        newLable.font = UIFont.systemFont(ofSize: 27)
        newLable.textColor = UIColor(white: 0.6, alpha: 1.0)
        newLable.textAlignment = .center
        newLable.lineBreakMode = .byWordWrapping
        newLable.numberOfLines = 0
        newLable.accessibilityIdentifier = "empty set title";
        self.contentView.addSubview(newLable)
        
        return newLable
        
    }()
    
    lazy var detailLabel: UILabel = {
        
        let newLabel = UILabel()
        newLabel.translatesAutoresizingMaskIntoConstraints = false
        newLabel.font = UIFont.systemFont(ofSize: 27)
        
        newLabel.textColor = UIColor(white: 0.6, alpha: 1)
        newLabel.textAlignment = .center
        newLabel.lineBreakMode = .byWordWrapping
        newLabel.numberOfLines = 0
        newLabel.accessibilityIdentifier = "empty set title"
        self.contentView.addSubview(newLabel)
        
        return newLabel
        
    }();
    
    lazy var button: UIButton = {
        
        let newButton = UIButton(type: .custom)
        
        newButton.translatesAutoresizingMaskIntoConstraints = false
        newButton.contentHorizontalAlignment = .center
        newButton.contentVerticalAlignment = .center
        newButton.accessibilityIdentifier = "empty set button"
        
        newButton.addTarget(self, action: #selector(DZNEmptyDataSetView.didTapButton), for: .touchUpInside)
        self.contentView.addSubview(newButton)
        
        return newButton

    }()
    
    
    
    override init(frame: CGRect = CGRect.zero) {
        super.init(frame: frame)
        
        self.addSubview(contentView)
        
    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func didMoveToSuperview() {
        
        frame = superview?.bounds ?? CGRect.zero
        
        if fadeInOnDisplay {
            
            UIView.animate(withDuration: 0.25, animations: {
                self.contentView.alpha = 1
                }, completion: nil)
            
        } else {
            contentView.alpha = 1
        }
        
    }
    
    func prepareForReuse() {
        
        _ = contentView.subviews.map {
            $0.removeFromSuperview()
        }
        
        removeAllConstraints()
        
    }
    
    
    //MARK: - Action Methods
    
    func didTapButton(_ button: UIButton) {
        
        let selector = #selector(UIScrollView.dzn_didTapDataButton)
        
        guard let _ = superview?.responds(to: selector) else {
            return
        }
        
        superview?.perform(selector, with: button, afterDelay: 0)
        
    }
    
    //MARK: - 初始化
    
    /**
     设置约束
    */
    func setupConstraints() {
        
        let centerXConstraint = equallyRelatedConstraintWithView(contentView, attribute: .centerX);
        let centerYConstraint = equallyRelatedConstraintWithView(contentView, attribute: .centerY);
        
        addConstraint(centerXConstraint)
        addConstraint(centerYConstraint)
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[contentView]|", options: NSLayoutFormatOptions(rawValue: UInt(0)), metrics: nil, views: ["contentView": self.contentView]))
        
        if verticalOffset != 0 && constraints.count > 0 {
            centerYConstraint.constant = verticalOffset
        }
        
        if let newCustomView = customView {
            
            self.contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[customView]|", options: NSLayoutFormatOptions(rawValue: UInt(0)), metrics: nil, views: ["customView": newCustomView]))
            self.contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[customView]|", options: NSLayoutFormatOptions(rawValue: UInt(0)), metrics: nil, views: ["customView": newCustomView]))
            
        } else {
            
            let width = frame.width != 0 ? frame.width : UIScreen.main.bounds.width
            let padding = roundf(Float(width)/16)
            let verticalSpace = self.verticalSpace != 0 ? self.verticalSpace : 11.0
            
            var subviewStrings: Array<String> = []
            var views: Dictionary<String, UIView> = [:]
            let metrics = ["padding": padding]
            
            if let _ = imageView.superview {
                
                subviewStrings.append("imageView")
                views["imageView"] = imageView
                
                contentView.addConstraint(contentView.equallyRelatedConstraintWithView(imageView, attribute: .centerX))
                
            }
            
            if canShowTitle() {
                
                subviewStrings.append("titleLabel")
                views["titleLabel"] = titleLable
                
                contentView.addConstraints(NSLayoutConstraint .constraints(withVisualFormat: "H:|-(padding@750)-[titleLabel(>=0)]-(padding@750)-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics, views: views))
                
            } else {
                titleLable.removeFromSuperview()
            }
            
            if canShowDetail() {
                
                subviewStrings.append("detailLabel")
                views["detailLabel"] = detailLabel;
                
                contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(padding@750)-[detailLabel(>=0)]-(padding@750)-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics, views: views))
                
            } else {
                detailLabel.removeFromSuperview()
            }
            
            if (canShowButton()) {
                
                subviewStrings.append("button");
                views["button"] = button
                
                contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(padding@750)-[button(>=0)]-(padding@750)-|", options: NSLayoutFormatOptions(rawValue: UInt(0)), metrics: metrics, views: views))
                
            } else {
                button.removeFromSuperview()
            }
            
            var verticalFormat = ""
            
            for value in subviewStrings {
                
                verticalFormat += "[\(value)]"
                
                if (value != subviewStrings.last) {
                    verticalFormat += "-(\(verticalSpace)@750)-"
                }
                
                
            }
            
            if verticalFormat.lengthOfBytes(using: .ascii) > 0 {
                contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|\(verticalFormat)|", options: NSLayoutFormatOptions(rawValue: UInt(0)), metrics: metrics, views: views))
            }
        }
        
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        
        guard let hitView = super.hitTest(point, with: event) else {
            return nil
        }
        
        if hitView.isKind(of: UIControl.classForCoder()) {
            return hitView
        }
        
        if hitView.isEqual(contentView) || hitView.isEqual(customView) {
            return hitView
        }
        
        return nil
        
    }
    
    /**
     删除所有的约束
     */
    func removeAllConstraints() {
        
        removeConstraints(constraints)
        contentView.removeConstraints(contentView.constraints)
        
    }
    
    /**
     可以显示标题
     */
    func canShowTitle() -> Bool {
        return (titleLable.attributedText?.length ?? 0 > 0 && titleLable.superview != nil)
    }
    
    /**
     可以显示副标题
     */
    func canShowDetail() -> Bool {
        return (detailLabel.attributedText?.length ?? 0 > 0 && detailLabel.superview != nil)
    }
    
    
    /**
     可以显示按钮
    */
    func canShowButton() -> Bool {
        
        if button.attributedTitle(for: .normal)?.string.lengthOfBytes(using: .unicode) ?? 0 > 0 ||
        button.image(for: .normal) != nil {
            return (button.superview != nil)
        }
        
        return false
    }

}
