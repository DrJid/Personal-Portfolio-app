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
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showName"]) {
        NSLog(@"showName segue called");
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
            slidingMenuCell.textLabel.text = @"About me";
            slidingMenuCell.detailTextLabel.numberOfLines = 0;
            slidingMenuCell.detailTextLabel.text = @"Tap to see a little bit more about me. Or m have any tappable content necessarily. If you know \n maijid.com";
            [slidingMenuCell.detailTextLabel sizeToFit];
            slidingMenuCell.backgroundImageView.image = [UIImage imageNamed:@"me"];
            break;
        }
            
        case 1: {
            slidingMenuCell.textLabel.text = @"Educational";
            slidingMenuCell.detailTextLabel.text = @"Formally studied on 3 continents ->";
            slidingMenuCell.backgroundImageView.image = [UIImage imageNamed:@"grinnell_college_1"];
            break;
        }
            
        case 2:{
            slidingMenuCell.textLabel.text = @"Professional";
            slidingMenuCell.detailTextLabel.text = @"I love everything iOS";
            slidingMenuCell.backgroundImageView.image = [UIImage imageNamed:@"image2_320x210"];
            break;
        }
        
        case 3: {
            slidingMenuCell.textLabel.text = @"Technical skills";
            slidingMenuCell.detailTextLabel.text = @"I do more things. ";
            slidingMenuCell.backgroundImageView.image = [UIImage imageNamed:@"image1_320x210"];
            break;
        }
            
        case 4: {
            slidingMenuCell.textLabel.text = @"Other Interests";
            slidingMenuCell.detailTextLabel.text = @"I do things. ";
            slidingMenuCell.backgroundImageView.image = [UIImage imageNamed:@"grinnell_college_1"];
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
            [self performSegueWithIdentifier:@"showName" sender:self];
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
            [self performSegueWithIdentifier:@"showName" sender:self];
            break;
        }
            
        case 4: {
            [self performSegueWithIdentifier:@"showName" sender:self];
            break;
        }
            
        default:
            break;
    }

}


@end
