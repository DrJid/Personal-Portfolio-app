//
//  NameViewController.m
//  RPSlidingMenuDemo
//
//  Created by Maijid Moujaled on 4/11/14.
//  Copyright (c) 2014 Robots and Pencils Inc. All rights reserved.
//

#import "NameViewController.h"
#import "ProfessionalViewController.h"
#import "ProActivity.h"

@interface NameViewController ()
@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (nonatomic, strong) NSMutableArray *allProActivities;

@end

@implementation NameViewController
{
//    BTGlassScrollView *_glassScrollView;
    
    UIScrollView *_viewScroller;
    
    BTGlassScrollView *_glassScrollView1;
    BTGlassScrollView *_glassScrollView2;
    BTGlassScrollView *_glassScrollView3;
    BTGlassScrollView *_glassScrollView4;
    
    int _page;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _page = 0;
        
    }
    return self;
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.allProActivities = [[NSMutableArray alloc] initWithCapacity:5];
    
    //Create all the proActivities.
    ProActivity *appdev = [[ProActivity alloc] init];
    appdev.title  = @"Co-founder @ Grinnell Appdev";
    appdev.description = @"A student group of developers, designers, community builders that aims to improve the college experience by developing apps for smart devices \n\n Raised over $80,000 to support group activities.";
    appdev.bottomString = @"See more at http://grinnellappdev.com";
    appdev.leftImage = [UIImage imageNamed:@"appdevlogo"];
    appdev.midImage = [UIImage imageNamed:@"appdev"];
    appdev.rightImage = [UIImage imageNamed:@"appdev_apps"];
    
    [self.allProActivities addObject:appdev];
    
    
    ProActivity *barkcare= [[ProActivity alloc] init];
    barkcare.title  = @"HackNY '13 Fellow & iOS Intern \n @ Bark & Co, NYC";
    barkcare.description = @"Architectured and shipped the BarkCare App - A vet in your pocket, 24/7! \n\n This service brings on demand in home vet care to residents in NYC";
    barkcare.bottomString = @"See more at https://www.barkcare.com";
    barkcare.leftImage = [UIImage imageNamed:@"barkcare-demo"];
    barkcare.midImage = [UIImage imageNamed:@"barkcare-message"];
    barkcare.rightImage = [UIImage imageNamed:@"barkcare-promo"];
    
    
    [self.allProActivities addObject:barkcare];
    
    ProActivity *pikuzone= [[ProActivity alloc] init];
    pikuzone.title  = @"iOS Engineer Intern \n @ Pikuzone - Summer '12";
    pikuzone.description = @"Built and shipped Pikuzone iOS app - A walled garden where your child can learn to communicate online";
    pikuzone.bottomString = @"See more at http://pikuzone.com";
    pikuzone.leftImage = [UIImage imageNamed:@"pikuzone_web"];
    pikuzone.midImage = [UIImage imageNamed:@"pikuzone"];
    
    [self.allProActivities addObject:pikuzone];
    
    
    ProActivity *voyse= [[ProActivity alloc] init];
    voyse.title  = @"Co-founder, Developer, Designer \n @ Voyse";
    voyse.description = @"Send encrypted, secure self destructing voice messages to your friends and loved ones! \n\n All voyses are encrypted securely using AES-256 bit encryption.";
    voyse.bottomString = @"See more at http://voyse.me";
    voyse.leftImage = [UIImage imageNamed:@"voyse-playback"];
    voyse.midImage = [UIImage imageNamed:@"voice_icon"];
    voyse.rightImage = [UIImage imageNamed:@"hannah"];
    
    [self.allProActivities addObject:voyse];

    
    
    //showing white status
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    //preventing weird inset
    [self setAutomaticallyAdjustsScrollViewInsets: NO];
    
    //navigation bar work
    NSShadow *shadow = [[NSShadow alloc] init];
    [shadow setShadowOffset:CGSizeMake(1, 1)];
    [shadow setShadowColor:[UIColor blackColor]];
    [shadow setShadowBlurRadius:1];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor], NSShadowAttributeName: shadow};
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.title = @"Awesome App";
    
    //background
    self.view.backgroundColor = [UIColor blackColor];
    
    
    // Set up GlassScrollViews
    CGFloat blackSideBarWidth = 2;
    
    _viewScroller = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width + 2*blackSideBarWidth, self.view.frame.size.height)];
    [_viewScroller setPagingEnabled:YES];
    [_viewScroller setDelegate:self];
    [_viewScroller setShowsHorizontalScrollIndicator:NO];
    [self.view addSubview:_viewScroller];
    [self.view bringSubviewToFront:self.backButton];
    
    _glassScrollView1 = [[BTGlassScrollView alloc] initWithFrame:self.view.frame BackgroundImage:[UIImage imageNamed:@"grinnell_appdev_2"] blurredImage:nil viewDistanceFromBottom:120 foregroundView:[self customViewWithProActivity:self.allProActivities[0]]];
    _glassScrollView2 = [[BTGlassScrollView alloc] initWithFrame:self.view.frame BackgroundImage:[UIImage imageNamed:@"bcare"] blurredImage:nil viewDistanceFromBottom:120 foregroundView:[self customViewWithProActivity:self.allProActivities[1]]];
    _glassScrollView3 = [[BTGlassScrollView alloc] initWithFrame:self.view.frame BackgroundImage:[UIImage imageNamed:@"pikuzone_bg"] blurredImage:nil viewDistanceFromBottom:120 foregroundView:[self customViewWithProActivity:self.allProActivities[2]]];
    _glassScrollView4 = [[BTGlassScrollView alloc] initWithFrame:self.view.frame BackgroundImage:[UIImage imageNamed:@"voyse_bg"] blurredImage:nil viewDistanceFromBottom:120 foregroundView:[self customViewWithProActivity:self.allProActivities[3]]];

    
    [_viewScroller addSubview:_glassScrollView1];
    [_viewScroller addSubview:_glassScrollView2];
    [_viewScroller addSubview:_glassScrollView3];
    [_viewScroller addSubview:_glassScrollView4];
    
    
    
    
}

