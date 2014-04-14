//
//  TechSkillsViewController.m
//  RPSlidingMenuDemo
//
//  Created by Maijid Moujaled on 4/12/14.
//  Copyright (c) 2014 Robots and Pencils Inc. All rights reserved.
//

#import "TechSkillsViewController.h"

@interface TechSkillsViewController ()
@property (strong, nonatomic) UIDynamicAnimator *animator;
@property (weak, nonatomic) IBOutlet UIImageView *webTechBadge;
@property (weak, nonatomic) IBOutlet UIImageView *objcBadge;
@property (weak, nonatomic) IBOutlet UIImageView *cBadge;


@property (weak, nonatomic) IBOutlet UIImageView *railsBadge;
@property (weak, nonatomic) IBOutlet UIImageView *nodeBadge;

@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UIImageView *background_imageview;

// Animators
@property (nonatomic, strong) UISnapBehavior *objcSnapBehavior;
@property (nonatomic, strong) UISnapBehavior *webSnapBehavior;
@property (nonatomic, strong) UISnapBehavior *cSnapBehavior;
@property (nonatomic, strong) UISnapBehavior *railsSnapBehavior;
@property (nonatomic, strong) UISnapBehavior *nodeSnapBehavior;

@end

@implementation TechSkillsViewController
{
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (BOOL) prefersStatusBarHidden
{
    return YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.background_imageview.layer.zPosition = -200;
    
    self.backButton.hidden = YES;
    self.backButton.alpha = 0.0f;
    
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];

    
    //ObjC badge setup.
    CGRect orginalFrame = self.objcBadge.frame;
    CGPoint mid = CGPointMake(CGRectGetMidX(orginalFrame), CGRectGetMidY(orginalFrame));
    self.objcBadge.frame = CGRectOffset(self.objcBadge.frame, 0, -200);
    self.objcBadge.layer.zPosition = -10;
    self.objcSnapBehavior = [[UISnapBehavior alloc]initWithItem:self.objcBadge snapToPoint:mid];
    self.objcSnapBehavior.damping = 0.8;
    
    //web badge setup
     orginalFrame = self.webTechBadge.frame;
     mid = CGPointMake(CGRectGetMidX(orginalFrame), CGRectGetMidY(orginalFrame));
    self.webTechBadge.frame = CGRectOffset(self.webTechBadge.frame, 0, 350);
    self.webSnapBehavior = [[UISnapBehavior alloc]initWithItem:self.webTechBadge snapToPoint:mid];
    self.webSnapBehavior.damping = 0.95;
    
    //c badge setup
    orginalFrame = self.cBadge.frame;
    mid = CGPointMake(CGRectGetMidX(orginalFrame), CGRectGetMidY(orginalFrame));
    self.cBadge.frame = CGRectOffset(self.cBadge.frame, 0, 200);
    self.cBadge.layer.zPosition = -5;
    self.cSnapBehavior = [[UISnapBehavior alloc]initWithItem:self.cBadge snapToPoint:mid];
    self.cSnapBehavior.damping = 0.95;
    
    //rails badge setup
    orginalFrame = self.railsBadge.frame;
    mid = CGPointMake(CGRectGetMidX(orginalFrame), CGRectGetMidY(orginalFrame));
    self.railsBadge.frame = CGRectOffset(self.railsBadge.frame, -300, 400);
    self.railsSnapBehavior = [[UISnapBehavior alloc]initWithItem:self.railsBadge snapToPoint:mid];
    self.railsSnapBehavior.damping = 0.9;
    
    //node badge setup
    orginalFrame = self.nodeBadge.frame;
    mid = CGPointMake(CGRectGetMidX(orginalFrame), CGRectGetMidY(orginalFrame));
    self.nodeBadge.frame = CGRectOffset(self.nodeBadge.frame, 300, 400);
    self.nodeSnapBehavior = [[UISnapBehavior alloc]initWithItem:self.nodeBadge snapToPoint:mid];
    self.nodeSnapBehavior.damping = 0.9;
    
   // self.jsBadge.frame = CGRectOffset(self.jsBadge.frame, -200, 0);
   // self.jsSnapBehavior = [[UISnapBehavior alloc] initWithItem:self.jsBadge snapToPoint:CGPointMake(40, 73)];
   // self.jsSnapBehavior.damping = 0.3;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self performSelector:@selector(showObjcBadge) withObject:nil afterDelay:0.4f];
    [self performSelector:@selector(showWebTechBadge) withObject:nil afterDelay:1.0f];
    [self performSelector:@selector(showCBadge) withObject:nil afterDelay:1.6f];
    [self performSelector:@selector(showRailsBadge) withObject:nil afterDelay:2.2f];
    [self performSelector:@selector(showNodeBadge) withObject:nil afterDelay:2.2f];
    [self performSelector:@selector(showBackButton) withObject:nil afterDelay:3.2f];
    
    //Show the back button now.
    
}

- (void)showObjcBadge
{
    [self.animator addBehavior:self.objcSnapBehavior];
}

- (void)showWebTechBadge
{
    [self.animator addBehavior:self.webSnapBehavior];
}

- (void)showCBadge
{
    [self.animator addBehavior:self.cSnapBehavior];
}

- (void)showRailsBadge
{
    [self.animator addBehavior:self.railsSnapBehavior];
}

- (void)showNodeBadge
{
    [self.animator addBehavior:self.nodeSnapBehavior];
}

- (void)showBackButton
{
    self.backButton.hidden = NO;
    [UIView animateWithDuration:0.6f animations:^{
        self.backButton.alpha = 1.0f;
    
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)goBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
