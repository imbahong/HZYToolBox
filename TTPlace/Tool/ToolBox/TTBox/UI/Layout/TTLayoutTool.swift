//
//  TTLayoutTool.swift
//  HotDate
//
//  Created by Mr.hong on 2020/8/24.
//  Copyright © 2020 刘超. All rights reserved.
//

import Foundation


let screenRatio = SCREEN_W / 375.0
// 获取比例宽
func hor(_ value: CGFloat) -> CGFloat{
    return value * screenRatio
}

// 获取纵向比例高
func ver(_ value: CGFloat) -> CGFloat {
    return ttSize(size: CGSize.init(width: SCREEN_W, height: value)).height
}

// 根据原尺寸宽获取纵向比例高
func ver(_ sourceWidth: CGFloat ,_ value: CGFloat) -> CGFloat {
    return ttSize(size: CGSize.init(width: sourceWidth, height: value)).height
}

//// 根据原尺寸,获取比例的size
func ttSize(size: CGSize) -> CGSize {
    let ratioWidth = size.width * screenRatio
    let ratioHeight = ratioWidth * (size.height / size.width)
    return CGSize.init(width: SCREEN_W == size.width ? size.width : ratioWidth, height: ratioHeight)
}

// 根据宽高设置尺寸
func ttSize(_ width: CGFloat,_ height: CGFloat) -> CGSize {
    let ratioWidth = width * screenRatio
    let ratioHeight = ratioWidth * (height / width)
    return CGSize.init(width: SCREEN_W == width ? width : ratioWidth , height: ratioHeight)
}

// 屏幕宽高
func ttScreenSize() -> CGSize {
    return CGSize.init(width: SCREEN_W, height: SCREEN_H)
}

// 根据宽高设置尺寸
func ttSize(_ value: CGFloat) -> CGSize {
    return ttSize(value, value)
}


// 安全区底部高度
func ttSafeBottom() -> CGFloat {
     if #available(iOS 11.0, *) {
        return Application.shared.window?.safeAreaInsets.bottom ?? 0
    } else {
        return 0
    }
}