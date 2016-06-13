//
//  UINavigationController+Zink.h
//  NavigationTest
//
//  Created by kfzx-linz on 15/12/28.
//  Copyright © 2015年 ICBC. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  item的位置
 */
typedef NS_ENUM(NSInteger, BarItemOrientation) {
    /**
     *  左边
     */
    BarItemOrientationLeft,
    /**
     *  右边
     */
    BarItemOrientationRight
};

/**
 *  状态栏风格
 */
typedef NS_ENUM(NSInteger, StatuBarStyle) {
    /**
     *  白色
     */
    StatuBarStyleLight,
    /**
     *  黑色
     */
    StatuBarStyleDark
};

@interface UINavigationController (Zink)

/**
 *  设置导航栏半透明
 *
 *  @param translucent YES:开启半透明 （iOS7默认半透明）
 */
- (void)zinkSetTranslucent:(BOOL)translucent;

/**
 *  设置导航栏背景颜色
 */
- (void)zinkSetBackgroundColor:(UIColor *)color;

/**
 *  设置系统POP返回按钮颜色
 */
- (void)zinkSetSystemBackItemColor:(UIColor *)color;

/**
 *  设置是否允许左滑返回
 *
 *  @param enable YES 允许
 */
- (void)zinkSetInteractivePopGestureRecognizerEnable:(BOOL)enable;

/**
 *  设置电池条风格（前提:先在项目plist中添加 View controller-based status bar appearance）
 */
- (void)zinkSetStatuBarStyle:(StatuBarStyle)style;

/**
 *  设置导航栏标题样式
 */
- (void)zinkSetTitleColor:(UIColor *)color
                     font:(UIFont *)font;

/**
 *  设置导航栏标题
 */
- (void)zinkSetTitle:(NSString *)title;

/**
 *  设置导航栏标题视图
 */
- (void)zinkSetTitleView:(UIView *)view;

/**
 *  设置导航栏背景图
 */
- (void)zinkSetBackgroundImage:(NSString *)imageName;

/**
 *  添加item
 */
- (UIButton *)zinkAddItemWithTitle:(NSString *)title
                         iconImage:(NSString *)iconImageName
                   backgroundImage:(NSString *)backgroundImageName
                            target:(id)target
                            action:(SEL)action
                       orientation:(BarItemOrientation)orientation;

/**
 *  清空所有item
 */
- (void)zinkClearAllItem;
@end
