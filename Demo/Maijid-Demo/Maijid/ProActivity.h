//
//  ProActivity.h
//  RPSlidingMenuDemo
//
//  Created by Maijid Moujaled on 4/12/14.
//  Copyright (c) 2014 Robots and Pencils Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProActivity : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *description;
@property (nonatomic, strong) UIImage *leftImage;
@property (nonatomic, strong) UIImage *midImage;
@property (nonatomic, strong) UIImage *rightImage;
@property (nonatomic, strong) NSString *bottomString;

@property (nonatomic, assign) BOOL hasLeft;
@property (nonatomic, assign) BOOL hasRight;

@end
