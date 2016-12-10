//
//  EmptyDelegate.swift
//  Examples
//
//  Created by xuemincai on 2016/11/27.
//  Copyright © 2016年 xuemincai. All rights reserved.
//

import UIKit

/**
 空数据代理
 */
public protocol EmptyDelegate: class {
    
    /**
     配置空数据时显示的视图是否使用淡入
     
     - Parameter scrollView: 目标视图
     
     - Returns:  是否使用淡入
     - true 淡入 (default)
     - false 不淡入
     
     
     */
    func shouldFadeIn(emptyView scrollView: UIScrollView) -> Bool
    
    /**
     配置是否强制显示空视图
     
     - Parameter scrollView: 目标视图
     
     - Returns:  是否强制显示
     - true 强制显示
     - false 不强制显示 (default)
     
     */
    func shouldBeForcedToDisplay(emptyView scrollView: UIScrollView) -> Bool
    
    /**
     配置是否允许显示空视图
     
     - Parameter scrollView: 目标视图
     
     - Returns:  是否显示
     - true 显示 (default)
     - false 不显示
     
     */
    func shouldDisplay(emptyView scrollView: UIScrollView) -> Bool
    
    /**
     配置空视图是否允许点击
     
     - Parameter scrollView: 目标视图
     
     - Returns:  是否允许点击
     - true 允许 (default)
     - false 不允许
     
     */
    func shouldAllowTouch(emptyView scrollView: UIScrollView) -> Bool
    
    /**
     配置空视图时是否允许滚动
     
     - Parameter scrollView: 目标视图
     
     - Returns:  是否允许滚动
     - true 允许 (default)
     - false 不允许
     
     */
    func shouldAllowScroll(emptyView scrollView: UIScrollView) -> Bool
    
    /**
     配置空视图时图片是否支持动画效果
     
     - Parameter scrollView: 目标视图
     
     - Returns:  是否支持
     - true 支持 (default)
     - false 不支持
     
     */
    func shouldAnimateImageView(emptyView scrollView: UIScrollView) -> Bool
    
    /**
     配置空视图点击事件
     
     - Parameters
     - scrollView: 目标视图
     - view: 被点击的视图
     
     */
    func didTap(emptyView scrollView: UIScrollView, view: UIView)
    
    /**
     配置空视图时按钮点击事件
     
     - Parameters:
     - scrollView: 目标视图
     - button: 被点击的按钮
     
     */
    func didTap(emptyView scrollView: UIScrollView, button: UIButton)
    
    /**
     配置空视图将要显示的回调
     
     - Parameters:
     - scrollView: 目标视图
     
     */
    func willAppear(emptyView scrollView: UIScrollView)
    
    /**
     配置空视图显示后的回调
     
     - Parameters:
     - scrollView: 目标视图
     
     */
    func didAppear(emptyView scrollView: UIScrollView)
    
    /**
     配置空视图将要消失的回调
     
     - Parameters:
     - scrollView: 目标视图
     
     */
    func willDisappear(emptyView scrollView: UIScrollView)
    
    /**
     配置空视图消失后的回调
     
     - Parameters:
     - scrollView: 目标视图
     
     */
    func didDisappear(emptyView scrollView: UIScrollView)
    
    
}

/**
 空数据代理
 */
public extension EmptyDelegate {
    
    /**
     配置空数据时显示的视图是否使用淡入
     
     - Parameter scrollView: 目标视图
     
     - Returns:  是否使用淡入
     - true 淡入 (default)
     - false 不淡入
     
     
     */
    func shouldFadeIn(emptyView scrollView: UIScrollView) -> Bool { return true }
    
    /**
     配置是否强制显示空视图
     
     - Parameter scrollView: 目标视图
     
     - Returns:  是否强制显示
     - true 强制显示
     - false 不强制显示 (default)
     
     */
    func shouldBeForcedToDisplay(emptyView scrollView: UIScrollView) -> Bool { return false }
    
    /**
     配置是否允许显示空视图
     
     - Parameter scrollView: 目标视图
     
     - Returns:  是否显示
     - true 显示 (default)
     - false 不显示
     
     */
    func shouldDisplay(emptyView scrollView: UIScrollView) -> Bool { return true }
    
    /**
     配置空视图是否允许点击
     
     - Parameter scrollView: 目标视图
     
     - Returns:  是否允许点击
     - true 允许 (default)
     - false 不允许
     
     */
    func shouldAllowTouch(emptyView scrollView: UIScrollView) -> Bool { return true }
    
    /**
     配置空视图时是否允许滚动
     
     - Parameter scrollView: 目标视图
     
     - Returns:  是否允许滚动
     - true 允许 (default)
     - false 不允许
     
     */
    func shouldAllowScroll(emptyView scrollView: UIScrollView) -> Bool { return true }
    
    /**
     配置空视图时图片是否支持动画效果
     
     - Parameter scrollView: 目标视图
     
     - Returns:  是否支持
     - true 支持 (default)
     - false 不支持
     
     */
    func shouldAnimateImageView(emptyView scrollView: UIScrollView) -> Bool { return true }
    
    /**
     配置空视图点击事件
     
     - Parameters
     - scrollView: 目标视图
     - view: 被点击的视图
     
     */
    func didTap(emptyView scrollView: UIScrollView, view: UIView) {}
    
    /**
     配置空视图时按钮点击事件
     
     - Parameters:
     - scrollView: 目标视图
     - button: 被点击的按钮
     
     */
    func didTap(emptyView scrollView: UIScrollView, button: UIButton) {}
    
    /**
     配置空视图将要显示的回调
     
     - Parameters:
     - scrollView: 目标视图
     
     */
    func willAppear(emptyView scrollView: UIScrollView) {}
    
    /**
     配置空视图显示后的回调
     
     - Parameters:
     - scrollView: 目标视图
     
     */
    func didAppear(emptyView scrollView: UIScrollView) {}
    
    /**
     配置空视图将要消失的回调
     
     - Parameters:
     - scrollView: 目标视图
     
     */
    func willDisappear(emptyView scrollView: UIScrollView) {}
    
    /**
     配置空视图消失后的回调
     
     - Parameters:
     - scrollView: 目标视图
     
     */
    func didDisappear(emptyView scrollView: UIScrollView) {}
    
    
}
