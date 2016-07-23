//
//  UIScrollViewEx.swift
//  DZNEmptyDataSwift
//
//  Created by xuemincai on 16/6/23.
//  Copyright © 2016年 xuemincai. All rights reserved.
//

import UIKit

var kEmptyDataSetSource = "emptyDataSetSource"
var kEmptyDelegate      = "emptyDelegate"
var kEmptyDataSetView   = "emptyDataSetView"

extension UIScrollView: UIGestureRecognizerDelegate {
    
    @IBOutlet weak public var dzn_emptyDataSource: EmptyDataSource?  {
        get {
            return objc_getAssociatedObject(self, &kEmptyDataSetSource) as? EmptyDataSource
        }
        set(newValue) {
            
            objc_setAssociatedObject(self, &kEmptyDataSetSource, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            
            if newValue == nil || !dzn_canDisplay() {
                dzn_invalidate()
            }
            
            swizzleReloadData()
            
        }
    }
    
    @IBOutlet weak public var dzn_emptyDelegate: EmptyDelegate? {
        
        get {
            return objc_getAssociatedObject(self, &kEmptyDelegate) as? EmptyDelegate
        }
        set(newValue) {
            
            if newValue != nil {
                self.dzn_invalidate()
            }
            
            objc_setAssociatedObject(self, &kEmptyDelegate, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            
        }
        
    }
    
    
    var emptyView: DZNEmptyDataSetView? {
        
        get {

            if let view = objc_getAssociatedObject(self, &kEmptyDataSetView) as? DZNEmptyDataSetView {
                return view
            }
            
            let view = DZNEmptyDataSetView()
            view.autoresizingMask = UIViewAutoresizing(rawValue: UIViewAutoresizing.flexibleHeight.rawValue|UIViewAutoresizing.flexibleWidth.rawValue)
            view.isHidden = true
            view.tapGesture = UITapGestureRecognizer(target: self, action: #selector(UIScrollView.dzn_didTapContentView))
            view.tapGesture?.delegate = self
            view.addGestureRecognizer(view.tapGesture!)
            
            objc_setAssociatedObject(self, &kEmptyDataSetView, view, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            
            return view
            
        }
        
        set(newValue) {
            objc_setAssociatedObject(self, &kEmptyDataSetView, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        
    }
    

    
}

public extension UIScrollView {
    
    /// item个数
    var dzn_itemsCount: Int {
        
        get {
            
            var items = tableViewItemsCount()
            
            items += collectionViewItemsCount()
        
            return items
            
        }
    }
    
    /**
     获取tableView 有多少项
    */
    func tableViewItemsCount() -> Int {
        
        var items = 0
        
        if !self.responds(to: #selector(getter: UITableView.dataSource)) {
            return items
        }
        
        if self.isKind(of: UITableView.classForCoder()) {
            
            guard let tableView = self as? UITableView else {
                return items
            }
            
            let sections = tableView.dataSource?.numberOfSections?(in: tableView) ?? 0
            
            for sectionIndex in 0..<sections {
                
                items += tableView.dataSource?.tableView(tableView, numberOfRowsInSection: sectionIndex) ?? 0
                
            }
            
        }
        
        return items
        
    }
    
    
    /**
     collectionView 有多少项
     */
    func collectionViewItemsCount() -> Int {
        
        var items = 0
        
        if !self.responds(to: #selector(getter: UICollectionView.dataSource)) {
            return items
        }
        
        guard self.isKind(of: UICollectionView.classForCoder()) else {
            return items
        }
        
        guard let collectionView = self as? UICollectionView else {
            return items
        }
        
        let sections = collectionView.dataSource?.numberOfSections?(in: collectionView) ?? 0
        
        for sectionsIndex in 0..<sections {
            
            items += collectionView.dataSource?.collectionView(collectionView, numberOfItemsInSection: sectionsIndex) ?? 0
            
        }
        
        return items
        
    }
    
    /**
     初始化
    */
    func dzn_invalidate() {
        
        self.dzn_emptyDelegate?.didAppear?(emptyView: self)
        self.emptyView?.prepareForReuse()
        self.emptyView?.removeFromSuperview()
        self.emptyView = nil
        
        self.isScrollEnabled = true
        
        self.dzn_emptyDelegate?.didDisappear?(emptyView: self)
        
        
    }
    
    /**
     是否可以显示
     
     - Returns: 是否显示
        - true 可以显示
        - false 不能显示
    */
    func dzn_canDisplay() -> Bool {
        
        guard  let _ = self.dzn_emptyDataSource else {
            return false
        }
        
        guard self.isKind(of: UITableView.classForCoder()) || self.isKind(of: UICollectionView.classForCoder()) else {
            return false
            
        }

        return true
    }
    
    
    func dzn_didTapDataButton(sender: UIButton) {
        
        self.dzn_emptyDelegate?.didTap?(emptyView: self, view: sender)
        
    }
    
    func dzn_didTapContentView(sender: UITapGestureRecognizer) {
        
        guard let view = sender.view else {
            return
        }
        
        self.dzn_emptyDelegate?.didTap?(emptyView: self, view: view)
    }
    
}

