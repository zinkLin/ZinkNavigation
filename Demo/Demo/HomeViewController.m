//
//  ViewController.m
//  Demo
//
//  Created by kfzx-linz on 16/6/13.
//  Copyright © 2016年 ICBC. All rights reserved.
//

#import "HomeViewController.h"
#import "UINavigationController+Zink.h"
#import "OtherViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.navigationController zinkSetBackgroundColor:[UIColor redColor]];
    [self.navigationController zinkSetTitle:@"Zink"];
    [self.navigationController zinkSetTitleColor:[UIColor whiteColor] font:[UIFont boldSystemFontOfSize:23]];
    [self.navigationController zinkSetStatuBarStyle:StatuBarStyleLight];
    [self.navigationController zinkAddItemWithTitle:@"push"
                                          iconImage:nil
                                    backgroundImage:nil
                                             target:self
                                             action:@selector(showOtherViewController)
                                        orientation:BarItemOrientationRight];
    
    UISwitch *switchZ = [UISwitch new];
    [self.navigationController zinkSetTitleView:switchZ];
}

- (void)showOtherViewController {
    OtherViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"OtherViewController"];
    [self.navigationController pushViewController:vc animated:YES];
}


@end
