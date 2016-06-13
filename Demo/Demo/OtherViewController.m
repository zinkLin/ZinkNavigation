//
//  OtherViewController.m
//  Demo
//
//  Created by kfzx-linz on 16/6/13.
//  Copyright © 2016年 ICBC. All rights reserved.
//

#import "OtherViewController.h"
#import "UINavigationController+Zink.h"

@interface OtherViewController ()

@end

@implementation OtherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationController zinkSetTitle:@"Other"];
    [self.navigationController zinkAddItemWithTitle:@"back"
                                          iconImage:nil
                                    backgroundImage:nil
                                             target:self
                                             action:@selector(actionBack)
                                        orientation:BarItemOrientationLeft];
}

- (void)actionBack {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
