ZinkNavigation
===
- 简化导航栏设置

## Contents
* [开始使用](#Getting_Started)
	* [能做什么](#Features)
	* [安装](#Installation)
* [示例](#Examples)

# <a id="Getting_Started"></a> 开始使用
## <a id="Features"></a> 能做什么
- ZinkNavigation极大的简化了导航栏的设置操作，可以快速配置导航栏的常用功能

## <a id="Installation"></a> 安装
### 使用CocoaPods
```ruby
pod 'ZinkNavigation'

#import "UINavigationController+Zink.h"
``` 

# <a id="Examples"></a>示例
	
```objc
/**
 *  设置导航栏背景颜色
 */
- (void)zinkSetBackgroundColor:(UIColor *)color;
[self.navigationController zinkSetBackgroundColor:[UIColor redColor]];
```
![source1](https://github.com/zinkLin/ZinkNavigation/blob/master/Source/source1.png)

```objc
/**
 *  设置导航栏标题
 */
- (void)zinkSetTitle:(NSString *)title;
[self.navigationController zinkSetTitle:@"Zink"];
```
![source2](https://github.com/zinkLin/ZinkNavigation/blob/master/Source/source2.png)

```objc
/**
 *  设置导航栏标题样式
 */
- (void)zinkSetTitleColor:(UIColor *)color
                     font:(UIFont *)font;
[self.navigationController zinkSetTitleColor:[UIColor whiteColor] font:[UIFont boldSystemFontOfSize:23]];
```
![source3](https://github.com/zinkLin/ZinkNavigation/blob/master/Source/source3.png)

```objc
/**
 *  设置电池条风格（前提：先在项目plist中添加 View controller-based status bar appearance,并将属性设置为NO）
 */
- (void)zinkSetStatuBarStyle:(StatuBarStyle)style;
[self.navigationController zinkSetStatuBarStyle:StatuBarStyleLight];
```
![source4](https://github.com/zinkLin/ZinkNavigation/blob/master/Source/source4.png)

```objc
/**
 *  添加导航栏上的按钮,
 *  这个函数会返回一个默认的Button，如果Button的UI不是你所预期的，你可以获取这个Button，并对它进行修改
 *
 *  @param title               按钮标题
 *  @param iconImageName       按钮图标
 *  @param backgroundImageName 按钮背景图
 *  @param target              事件触发对象
 *  @param action              事件
 *  @param orientation         按钮的位置（左、右）
 *
 *  @return 按钮
 */
- (UIButton *)zinkAddItemWithTitle:(NSString *)title
                         iconImage:(NSString *)iconImageName
                   backgroundImage:(NSString *)backgroundImageName
                            target:(id)target
                            action:(SEL)action
                       orientation:(BarItemOrientation)orientation;
UIButton *button = [self.navigationController zinkAddItemWithTitle:@"push"
                                          iconImage:nil
                                    backgroundImage:nil
                                             target:self
                                             action:@selector(showOtherViewController)
                                        orientation:BarItemOrientationRight];
```
![source5](https://github.com/zinkLin/ZinkNavigation/blob/master/Source/source5.png)

```objc
/**
 *  设置导航栏标题视图
 */
- (void)zinkSetTitleView:(UIView *)view;
UISwitch *switchZ = [UISwitch new];
[self.navigationController zinkSetTitleView:switchZ];
```
![source6](https://github.com/zinkLin/ZinkNavigation/blob/master/Source/source6.png)


