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
public protocol EmptyDataSource: class {
    
    /**
     配置空数据时显示的主标题
     
     - Parameter scrollView: 目标视图
     
     - Returns: 主标题
     
     */
    func title(emptyView scrollView: UIScrollView) -> NSAttributedString?
    
    /**
     配置空数据时显示的副标题（描述）
     
     - Parameter scrollView: 目标视图
     
     - Returns: 副标题（描述）
     
     */
    func description(emptyView scrollView: UIScrollView) -> NSAttributedString?
    
    /**
     配置空数据时显示的图片
     
     - Parameter scrollView: 目标视图
     
     - Returns: 图片
     
     */
    func image(emptyView scrollView: UIScrollView) -> UIImage?
    
    /**
     配置空数据时显示的图片的UIViewImage的tintColor属性
     
     - Parameter scrollView: 目标视图
     
     - Returns: tintColor的色值
     
     */
    func imageTintColor(emptyView scrollView: UIScrollView) -> UIColor?
    
    /**
     配置空数据时显示的图片的UIViewImage的动画效果
     
     - Parameter scrollView: 目标视图
     
     - Returns: tintColor的色值
     
     */
    func imageAnimation(emptyView scrollView: UIScrollView) -> CAAnimation?
    
    /**
     配置空数据时显示的按钮的标题
     
     - Parameter scrollView: 目标视图
     - Parameter state: 按钮状态
     
     - Returns: 按钮标题
     
     */
    func buttonTitle(emptyView scrollView: UIScrollView, state: UIControlState) -> NSAttributedString?
    
    /**
     配置空数据时显示的按钮图片
     
     - Parameters:
        - scrollView: 目标视图
        - state: 按钮状态
     
     - Returns: 按钮图片
     
     */
    func buttonImage(emptyView scrollView: UIScrollView, state: UIControlState) -> UIImage?
    
    /**
     配置空数据时显示的按钮背景图片
     
     - Parameters:
        - scrollView: 目标视图
        - Parameter state: 按钮状态
     
     - Returns: 按钮背景图片
     
     */
    func buttonBackgroundImage(emptyView scrollView: UIScrollView, forState state: UIControlState) -> UIImage?
    
    /**
     配置空数据时显示背景颜色
     
     - Parameter scrollView: 目标视图
     
     - Returns: 背景颜色
     
     */
    func backgroundColor(emptyView scrollView: UIScrollView) -> UIColor?
    
    /**
     配置空数据时显示的视图，用于自定义空数据显示的视图
     
     - Parameter scrollView: 目标视图
     
     - Returns: 空数据时显示的视图
     
     */
    func customView(emptyView scrollView: UIScrollView) -> UIView?
    
    /**
     配置空数据时显示的视图的垂直偏移量
     
     - Parameter scrollView: 目标视图
     
     - Returns: 空数据时显示的视图的偏移量
     
     */
    func verticalOffset(emptyView scrollView: UIScrollView) -> CGFloat
    
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
    func spaceHeight(emptyView scrollView: UIScrollView) -> CGFloat
    
}

public extension EmptyDataSource {
    
    /**
     配置空数据时显示的主标题
     
     - Parameter scrollView: 目标视图
     
     - Returns: 主标题
     
     */
    func title(emptyView scrollView: UIScrollView) -> NSAttributedString? { return nil }
    
    /**
     配置空数据时显示的副标题（描述）
     
     - Parameter scrollView: 目标视图
     
     - Returns: 副标题（描述）
     
     */
    func description(emptyView scrollView: UIScrollView) -> NSAttributedString? { return nil }
    
    /**
     配置空数据时显示的图片
     
     - Parameter scrollView: 目标视图
     
     - Returns: 图片
     
     */
    func image(emptyView scrollView: UIScrollView) -> UIImage? { return nil }
    
    /**
     配置空数据时显示的图片的UIViewImage的tintColor属性
     
     - Parameter scrollView: 目标视图
     
     - Returns: tintColor的色值
     
     */
    func imageTintColor(emptyView scrollView: UIScrollView) -> UIColor? { return nil }
    
    /**
     配置空数据时显示的图片的UIViewImage的动画效果
     
     - Parameter scrollView: 目标视图
     
     - Returns: tintColor的色值
     
     */
    func imageAnimation(emptyView scrollView: UIScrollView) -> CAAnimation? { return nil }
    
    /**
     配置空数据时显示的按钮的标题
     
     - Parameter scrollView: 目标视图
     - Parameter state: 按钮状态
     
     - Returns: 按钮标题
     
     */
    func buttonTitle(emptyView scrollView: UIScrollView, state: UIControlState) -> NSAttributedString? { return nil }
    
    /**
     配置空数据时显示的按钮图片
     
     - Parameters:
     - scrollView: 目标视图
     - state: 按钮状态
     
     - Returns: 按钮图片
     
     */
    func buttonImage(emptyView scrollView: UIScrollView, state: UIControlState) -> UIImage? { return nil }
    
    /**
     配置空数据时显示的按钮背景图片
     
     - Parameters:
     - scrollView: 目标视图
     - Parameter state: 按钮状态
     
     - Returns: 按钮背景图片
     
     */
    func buttonBackgroundImage(emptyView scrollView: UIScrollView, forState state: UIControlState) -> UIImage? { return nil }
    
    /**
     配置空数据时显示背景颜色
     
     - Parameter scrollView: 目标视图
     
     - Returns: 背景颜色
     
     */
    func backgroundColor(emptyView scrollView: UIScrollView) -> UIColor? { return nil }
    
    /**
     配置空数据时显示的视图，用于自定义空数据显示的视图
     
     - Parameter scrollView: 目标视图
     
     - Returns: 空数据时显示的视图
     
     */
    func customView(emptyView scrollView: UIScrollView) -> UIView? { return nil }
    
    /**
     配置空数据时显示的视图的垂直偏移量
     
     - Parameter scrollView: 目标视图
     
     - Returns: 空数据时显示的视图的偏移量
     
     */
    func verticalOffset(emptyView scrollView: UIScrollView) -> CGFloat { return 0 }
    
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
    func spaceHeight(emptyView scrollView: UIScrollView) -> CGFloat { return 0 }
    
}



