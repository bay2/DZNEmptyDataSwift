//
//  AssociatedObject.swift
//  Examples
//
//  Created by xuemincai on 2016/11/27.
//  Copyright © 2016年 xuemincai. All rights reserved.
//

import Foundation

/// 获取关联属性
///
/// - parameter base:        关联类
/// - parameter key:         属性对应key
/// - parameter initialiser: 初始化闭包
///
/// - returns: 属性
func associatedObject<ValueType: Any>(base: Any, key: UnsafePointer<UInt8>, initialiser: () -> ValueType) -> ValueType {
    
    if let associated = objc_getAssociatedObject(base, key) as? ValueType {
        return associated
    }
    
    let associated = initialiser()
    
    objc_setAssociatedObject(base, key, associated, .OBJC_ASSOCIATION_RETAIN)
    
    return associated
    
}


/// 设置关联属性值
///
/// - parameter base:  关联类
/// - parameter key:   属性对应key
/// - parameter value: 新值
func associatedObject<ValueType: Any>(base: Any, key: UnsafePointer<UInt8>, value: ValueType) {
    
    objc_setAssociatedObject(base, key, value, .OBJC_ASSOCIATION_RETAIN)
    
}
