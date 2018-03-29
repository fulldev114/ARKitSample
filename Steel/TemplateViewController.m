//
//  TemplateViewController.m
//  Steel
//
//  Created by Admin on 3/28/18.
//  Copyright © 2018 Admin. All rights reserved.
//

#import "TemplateViewController.h"
#import "TemplateTableViewCell.h"
#import "PhotoViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>

@interface TemplateViewController ()  <UITableViewDataSource, UITableViewDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate>
{
    UIAlertController *alertController;
}
@end

@implementation TemplateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIAlertAction *libraryAction;
    UIAlertAction *photoAction;
    UIAlertAction *cameraAction;
    UIAlertAction *cancelAction;

    
    alertController = [UIAlertController alertControllerWithTitle:nil
                                                          message:nil
                                                preferredStyle:UIAlertControllerStyleAlert];
    libraryAction = [UIAlertAction actionWithTitle:@"Choose from Library"
                                             style:UIAlertActionStyleDefault
        handler:^(UIAlertAction *action) {
                                               // do destructive stuff here
            UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
            imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            imagePickerController.delegate = self;
            [self presentViewController:imagePickerController animated:YES completion:nil];
            
            }];
    
    photoAction = [UIAlertAction actionWithTitle:@"Photo"
                                           style:UIAlertActionStyleDefault
        handler:^(UIAlertAction *action) {
                                             // do something here
            UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
            imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
            imagePickerController.cameraCaptureMode = UIImagePickerControllerCameraCaptureModePhoto;
            imagePickerController.cameraDevice = UIImagePickerControllerCameraDeviceRear;
            imagePickerController.delegate = self;
            [self presentViewController:imagePickerController animated:YES completion:nil];
                
        }];
    
    cameraAction = [UIAlertAction actionWithTitle:@"Camera"
                                           style:UIAlertActionStyleDefault
         handler:^(UIAlertAction *action) {
             // do something here
             UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
             imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
             imagePickerController.mediaTypes = [NSArray arrayWithObject:(NSString*)kUTTypeMovie];
             imagePickerController.cameraDevice = UIImagePickerControllerCameraDeviceRear;
             imagePickerController.delegate = self;
             [self presentViewController:imagePickerController animated:YES completion:nil];
         }];
    
    cancelAction = [UIAlertAction actionWithTitle:@"Cancel"
                                             style:UIAlertActionStyleCancel
                                           handler:^(UIAlertAction *action) {
                
                                           }];
    // note: you can control the order buttons are shown, unlike UIActionSheet
    [alertController addAction:libraryAction];
    [alertController addAction:photoAction];
    [alertController addAction:cameraAction];
    [alertController addAction:cancelAction];

    [alertController setModalPresentationStyle:UIModalPresentationPopover];
    
    UIPopoverPresentationController *popPresenter = [alertController
                                                     popoverPresentationController];
    popPresenter.sourceView = self.view;
    popPresenter.sourceRect = CGRectMake(100, 100, 100, 100);
    
}

- (IBAction)goBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    //You can retrieve the actual UIImage
    UIImage *image = [info valueForKey:UIImagePickerControllerOriginalImage];
    //Or you can get the image url from AssetsLibrary
    NSURL *path = [info valueForKey:UIImagePickerControllerReferenceURL];
    
    [picker dismissViewControllerAnimated:YES completion:nil];
     
    PhotoViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"PhotoViewController"];
    vc.photoImage = image;
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 588;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TemplateTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"TemplateTableViewCell"];
    
    if (cell == nil) {
        cell = [[TemplateTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"TemplateTableViewCell"];
    }
    
    [cell.temScrollView setContentSize:CGSizeMake(9 * 66, 588)];
    [cell.temScrollView setShowsVerticalScrollIndicator:NO];
    [cell.temScrollView setUserInteractionEnabled:YES];
    
    for (int i = 0; i < 9; i++) {
        NSString *temName = [NSString stringWithFormat:@"tem%ld", (long)i+1];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(8 + i * 66, 6, 58, 10)];
        label.text = [NSString stringWithFormat:@"%ld", (long) i+1];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont fontWithName:@"HelveticaNeue" size:10.0f];
        [cell.temScrollView addSubview:label];
        
        UIImageView *imgTemp1 = [[UIImageView alloc] initWithFrame:CGRectMake(8 + i * 66, 18, 56, 120)];
        imgTemp1.image = [UIImage imageNamed:temName];
        UITapGestureRecognizer *gesture1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onClickTemplateView:)];
        [imgTemp1 addGestureRecognizer:gesture1];
        [imgTemp1 setUserInteractionEnabled:YES];
        [cell.temScrollView addSubview:imgTemp1];
        
        UIImageView *imgTemp2 = [[UIImageView alloc] initWithFrame:CGRectMake(8 + i * 66, 18 + 148 * 1, 56, 120)];
        imgTemp2.image = [UIImage imageNamed:temName];
        UITapGestureRecognizer *gesture2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onClickTemplateView:)];
        [imgTemp2 addGestureRecognizer:gesture2];
        [imgTemp2 setUserInteractionEnabled:YES];
        [cell.temScrollView addSubview:imgTemp2];

        UIImageView *imgTemp3 = [[UIImageView alloc] initWithFrame:CGRectMake(8 + i * 66, 18 + 148 * 2, 56, 120)];
        imgTemp3.image = [UIImage imageNamed:temName];
        UITapGestureRecognizer *gesture3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onClickTemplateView:)];
        [imgTemp3 addGestureRecognizer:gesture3];
        [imgTemp3 setUserInteractionEnabled:YES];
        [cell.temScrollView addSubview:imgTemp3];
        
        UIImageView *imgTemp4 = [[UIImageView alloc] initWithFrame:CGRectMake(8 + i * 66, 18 + 148 * 3, 56, 120)];
        imgTemp4.image = [UIImage imageNamed:temName];
        UITapGestureRecognizer *gesture4 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onClickTemplateView:)];
        [imgTemp4 addGestureRecognizer:gesture4];
        [imgTemp4 setUserInteractionEnabled:YES];
        [cell.temScrollView addSubview:imgTemp4];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self presentViewController:alertController animated:YES completion:nil];

}

-(void) onClickTemplateView:(UITapGestureRecognizer*) sender {
    
    UIView *view = sender.view;
    [UIView animateWithDuration:0.3 animations:^{
        view.alpha = 0.3f;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.3f animations:^{
            view.alpha = 1.f;
        } completion:^(BOOL finished) {
            [self presentViewController:alertController animated:YES completion:nil];
        }];
    }];
}

@end
