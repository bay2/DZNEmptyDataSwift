//
//  EmptyDataSource.swift
//  Examples
//
//  Created by xuemincai on 16/6/30.
//  Copyright © 2016年 xuemincai. All rights reserved.
//

import UIKit

/**
 空数据数据代理
 */
@objc public protocol EmptyDataSource: NSObjectProtocol {
    
    /**
     配置空数据时显示的主标题
     
     - Parameter scrollView: 目标视图
     
     - Returns: 主标题
     
     */
    @objc optional func title(emptyView scrollView: UIScrollView) -> NSAttributedString?
    
    /**
     配置空数据时显示的副标题（描述）
     
     - Parameter scrollView: 目标视图
     
     - Returns: 副标题（描述）
     
     */
    @objc optional func description(emptyView scrollView: UIScrollView) -> NSAttributedString?
    
    /**
     配置空数据时显示的图片
     
     - Parameter scrollView: 目标视图
     
     - Returns: 图片
     
     */
    @objc optional func image(emptyView scrollView: UIScrollView) -> UIImage?
    
    /**
     配置空数据时显示的图片的UIViewImage的tintColor属性
     
     - Parameter scrollView: 目标视图
     
     - Returns: tintColor的色值
     
     */
    @objc optional func imageTintColor(emptyView scrollView: UIScrollView) -> UIColor?
    
    /**
     配置空数据时显示的图片的UIViewImage的动画效果
     
     - Parameter scrollView: 目标视图
     
     - Returns: tintColor的色值
     
     */
    @objc optional func imageAnimation(emptyView scrollView: UIScrollView) -> CAAnimation?
    
    /**
     配置空数据时显示的按钮的标题
     
     - Parameter scrollView: 目标视图
     - Parameter state: 按钮状态
     
     - Returns: 按钮标题
     
     */
    @objc optional func buttonTitle(emptyView scrollView: UIScrollView, state: UIControlState) -> NSAttributedString?
    
    /**
     配置空数据时显示的按钮图片
     
     - Parameters:
        - scrollView: 目标视图
        - state: 按钮状态
     
     - Returns: 按钮图片
     
     */
    @objc optional func buttonImage(emptyView scrollView: UIScrollView, state: UIControlState) -> UIImage?
    
    /**
     配置空数据时显示的按钮背景图片
     
     - Parameters:
        - scrollView: 目标视图
        - Parameter state: 按钮状态
     
     - Returns: 按钮背景图片
     
     */
    @objc optional func buttonBackgroundImage(emptyView scrollView: UIScrollView, forState state: UIControlState) -> UIImage?
    
    /**
     配置空数据时显示背景颜色
     
     - Parameter scrollView: 目标视图
     
     - Returns: 背景颜色
     
     */
    @objc optional func backgroundColor(emptyView scrollView: UIScrollView) -> UIColor?
    
    /**
     配置空数据时显示的视图，用于自定义空数据显示的视图
     
     - Parameter scrollView: 目标视图
     
     - Returns: 空数据时显示的视图
     
     */
    @objc optional func customView(emptyView scrollView: UIScrollView) -> UIView?
    
    /**
     配置空数据时显示的视图的垂直偏移量
     
     - Parameter scrollView: 目标视图
     
     - Returns: 空数据时显示的视图的偏移量
     
     */
    @objc optional func verticalOffset(emptyView scrollView: UIScrollView) -> CGFloat
    
    /**
     配置空数据时显示的视图中的子视图之间的间距
     
     - remark:
     子视图有：
      - 标题
      - 子标题
      - 图片
      - 按钮
     
     如果使用 optional func customView(emptyView scrollView: UIScrollView) -> UIView? 进行自定义视图，
     这个配置会对自定义的视图中的所以子视图（自定义视图子视图层级为1）设置间距
     
     - Parameter scrollView: 目标视图
     
     - Returns: 按钮背景图片
     
     */
    @objc optional func spaceHeight(emptyView scrollView: UIScrollView) -> CGFloat
    
}

/**
 空数据代理
 */
@objc public protocol EmptyDelegate: NSObjectProtocol {
    
    /**
     配置空数据时显示的视图是否使用淡入
     
     - Parameter scrollView: 目标视图
     
     - Returns:  是否使用淡入
        - true 淡入 (default)
        - false 不淡入
     
     
     */
    @objc optional func shouldFadeIn(emptyView scrollView: UIScrollView) -> Bool
    
    /**
     配置是否强制显示空视图
     
     - Parameter scrollView: 目标视图
     
     - Returns:  是否强制显示
        - true 强制显示
        - false 不强制显示 (default)
     
     */
    @objc optional func shouldBeForcedToDisplay(emptyView scrollView: UIScrollView) -> Bool
    
    /**
     配置是否允许显示空视图
     
     - Parameter scrollView: 目标视图
     
     - Returns:  是否显示
        - true 显示 (default)
        - false 不显示
     
     */
    @objc optional func shouldDisplay(emptyView scrollView: UIScrollView) -> Bool
    
    /**
     配置空视图是否允许点击
     
     - Parameter scrollView: 目标视图
     
     - Returns:  是否允许点击
        - true 允许 (default)
        - false 不允许
     
     */
    @objc optional func shouldAllowTouch(emptyView scrollView: UIScrollView) -> Bool
    
    /**
     配置空视图时是否允许滚动
     
     - Parameter scrollView: 目标视图
     
     - Returns:  是否允许滚动
        - true 允许 (default)
        - false 不允许
     
     */
    @objc optional func shouldAllowScroll(emptyView scrollView: UIScrollView) -> Bool
    
    /**
     配置空视图时图片是否支持动画效果
     
     - Parameter scrollView: 目标视图
     
     - Returns:  是否支持
        - true 支持 (default)
        - false 不支持
     
     */
    @objc optional func shouldAnimateImageView(emptyView scrollView: UIScrollView) -> Bool
    
    /**
     配置空视图点击事件
     
     - Parameters 
        - scrollView: 目标视图
        - view: 被点击的视图
     
     */
    @objc optional func didTap(emptyView scrollView: UIScrollView, view: UIView)
    
    /**
     配置空视图时按钮点击事件
     
     - Parameters:
        - scrollView: 目标视图
        - button: 被点击的按钮
     
     */
    @objc optional func didTap(emptyView scrollView: UIScrollView, button: UIButton)
    
    /**
     配置空视图将要显示的回调
     
     - Parameters:
        - scrollView: 目标视图
     
     */
    @objc optional func willAppear(emptyView scrollView: UIScrollView)
    
    /**
     配置空视图显示后的回调
     
     - Parameters:
        - scrollView: 目标视图
     
     */
    @objc optional func didAppear(emptyView scrollView: UIScrollView)
    
    /**
     配置空视图将要消失的回调
     
     - Parameters:
        - scrollView: 目标视图
     
     */
    @objc optional func willDisappear(emptyView scrollView: UIScrollView)
    
    /**
     配置空视图消失后的回调
     
     - Parameters:
        - scrollView: 目标视图
     
     */
    @objc optional func didDisappear(emptyView scrollView: UIScrollView)
    
    
}