- (void)viewWillAppear:(BOOL)animated
{
    int page = _page; // resize scrollview can cause setContentOffset off for no reason and screw things up
    
    CGFloat blackSideBarWidth = 2;
    [_viewScroller setFrame:CGRectMake(0, 0, self.view.frame.size.width + 2*blackSideBarWidth, self.view.frame.size.height)];
    [_viewScroller setContentSize:CGSizeMake(4*_viewScroller.frame.size.width, self.view.frame.size.height)];
    
    [_glassScrollView1 setFrame:self.view.frame];
    [_glassScrollView2 setFrame:self.view.frame];
    [_glassScrollView3 setFrame:self.view.frame];
    [_glassScrollView4 setFrame:self.view.frame];
    
    [_glassScrollView2 setFrame:CGRectOffset(_glassScrollView2.bounds, _viewScroller.frame.size.width, 0)];
    [_glassScrollView3 setFrame:CGRectOffset(_glassScrollView3.bounds, 2*_viewScroller.frame.size.width, 0)];
    [_glassScrollView4 setFrame:CGRectOffset(_glassScrollView4.bounds, 3*_viewScroller.frame.size.width, 0)]; 
    
    [_viewScroller setContentOffset:CGPointMake(page * _viewScroller.frame.size.width, _viewScroller.contentOffset.y)];
    _page = page;
    
    
    //show animation trick
    double delayInSeconds = 2.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        // [_glassScrollView1 setBackgroundImage:[UIImage imageNamed:@"background"] overWriteBlur:YES animated:YES duration:1];
    });
}

- (void)viewWillLayoutSubviews
{
    // if the view has navigation bar, this is a great place to realign the top part to allow navigation controller
    // or even the status bar
    
    [_glassScrollView1 setTopLayoutGuideLength:[self.topLayoutGuide length]];
    [_glassScrollView2 setTopLayoutGuideLength:[self.topLayoutGuide length]];
    [_glassScrollView3 setTopLayoutGuideLength:[self.topLayoutGuide length]];
    [_glassScrollView4 setTopLayoutGuideLength:[self.topLayoutGuide length]];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    
}

// customViewWithProfessionalObject

