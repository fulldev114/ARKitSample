//
//  HomeViewController.m
//  Steel
//
//  Created by Admin on 3/27/18.
//  Copyright © 2018 Admin. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.temScrolllView setContentSize:CGSizeMake(110 * 6, 170)];
    
    for (int i = 0; i < 6; i++) {
        UIImageView *tempImageView = [[UIImageView alloc] initWithFrame:CGRectMake(i * 110 + 8, 1, 94, 170)];
        NSString *templateName = [NSString stringWithFormat:@"template%ld", (long)i+1];
        tempImageView.image = [UIImage imageNamed:templateName];
        UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onClickTemplate:)];
        tempImageView.tag = 0;
        [tempImageView addGestureRecognizer:gesture];
        [self.temScrolllView addSubview:tempImageView];
    }
}

- (void) onClickTemplate:(UITapGestureRecognizer*) gesture {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
