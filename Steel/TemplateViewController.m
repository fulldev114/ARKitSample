//
//  TemplateViewController.m
//  Steel
//
//  Created by Admin on 3/28/18.
//  Copyright © 2018 Admin. All rights reserved.
//

#import "TemplateViewController.h"
#import "TemplateTableViewCell.h"

@interface TemplateViewController ()  <UITableViewDataSource, UITableViewDelegate>

@end

@implementation TemplateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
    
    [cell.temScrollView setContentSize:CGSizeMake(6 * 66, 588)];
    [cell.temScrollView setShowsVerticalScrollIndicator:NO];
    
    for (int i = 0; i < 6; i++) {
        NSString *temName = [NSString stringWithFormat:@"tem%ld", (long)i+1];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(8 + i * 66, 6, 58, 10)];
        label.text = [NSString stringWithFormat:@"%ld", (long) i+1];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont fontWithName:@"HelveticaNeue" size:10.0f];
        [cell.temScrollView addSubview:label];
        
        UIImageView *imgTemp1 = [[UIImageView alloc] initWithFrame:CGRectMake(8 + i * 66, 18, 56, 120)];
        imgTemp1.image = [UIImage imageNamed:temName];
        [cell.temScrollView addSubview:imgTemp1];
        
        UIImageView *imgTemp2 = [[UIImageView alloc] initWithFrame:CGRectMake(8 + i * 66, 18 + 148 * 1, 56, 120)];
        imgTemp2.image = [UIImage imageNamed:temName];
        [cell.temScrollView addSubview:imgTemp2];

        UIImageView *imgTemp3 = [[UIImageView alloc] initWithFrame:CGRectMake(8 + i * 66, 18 + 148 * 2, 56, 120)];
        imgTemp3.image = [UIImage imageNamed:temName];
        [cell.temScrollView addSubview:imgTemp3];
        
        UIImageView *imgTemp4 = [[UIImageView alloc] initWithFrame:CGRectMake(8 + i * 66, 18 + 148 * 3, 56, 120)];
        imgTemp4.image = [UIImage imageNamed:temName];
        [cell.temScrollView addSubview:imgTemp4];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

}

@end
