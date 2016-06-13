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

    [self.navigationController zinkSetTitle:@"Home"];
    [self.navigationController zinkSetTitleColor:[UIColor whiteColor] font:[UIFont boldSystemFontOfSize:17]];
    [self.navigationController zinkSetBackgroundColor:[UIColor blackColor]];
    [self.navigationController zinkAddItemWithTitle:@"push"
                                          iconImage:nil
                                    backgroundImage:nil
                                             target:self
                                             action:@selector(showOtherViewController)
                                        orientation:BarItemOrientationRight];
}

- (void)showOtherViewController {
    OtherViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"OtherViewController"];
    [self.navigationController pushViewController:vc animated:YES];
}


@end
