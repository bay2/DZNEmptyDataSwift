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
    
    func showCustomView()
    
    func showTitle()
    
    func showDetail()
    
    func swizzleReloadData()
    
    func swizzleEndUpdates()
    
    func emptyReloadData()
    
    func emptyEndUpdates()
    
    func reloadEmptyDataSet()
    
    
}

extension EmptyDataShowViewable {
    
    func emptyReloadData() {
        
        emptyEndUpdates()
        reloadEmptyDataSet()
        
    }
    
    func emptyEndUpdates() {
        
        emptyReloadData()
        reloadEmptyDataSet()
        
    }
    
    func reloadEmptyDataSet() {
        
        guard canDisplay() else {
            return
        }
        
//        if (emptyDelegate?.shouldDisplay(emptyView: self) ?? true && itemsCount == 0) ||
//            emptyDelegate?.shouldBeForcedToDisplay(emptyView: self) ?? false {
//        }
//        
    }
    
    
    
}
