//
//  ProfessionalViewController.m
//  RPSlidingMenuDemo
//
//  Created by Maijid Moujaled on 4/12/14.
//  Copyright (c) 2014 Robots and Pencils Inc. All rights reserved.
//

#import "ProfessionalViewController.h"
#import "URBMediaFocusViewController.h"
#import "FBShimmering.h"
#import "FBShimmeringView.h"
@import QuartzCore;

@interface ProfessionalViewController ()
@property (nonatomic, strong) URBMediaFocusViewController *mediaFocusController;


@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITextView *descriptionTextview;


@property (weak, nonatomic) IBOutlet UIImageView *leftImageView;
@property (weak, nonatomic) IBOutlet UIImageView *midImageView;
@property (weak, nonatomic) IBOutlet UIImageView *rightImageView;
@property (weak, nonatomic) IBOutlet UILabel *bottomLabel;

@property (weak, nonatomic) IBOutlet FBShimmeringView *shimmeringView;

@end

@implementation ProfessionalViewController

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
    // Do any additional setup after loading the view.
    
    self.mediaFocusController = [[URBMediaFocusViewController alloc] init];
    
    UITapGestureRecognizer *leftTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showMediaLeft)];
    
    [self.leftImageView addGestureRecognizer:leftTapGesture];
    
    UITapGestureRecognizer *midTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showMediaMid)];
    
    [self.midImageView addGestureRecognizer:midTapGesture];
    
    
    UITapGestureRecognizer *rightTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showMediaRight)];
    
    [self.rightImageView addGestureRecognizer:rightTapGesture];
    
    
    self.titleLabel.text = self.activity.title;
    self.descriptionTextview.text = self.activity.description;
    self.leftImageView.image = self.activity.leftImage;
    self.midImageView.image = self.activity.midImage;
    self.rightImageView.image = self.activity.rightImage;
    
    self.leftImageView.clipsToBounds = self.midImageView.clipsToBounds = self.rightImageView.clipsToBounds = YES;
    
    self.leftImageView.layer.cornerRadius = self.midImageView.layer.cornerRadius = self.rightImageView.layer.cornerRadius =10.0f;
    
    self.leftImageView.layer.masksToBounds =  self.midImageView.layer.masksToBounds = self.rightImageView.layer.masksToBounds = YES;

}

- (void)showMediaLeft
{
    [self.mediaFocusController showImage:self.leftImageView.image fromView:self.view];
}

- (void)showMediaMid
{
    [self.mediaFocusController showImage:self.midImageView.image fromView:self.view];
}

- (void)showMediaRight
{
    [self.mediaFocusController showImage:self.rightImageView.image fromView:self.view];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    
    UILabel *swipeRight = [[UILabel alloc] initWithFrame:self.shimmeringView.bounds];
    swipeRight.textAlignment = NSTextAlignmentCenter;
    swipeRight.text = NSLocalizedString(@">>>", nil);
    self.shimmeringView.contentView = swipeRight;

    self.shimmeringView.shimmering = YES;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
