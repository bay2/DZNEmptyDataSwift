//
//  EmptyDataSetView.swift
//  Examples
//
//  Created by xuemincai on 2016/11/27.
//  Copyright © 2016年 xuemincai. All rights reserved.
//

import UIKit

class EmptyDataSetView: UIView {

    //MARK: - 属性
    var verticalOffset: CGFloat = 0
    var verticalSpace: CGFloat = 0
    var fadeInOnDisplay: Bool = true
    var tapGesture: UITapGestureRecognizer?
    
    
    lazy var contentView: UIView = UIView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = UIColor.clear
        $0.isUserInteractionEnabled = true
        $0.alpha = 0
    }
    
    var customView: UIView? {
        
        willSet {
            
            self.customView?.removeFromSuperview()
            
        }
        
        didSet {
            
            if let newView = self.customView {
                newView.translatesAutoresizingMaskIntoConstraints = false
                self.contentView.addSubview(newView)
            }
            
        }
        
    }
    
    lazy var imageView: UIImageView = UIImageView().then {
        
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = UIColor.clear
        $0.contentMode = .scaleAspectFit
        $0.isUserInteractionEnabled = false
        $0.accessibilityIdentifier = "empty set background image"
        self.contentView.addSubview($0)
       
    }
    
    lazy var titleLable: UILabel = UILabel().then {
        
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = UIFont.systemFont(ofSize: 27)
        $0.textColor = UIColor(white: 0.6, alpha: 1.0)
        $0.textAlignment = .center
        $0.lineBreakMode = .byWordWrapping
        $0.numberOfLines = 0
        $0.accessibilityIdentifier = "empty set title";
        self.contentView.addSubview($0)
        
    }
    
    lazy var detailLabel: UILabel = UILabel().then {
        
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = UIFont.systemFont(ofSize: 27)
        
        $0.textColor = UIColor(white: 0.6, alpha: 1)
        $0.textAlignment = .center
        $0.lineBreakMode = .byWordWrapping
        $0.numberOfLines = 0
        $0.accessibilityIdentifier = "empty set title"
        self.contentView.addSubview($0)
        
    }
    
    lazy var button: UIButton = UIButton(type: .custom).then {
        
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentHorizontalAlignment = .center
        $0.contentVerticalAlignment = .center
        $0.accessibilityIdentifier = "empty set button"
        
        $0.addTarget(self, action: #selector(EmptyDataSetView.didTapButton), for: .touchUpInside)
        self.contentView.addSubview($0)
        
    }
    
    /**
     可以显示标题
     */
    var canShowTitle: Bool {
        get {
            return (titleLable.attributedText?.length ?? 0 > 0 && titleLable.superview != nil)
        }
    }
    
    /**
     可以显示副标题
     */
    var canShowDetail: Bool {
        get {
            return (detailLabel.attributedText?.length ?? 0 > 0 && detailLabel.superview != nil)
        }
    }
    
    
    /**
     可以显示按钮
     */
    var canShowButton: Bool {
        
        get {
            
            if button.attributedTitle(for: .normal)?.length ?? 0 > 0 || button.image(for: .normal) != nil {
                return (button.superview != nil)
            }
            
            return false
            
        }
        
    }
    
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
        
        _ = contentView.subviews.forEach {
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
    
    /**
     删除所有的约束
     */
    func removeAllConstraints() {
        
        removeConstraints(constraints)
        contentView.removeConstraints(contentView.constraints)
        
    }
    
    func stepCustomViewConstraint() {
        
        guard let newCustomView = customView else {
            return
        }
        
        self.contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[customView]|",
                                                                       options: NSLayoutFormatOptions(rawValue: UInt(0)),
                                                                       metrics: nil,
                                                                       views: ["customView": newCustomView]))
        
        self.contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[customView]|",
                                                                       options: NSLayoutFormatOptions(rawValue: UInt(0)),
                                                                       metrics: nil,
                                                                       views: ["customView": newCustomView]))
        
    }
    
    
    
    
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
        
        if let _ = customView {
            
            stepCustomViewConstraint()
            
        } else {
            
            let width = frame.width != 0 ? frame.width : UIScreen.main.bounds.width
            let padding = roundf(Float(width)/16)
            let verticalSpace = self.verticalSpace != 0 ? self.verticalSpace : 11.0
            
            var subviewStrings: Array<String> = []
            var views: Dictionary<String, UIView> = [:]
            let metrics = ["padding": padding]
            
            
            addContentViewConstraint(stepImageView: {
                subviewStrings.append("imageView")
                views["imageView"] = $0
                contentView.addConstraint(contentView.equallyRelatedConstraintWithView($0, attribute: .centerX))
            }).addContentViewConstraint(stepTitle: {
                subviewStrings.append("titleLabel")
                views["titleLabel"] = $0
                contentView.addConstraints(NSLayoutConstraint .constraints(withVisualFormat: "H:|-(padding@750)-[titleLabel(>=0)]-(padding@750)-|",
                                                                           options: NSLayoutFormatOptions(rawValue: 0),
                                                                           metrics: metrics,
                                                                           views: views))
            }).addContentViewConstraint(stepDetail: {
                
                subviewStrings.append("detailLabel")
                views["detailLabel"] = $0
                
                contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(padding@750)-[detailLabel(>=0)]-(padding@750)-|",
                                                                          options: NSLayoutFormatOptions(rawValue: 0),
                                                                          metrics: metrics,
                                                                          views: views))
                
            }).addContentViewConstraint(stepButton: {
                
                subviewStrings.append("button");
                views["button"] = $0
                contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(padding@750)-[button(>=0)]-(padding@750)-|",
                                                                          options: NSLayoutFormatOptions(rawValue: UInt(0)),
                                                                          metrics: metrics,
                                                                          views: views))
            }).addContentViewConstraintDone {
                
                var verticalFormat = ""
                
                subviewStrings.forEach {
                    verticalFormat += "[\($0)]"
                    
                    if $0 == subviewStrings.last { return }
                    
                    verticalFormat += "-(\(verticalSpace)@750)-"
                    
                }
                
                if verticalFormat.characters.count > 0 {
                    contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|\(verticalFormat)|",
                        options: NSLayoutFormatOptions(rawValue: UInt(0)),
                        metrics: metrics,
                        views: views))
                }
                
                
            }
            

        }
        
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        
        guard let hitView = super.hitTest(point, with: event) else {
            return nil
        }
        
        if hitView is UIControl {
            return hitView
        }
        
        if hitView.isEqual(contentView) || hitView.isEqual(customView) {
            return hitView
        }
        
        return nil
        
    }
    
}

extension EmptyDataSetView {
    
    func addContentViewConstraint(stepImageView: (UIImageView) -> Void) -> EmptyDataSetView {
        
        if let _ = imageView.superview {
            stepImageView(imageView)
        }
        
        return self
    }
    
    func addContentViewConstraint(stepTitle: (UILabel) -> Void) -> EmptyDataSetView {
        
        if canShowTitle {
            
            stepTitle(titleLable)
            
        } else {
            titleLable.removeFromSuperview()
        }
        
        return self
    }
    
    func addContentViewConstraint(stepDetail: (UILabel) -> Void) -> EmptyDataSetView {
        
        if canShowDetail {
            
            stepDetail(detailLabel)
            
        } else {
            detailLabel.removeFromSuperview()
        }
        
        return self
        
    }
    
    func addContentViewConstraint(stepButton: (UIButton) -> Void) -> EmptyDataSetView {
        
        if (canShowButton) {
            stepButton(button)
        } else {
            button.removeFromSuperview()
        }
        
        return self
        
    }
    
    func addContentViewConstraintDone(done: () -> Void){
        done()
    }
    
}
