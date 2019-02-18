//
//  UINavigationController+Zink.m
//  NavigationTest
//
//  Created by kfzx-linz on 15/12/28.
//  Copyright © 2015年 ICBC. All rights reserved.
//

#import "UINavigationController+Zink.h"

@implementation UINavigationController (Zink)

#pragma mark public
/**
 *  设置导航栏半透明
 *
 *  @param translucent YES:开启半透明 （iOS7默认半透明）
 */
- (void)zinkSetTranslucent:(BOOL)translucent {
    self.navigationBar.translucent = translucent;
}

/**
 *  设置导航栏背景颜色
 */
- (void)zinkSetBackgroundColor:(UIColor *)color {
    UIImage *backgroundImage = [self getImageWithColor:color size:CGSizeMake(1, 1)];
    [self.navigationBar setBackgroundImage:backgroundImage
                             forBarMetrics:UIBarMetricsDefault];
}

/**
 *  设置系统POP返回按钮颜色
 */
- (void)zinkSetSystemBackItemColor:(UIColor *)color {
    [self.navigationBar setTintColor:color];
}

/**
 *  设置是否允许左滑返回
 *
 *  @param enable YES 允许
 */
- (void)zinkSetInteractivePopGestureRecognizerEnable:(BOOL)enable {
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.enabled = enable;
    }
}

/**
 *  设置电池条风格（前提：先在项目plist中添加 View controller-based status bar appearance,并将属性设置为NO）
 */
- (void)zinkSetStatuBarStyle:(StatuBarStyle)style {
    if (style == StatuBarStyleDark) {
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    } else {
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    }
}

/**
 *  设置导航栏标题样式
 */
- (void)zinkSetTitleColor:(UIColor *)color
                     font:(UIFont *)font{
    NSDictionary *textAttributes;
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_7_0
    textAttributes = @{
                       UITextAttributeFont: font,
                       UITextAttributeTextColor: color,
                       UITextAttributeTextShadowColor: [UIColor clearColor],
                       UITextAttributeTextShadowOffset: [NSValue valueWithUIOffset:UIOffsetZero],
                       };
#else
    textAttributes = @{
                       NSFontAttributeName: font,
                       NSForegroundColorAttributeName: color,
                       };
#endif
    
    [self.navigationBar setTitleTextAttributes:textAttributes];
}

/**
 *  设置导航栏标题
 */
- (void)zinkSetTitle:(NSString *)title {
    self.visibleViewController.navigationItem.title = title;
}

/**
 *  设置导航栏标题视图
 */
- (void)zinkSetTitleView:(UIView *)view {
    [self.visibleViewController.navigationItem setTitleView:view];
}

/**
 *  设置导航栏背景图
 */
- (void)zinkSetBackgroundImage:(NSString *)imageName {
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:imageName]
                             forBarMetrics:UIBarMetricsDefault];
}

/**
 *  添加item
 */
- (UIButton *)zinkAddItemWithTitle:(NSString *)title
                         iconImage:(NSString *)iconImageName
                   backgroundImage:(NSString *)backgroundImageName
                            target:(id)target
                            action:(SEL)action
                       orientation:(BarItemOrientation)orientation {
    
    UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
    button.titleLabel.font=[UIFont systemFontOfSize:17.0];
    [button.titleLabel setAdjustsFontSizeToFitWidth:YES];
    button.backgroundColor=[UIColor clearColor];
    
    if (title) {
        [button setTitle:title forState:UIControlStateNormal];
    }
    
    if (iconImageName) {
        [button setImage:[UIImage imageNamed:iconImageName] forState:UIControlStateNormal];
    }
    
    if (backgroundImageName) {
        [button setBackgroundImage:[UIImage imageNamed:backgroundImageName] forState:UIControlStateNormal];
    }
    
    [button sizeToFit];
    button.frame=CGRectMake(0,0,CGRectGetWidth(button.frame)+20,34);
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item=[[UIBarButtonItem alloc]initWithCustomView:button];
    
    if (orientation == BarItemOrientationLeft) {
        NSMutableArray *arrayItems = [NSMutableArray arrayWithArray:self.visibleViewController.navigationItem.leftBarButtonItems];
        if (arrayItems.count > 0) {
            [arrayItems addObject:item];
            self.visibleViewController.navigationItem.leftBarButtonItems = arrayItems;
        } else {
            [self addLeftBarButtonItem:item];
        }
    } else {
        NSMutableArray *arrayItems = [NSMutableArray arrayWithArray:self.visibleViewController.navigationItem.rightBarButtonItems];
        if (arrayItems.count > 0) {
            [arrayItems addObject:item];
            self.visibleViewController.navigationItem.rightBarButtonItems = arrayItems;
        } else {
            [self addRightBarButtonItem:item];
        }
    }
    
    return button;
}

/**
 *  清空所有item
 */
- (void)zinkClearAllItem {
    self.visibleViewController.navigationItem.leftBarButtonItems = nil;
    self.visibleViewController.navigationItem.rightBarButtonItems = nil;
}

- (void)zinkHideBottomLine {
    UINavigationBar *navigationBar = self.navigationBar;
    [navigationBar setShadowImage:[UIImage new]];
}

#pragma mark private
-(void)addLeftBarButtonItem:(UIBarButtonItem *)leftBarButtonItem
{
    self.visibleViewController.navigationItem.leftBarButtonItems = [self createBarButtonItems:@[leftBarButtonItem]];
}

- (void)addRightBarButtonItem:(UIBarButtonItem *)rightBarButtonItem
{
    self.visibleViewController.navigationItem.rightBarButtonItems = [self createBarButtonItems:@[rightBarButtonItem]];
}

- (NSArray *)createBarButtonItems:(NSArray *)barButtonItems {
    NSMutableArray *buttonItemArray=[[NSMutableArray alloc]init];
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
    {
        negativeSpacer.width = -15;
        [buttonItemArray addObject:negativeSpacer];
        [buttonItemArray addObjectsFromArray:barButtonItems];
        
    } else
    {
        negativeSpacer.width = 0;
        [buttonItemArray addObjectsFromArray:barButtonItems];
    }
    
    return buttonItemArray;
}

/**
 *  将Color转为Image
 */
- (UIImage *)getImageWithColor:(UIColor*)color size:(CGSize)size{
    CGRect imgRect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(imgRect.size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, imgRect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return img;
}

@end
