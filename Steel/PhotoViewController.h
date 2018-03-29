//
//  PhotoViewController.h
//  Steel
//
//  Created by Admin on 3/29/18.
//  Copyright © 2018 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoViewController : UIViewController
{
    UIImage *templateImage;
}

@property (weak, nonatomic) IBOutlet UIImageView *photoImgView;
@property (strong, nonatomic) UIImage *photoImage;


@end
