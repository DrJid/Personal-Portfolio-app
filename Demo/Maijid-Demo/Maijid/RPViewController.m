//
//  RPViewController.m
//  RPSlidingMenuDemo
//
//  Created by Paul Thorsteinson on 2/24/2014.
//  Copyright (c) 2014 Robots and Pencils Inc. All rights reserved.
//

#import "RPViewController.h"


@interface RPViewController ()
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation RPViewController

- (void)viewDidLoad{
    [super viewDidLoad];

    // Example of changing the feature height and collapsed height for all
    self.featureHeight = 400.0f;
//    self.collapsedHeight = 50.0f;
    
//    self.collectionView.backgroundColor = [UIColor redColor];
    
    //Set the background of the CollectionView
    UIImageView *backgroundImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"blue_bg"]];
    
    
    UIImageView *yuscroll = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"yuscroll"]];
    CGRect frame = yuscroll.frame;
   CGAffineTransform t = CGAffineTransformMakeScale(0.7, 0.7);
    CGRect newFrame = CGRectApplyAffineTransform(frame, t);
    [yuscroll setFrame:newFrame];
    
    yuscroll.layer.cornerRadius = 20.0f;
    yuscroll.layer.masksToBounds  = YES;
    
    yuscroll.center = self.collectionView.center;
    [backgroundImageView addSubview:yuscroll];
    
    [backgroundImageView setFrame:self.collectionView.frame];
    self.collectionView.backgroundView = backgroundImageView;
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showName"]) {
        NSLog(@"showName segue called");
    }
    
    if ([segue.identifier isEqualToString:@"showTechSkills"]) {
        NSLog(@"showTechSkills segue called");
    }
}

#pragma mark - RPSlidingMenuViewController


-(NSInteger)numberOfItemsInSlidingMenu{
    // 10 for demo purposes, typically the count of some array
    return 5;
}

- (void)customizeCell:(RPSlidingMenuCell *)slidingMenuCell forRow:(NSInteger)row{
 
    switch (row) {
        case 0: {
            slidingMenuCell.textLabel.text = @"Hi, I'm Maijid";
            slidingMenuCell.detailTextLabel.numberOfLines = 0;
            slidingMenuCell.detailTextLabel.text = @"Welcome!";
            slidingMenuCell.backgroundImageView.image = [UIImage imageNamed:@"me"];
            break;
        }
            
        case 1: {
            slidingMenuCell.textLabel.text = @"Educational";
            slidingMenuCell.detailTextLabel.text = @"Tap to see where I've studied across the world";
            slidingMenuCell.backgroundImageView.image = [UIImage imageNamed:@"grinnell_college_1"];
            break;
        }
            
        case 2:{
            slidingMenuCell.textLabel.text = @"Professional";
            slidingMenuCell.detailTextLabel.text = @"Tap to see some of my featured iOS work";
            slidingMenuCell.backgroundImageView.image = [UIImage imageNamed:@"image2_320x210"];
            break;
        }
        
        case 3: {
            slidingMenuCell.textLabel.text = @"Technical skills";
            slidingMenuCell.detailTextLabel.text = @"Oh wait, there's more!  ";
            slidingMenuCell.backgroundImageView.image = [UIImage imageNamed:@"code_b"];
            break;
        }
            
        case 4: {
            slidingMenuCell.textLabel.text = @"Thank you!";
            slidingMenuCell.detailTextLabel.text = @"Check out my website @ maijid.com";
            slidingMenuCell.backgroundImageView.image = [UIImage imageNamed:@"image1_320x210"];
            break;
        }
            
        default:
            break;
    }
}

- (void)slidingMenu:(RPSlidingMenuViewController *)slidingMenu didSelectItemAtRow:(NSInteger)row{

    [super slidingMenu:slidingMenu didSelectItemAtRow:row];
    
    switch (row) {
        case 0: {
            // do nothing.
            break;
        }
            
        case 1: {
            [self performSegueWithIdentifier:@"showMap" sender:self];
            break;
        }
            
        case 2:{
            [self performSegueWithIdentifier:@"showName" sender:self];
            break;
        }
            
        case 3: {
            [self performSegueWithIdentifier:@"showTechSkills" sender:self];
            break;
        }
            
        case 4: {
            //do nothing.
            break;
        }
            
        default:
            break;
    }
}


@end