- (UIView *)customViewWithProActivity:(ProActivity *)activity
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    //Should rename this.. to ArticleViewController.. But it was being awkward the last time i tried.
    ProfessionalViewController *pvc = [storyboard instantiateViewControllerWithIdentifier:@"ProfessionalViewController"];
    
    pvc.activity = activity;
    
    [self addChildViewController:pvc];
    [pvc didMoveToParentViewController:self];
    
    return pvc.view;
}
//
//
//- (UIView *)customView
//{
//    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 705)];
//    
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, 310, 120)];
//    //    [label setText:[NSString stringWithFormat:@"%i℉",arc4random_uniform(20) + 60]];
//    label.text = @"Grinnell Appdev";
//    [label setTextColor:[UIColor whiteColor]];
//    [label setFont:[UIFont fontWithName:@"HelveticaNeue" size:40]];
//    [label setShadowColor:[UIColor blackColor]];
//    [label setShadowOffset:CGSizeMake(1, 1)];
//    [label sizeToFit];
//    [view addSubview:label];
//    
//    UIView *box1 = [[UIView alloc] initWithFrame:CGRectMake(5, 140, 310, 125)];
//    box1.layer.cornerRadius = 3;
//    box1.backgroundColor = [UIColor colorWithWhite:0 alpha:.15];
//    [view addSubview:box1];
//    
//    UIView *box2 = [[UIView alloc] initWithFrame:CGRectMake(5, 270, 310, 300)];
//    box2.layer.cornerRadius = 3;
//    box2.backgroundColor = [UIColor colorWithWhite:0 alpha:.15];
//    [view addSubview:box2];
//    
//    UIView *box3 = [[UIView alloc] initWithFrame:CGRectMake(5, 575, 310, 125)];
//    box3.layer.cornerRadius = 3;
//    box3.backgroundColor = [UIColor colorWithWhite:0 alpha:.15];
//    [view addSubview:box3];
//    
////    return view;
//    
//
//     UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//     
//     //Should rename this.. to ArticleViewController.. But it was being awkward the last time i tried.
//     ProfessionalViewController *pvc = [storyboard instantiateViewControllerWithIdentifier:@"ProfessionalViewController"];
//    
////     tvc.article = article;
//    
//     //    [tvc  updateViewConstraints];
//     //    [tvc viewWillLayoutSubviews];
//     
//     [self addChildViewController:pvc];
//     [pvc didMoveToParentViewController:self];
//     
//     return pvc.view;
//    
//    
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat ratio = scrollView.contentOffset.x/scrollView.frame.size.width;
    _page = (int)floor(ratio);
    NSLog(@"%i",_page);
    if (ratio > -1 && ratio < 1) {
        [_glassScrollView1 scrollHorizontalRatio:-ratio];
    }
    if (ratio > 0 && ratio < 2) {
        [_glassScrollView2 scrollHorizontalRatio:-ratio + 1];
    }
    if (ratio > 1 && ratio < 3) {
        [_glassScrollView3 scrollHorizontalRatio:-ratio + 2];
    }
    if (ratio > 2 && ratio < 4) {
        [_glassScrollView4 scrollHorizontalRatio:-ratio + 3];
    }
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    BTGlassScrollView *glass = [self currentGlass];
    
    //can probably be optimized better than this
    //this is just a demonstration without optimization
    [_glassScrollView1 scrollVerticallyToOffset:glass.foregroundScrollView.contentOffset.y];
    [_glassScrollView2 scrollVerticallyToOffset:glass.foregroundScrollView.contentOffset.y];
    [_glassScrollView3 scrollVerticallyToOffset:glass.foregroundScrollView.contentOffset.y];
    [_glassScrollView4 scrollVerticallyToOffset:glass.foregroundScrollView.contentOffset.y];
}

- (BTGlassScrollView *)currentGlass
{
    BTGlassScrollView *glass;
    switch (_page) {
        case 0:
            glass = _glassScrollView1;
            break;
        case 1:
            glass = _glassScrollView2;
            break;
        case 2:
            glass = _glassScrollView3;
        default:
            break;
    }
    return glass;
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [self viewWillAppear:YES];
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
