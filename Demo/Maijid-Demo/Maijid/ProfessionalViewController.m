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
@property (weak, nonatomic) IBOutlet UITextView *bottomTextview;
@property (weak, nonatomic) IBOutlet UIImageView *downTriggerImageView;

@property (weak, nonatomic) IBOutlet FBShimmeringView *shimmeringView;
@property (weak, nonatomic) IBOutlet FBShimmeringView *leftShimmeringView;

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
    
    
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(fadeBackButton:) name:@"BTScrolling" object:nil];
    
    self.mediaFocusController = [[URBMediaFocusViewController alloc] init];
    
    UITapGestureRecognizer *leftTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showMediaLeft)];
    
    [self.leftImageView addGestureRecognizer:leftTapGesture];
    
    UITapGestureRecognizer *midTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showMediaMid)];
    
    [self.midImageView addGestureRecognizer:midTapGesture];
    
    
    UITapGestureRecognizer *rightTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showMediaRight)];
    
    [self.rightImageView addGestureRecognizer:rightTapGesture];
    
    
    self.titleLabel.text = self.activity.title;
    self.descriptionTextview.text = self.activity.description;
    
    if (self.activity.leftImage) {
        self.leftImageView.image = self.activity.leftImage;
    } else {
        [self.leftImageView removeFromSuperview];
    }
    
    if (self.activity.midImage) {
        self.midImageView.image = self.activity.midImage;
    } else {
        [self.midImageView removeFromSuperview];
    }
    
    if (self.activity.rightImage) {
        self.rightImageView.image = self.activity.rightImage;
    } else {
        [self.rightImageView removeFromSuperview];
    }
    
//    self.rightImageView.image = self.activity.rightImage;
    self.bottomTextview.text = self.activity.bottomString;
    
    self.leftImageView.clipsToBounds = self.midImageView.clipsToBounds = self.rightImageView.clipsToBounds = YES;
    
    self.leftImageView.layer.cornerRadius = self.midImageView.layer.cornerRadius = self.rightImageView.layer.cornerRadius =10.0f;
    
    self.leftImageView.layer.masksToBounds =  self.midImageView.layer.masksToBounds = self.rightImageView.layer.masksToBounds = YES;

}

- (void)fadeBackButton:(NSNotification *)note {
    float ratio =  [[[note userInfo] valueForKey:@"ratio"] doubleValue];
    self.downTriggerImageView.alpha = 1 - ratio;
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
    swipeRight.text = @">>>";
    swipeRight.textColor = [UIColor whiteColor];
    
    UILabel *swipeLeft = [[UILabel alloc] initWithFrame:self.leftShimmeringView.bounds];
    swipeLeft.textAlignment = NSTextAlignmentCenter;
    swipeLeft.text = @"<<<";
    swipeLeft.textColor = [UIColor whiteColor];
    
    self.leftShimmeringView.contentView = swipeLeft;
    self.leftShimmeringView.shimmeringDirection = FBShimmerDirectionLeft;
    self.shimmeringView.contentView = swipeRight;
//     self.leftShimmeringView.shimmeringSpeed = 100.0f;
    
    self.leftShimmeringView.shimmering = self.shimmeringView.shimmering = YES;
    
    if (![self.activity hasLeft] ) {
        self.leftShimmeringView.hidden = YES;
    }
    
    if (![self.activity hasRight]) {
        self.shimmeringView.hidden = YES;
    }
}

@end
