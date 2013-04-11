//
//  ViewController.m
//  CarmerSample
//
//  Created by Mars on 13-4-11.
//  Copyright (c) 2013年 Mars. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    _imageView.image = [UIImage imageNamed:@"carmer.png"];
    [self.view addSubview:_imageView];
    
    _actionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _actionBtn.frame = CGRectMake(120, 380, 80, 80);
    [_actionBtn addTarget:self action:@selector(actionNow:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_actionBtn];
}

-(void)actionNow:(id)sender
{
    CATransition *transition = [CATransition animation];
    
    transition.duration = 0.3f;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionMoveIn;
    transition.subtype = kCATransitionFromBottom;
    
    _rewordView = [[UIView alloc] initWithFrame:CGRectMake(10, 10, 300, 60)];
    _rewordView.backgroundColor = [UIColor lightTextColor];
    
    UIImageView *iconImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 7, 46, 46)];
    iconImage.image = [UIImage imageNamed:@"icon_carmer.png"];
    [_rewordView addSubview:iconImage];
    [iconImage release];
    
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(75, 0, 200, 30)];
    nameLabel.backgroundColor = [UIColor clearColor];
    nameLabel.text = @"恭喜你获得了MiMi大礼!";
    nameLabel.textColor = [UIColor brownColor];
    [_rewordView addSubview:nameLabel];
    [nameLabel release];
    
    UILabel *rewardLabel = [[UILabel alloc] initWithFrame:CGRectMake(70, 30, 230, 30)];
    rewardLabel.backgroundColor = [UIColor clearColor];
    rewardLabel.textColor = [UIColor purpleColor];
    rewardLabel.font = [UIFont systemFontOfSize:14.0f];
    rewardLabel.text = @"你拍了200张照片. 点击获取大礼.";
    [_rewordView addSubview:rewardLabel];
    [rewardLabel release];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] init];
    [tap addTarget:self action:@selector(tapGesture:)];
    [_rewordView addGestureRecognizer:tap];
    [tap release];
    
    [self.view addSubview:_rewordView];
    
    [_rewordView.layer addAnimation:transition forKey:@"transition"];
}

-(void)tapGesture:(UITapGestureRecognizer *)tap
{
    [_rewordView removeFromSuperview];
    
    _rewardView = [[UIView alloc] initWithFrame:CGRectMake(15, 30, 290, 400)];
    _rewardView.backgroundColor = [UIColor grayColor];
    
    UIImageView *picImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 290, 230)];
    picImage.image = [UIImage imageNamed:@"show.jpg"];
    picImage.layer.cornerRadius = 5.0f;
    picImage.layer.masksToBounds = YES;
    picImage.layer.borderWidth = 2.0f;
    picImage.layer.shadowColor = [UIColor blueColor].CGColor;
    picImage.layer.shadowRadius = 20.0f;
    picImage.layer.shadowOpacity = 1.0f;
    picImage.layer.shadowOffset = CGSizeMake(25, 25);
    [_rewardView addSubview:picImage];
    [picImage release];
    
    UIButton *cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    cancelBtn.frame = CGRectMake(-8, -10, 30, 30);
    [cancelBtn setImage:[UIImage imageNamed:@"weibo-cancel.png"] forState:UIControlStateNormal];
    [_rewardView addSubview:cancelBtn];
    
    UILabel *rewardLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 240, 90, 30)];
    rewardLabel.text = @"获奖缘由：";
    rewardLabel.textColor = [UIColor lightTextColor];
    rewardLabel.backgroundColor = [UIColor clearColor];
    [_rewardView addSubview:rewardLabel];
    
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(90, 240, 150, 30)];
    nameLabel.textColor = [UIColor orangeColor];
    nameLabel.font = [UIFont systemFontOfSize:20.0f];
    nameLabel.backgroundColor =[UIColor clearColor];
    nameLabel.text = @"拍了200张照片";
    [_rewardView addSubview:nameLabel];
    [nameLabel release];
    
    UILabel *emailLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 270, 300, 30)];
    emailLabel.backgroundColor = [UIColor clearColor];
    emailLabel.textColor = [UIColor lightTextColor];
    emailLabel.text = @"请输入正确的邮箱,以便获取奖品.";
    [_rewardView addSubview:emailLabel];
    [emailLabel release];
    
    UITextField *emailField = [[UITextField alloc] initWithFrame:CGRectMake(10, 300, 240, 40)];
    emailField.borderStyle = UITextBorderStyleRoundedRect;
    emailField.delegate = self;
    [_rewardView addSubview:emailField];
    [emailField release];
    
    [self.view addSubview:_rewardView];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return  YES;
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    [UIView beginAnimations:@"animation" context:nil];
    [UIView setAnimationDuration:0.5f];
//    _rewardView.frame = CGRectMake(15, -50, 290, 230);
    
    [UIView commitAnimations];
    return YES;
}

-(BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    [UIView beginAnimations:@"animation" context:nil];
    [UIView setAnimationDuration:0.5f];
//    _rewardView.frame = CGRectMake(15, 30, 290, 230);
    [self.view addSubview:_rewardView];
    [UIView commitAnimations];
    
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
