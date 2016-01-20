//
//  LPAViewController.m
//  Autolayout
//
//  Created by Steven Masuch on 2014-07-20.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import "LPAViewController.h"

@interface LPAViewController ()

@property (nonatomic, weak) UIButton *  squareButton;
@property (nonatomic, weak) UIButton *  portraitButton;
@property (nonatomic, weak) UIButton *  landscapeButton;

@property (nonatomic, weak) UIView *                framingView;
@property (nonatomic, weak) NSLayoutConstraint *    framingViewHeight;
@property (nonatomic, weak) NSLayoutConstraint *    framingViewWidth;

@property (nonatomic, strong) UIView *purpleView;
@property (nonatomic, strong) UIView *redView;
@property (nonatomic, strong) UIView *orangeLeftView;
@property (nonatomic, strong) UIView *orangeRightView;

@property (nonatomic, strong) UIView *blueTopView;
@property (nonatomic, strong) UIView *blueMiddleView;
@property (nonatomic, strong) UIView *blueBottomView;

@property (nonatomic, strong) UIView *transparentView;

@end

@implementation LPAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton *squareButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [squareButton setTitle:@"Square" forState:UIControlStateNormal];
    [squareButton addTarget:self action:@selector(resizeFramingView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:squareButton];
    squareButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.squareButton = squareButton;
    
    UIButton *portraitButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [portraitButton setTitle:@"Portrait" forState:UIControlStateNormal];
    [portraitButton addTarget:self action:@selector(resizeFramingView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:portraitButton];
    portraitButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.portraitButton = portraitButton;
    
    UIButton *landscapeButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [landscapeButton setTitle:@"Landscape" forState:UIControlStateNormal];
    [landscapeButton addTarget:self action:@selector(resizeFramingView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:landscapeButton];
    landscapeButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.landscapeButton = landscapeButton;
    
    UIView *framingView = [[UIView alloc] initWithFrame:CGRectZero];
    framingView.translatesAutoresizingMaskIntoConstraints = NO;
    framingView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:framingView];
    self.framingView = framingView;
    
    NSString *buttonsHorizontalConstraints = @"|[squareButton(==portraitButton)][portraitButton(==landscapeButton)][landscapeButton]|";
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:buttonsHorizontalConstraints
                                                                      options:NSLayoutFormatAlignAllCenterY
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(squareButton, portraitButton, landscapeButton)]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:squareButton
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.0
                                                           constant:-50.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:framingView
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0
                                                           constant:0.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:framingView
                                                          attribute:NSLayoutAttributeCenterY
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterY
                                                         multiplier:1.0
                                                           constant:-50.0]];
    
    NSLayoutConstraint *framingViewHeight = [NSLayoutConstraint constraintWithItem:framingView
                                                                         attribute:NSLayoutAttributeHeight
                                                                         relatedBy:NSLayoutRelationEqual
                                                                            toItem:nil
                                                                         attribute:NSLayoutAttributeNotAnAttribute
                                                                        multiplier:1.0
                                                                          constant:500.0];
    
    NSLayoutConstraint *framingViewWidth = [NSLayoutConstraint constraintWithItem:framingView
                                                                        attribute:NSLayoutAttributeWidth
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:nil
                                                                        attribute:NSLayoutAttributeNotAnAttribute
                                                                       multiplier:1.0
                                                                         constant:500.0];
    
    [framingView addConstraint:framingViewHeight];
    [framingView addConstraint:framingViewWidth];
    
    self.framingViewHeight = framingViewHeight;
    self.framingViewWidth = framingViewWidth;
    
    // Set up your views and constraints here
    
    UIView *purpleView = [[UIView alloc] initWithFrame:CGRectZero];
    purpleView.translatesAutoresizingMaskIntoConstraints = NO;
    purpleView.backgroundColor = [UIColor purpleColor];
    [self.framingView addSubview:purpleView];
    self.purpleView = purpleView;
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:purpleView
                                                          attribute:NSLayoutAttributeRight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:framingView
                                                          attribute:NSLayoutAttributeRight
                                                         multiplier:1.0
                                                           constant:-20.0]];

    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:purpleView
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:framingView
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.0
                                                           constant:-20.0]];
  
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:purpleView
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:framingView
                                                          attribute:NSLayoutAttributeWidth
                                                         multiplier:(305.0/500.0)
                                                           constant:0.0]];

    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:purpleView
                                                          attribute:NSLayoutAttributeHeight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:nil
                                                          attribute:NSLayoutAttributeNotAnAttribute
                                                         multiplier:1.0
                                                           constant:50.0]];
    
    //red boxes creation
    
    UIView *redView = [[UIView alloc] initWithFrame:CGRectZero];
    redView.translatesAutoresizingMaskIntoConstraints = NO;
    redView.backgroundColor = [UIColor redColor];
    [self.framingView addSubview:redView];
    self.redView = redView;

    // orangeLeft boxe creation
    
    UIView *orangeLeftView = [[UIView alloc] initWithFrame:CGRectZero];
    orangeLeftView.translatesAutoresizingMaskIntoConstraints = NO;
    orangeLeftView.backgroundColor = [UIColor orangeColor];
    [self.redView addSubview:orangeLeftView];
    self.orangeLeftView = orangeLeftView;
    
    
    // orangeRight boxe creation
    
    UIView *orangeRightView = [[UIView alloc] initWithFrame:CGRectZero];
    orangeRightView.translatesAutoresizingMaskIntoConstraints = NO;
    orangeRightView.backgroundColor = [UIColor orangeColor];
    [self.redView addSubview:orangeRightView];
    self.orangeRightView = orangeRightView;
    
    // transparent box creation
    
    UIView *transparentView = [[UIView alloc] initWithFrame:CGRectZero];
    transparentView.translatesAutoresizingMaskIntoConstraints = NO;
    transparentView.backgroundColor = [UIColor clearColor];
    [self.framingView addSubview:transparentView];
    self.transparentView = transparentView;
    
    // blue top boxe creation
    
    UIView *blueTopView = [[UIView alloc] initWithFrame:CGRectZero];
    blueTopView.translatesAutoresizingMaskIntoConstraints = NO;
    blueTopView.backgroundColor = [UIColor blueColor];
    [self.framingView addSubview:blueTopView];
    //self.blueTopView = blueTopView;
    
    
    // blue middle boxe creation

    UIView *blueMiddleView = [[UIView alloc] initWithFrame:CGRectZero];
    blueMiddleView.translatesAutoresizingMaskIntoConstraints = NO;
    blueMiddleView.backgroundColor = [UIColor blueColor];
    [self.framingView addSubview:blueMiddleView];
    //self.blueMiddleView = blueMiddleView;

    // blue bottom boxe creation
    
    UIView *blueBottomView = [[UIView alloc] initWithFrame:CGRectZero];
    blueBottomView.translatesAutoresizingMaskIntoConstraints = NO;
    blueBottomView.backgroundColor = [UIColor blueColor];
    [self.framingView addSubview:blueBottomView];
    //self.blueBottomView = blueBottomView;
    
    // constraints on the transparent box
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:transparentView
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:nil
                                                          attribute:NSLayoutAttributeNotAnAttribute
                                                         multiplier:1.0
                                                           constant:50.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:transparentView
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:framingView
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0
                                                           constant:0.0]];

    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:transparentView
                                                          attribute:NSLayoutAttributeCenterY
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:framingView
                                                          attribute:NSLayoutAttributeCenterY
                                                         multiplier:1.0
                                                           constant:0.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:transparentView
                                                          attribute:NSLayoutAttributeHeight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:framingView
                                                          attribute:NSLayoutAttributeHeight
                                                         multiplier:0.65
                                                           constant:0.0]];
    
    //Constraints on blue top box
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:blueTopView
                                                          attribute:NSLayoutAttributeHeight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:nil
                                                          attribute:NSLayoutAttributeNotAnAttribute
                                                         multiplier:1.0
                                                           constant:50.0]];
 
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:blueTopView
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:nil
                                                          attribute:NSLayoutAttributeNotAnAttribute
                                                         multiplier:1.0
                                                           constant:50.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:blueTopView
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:framingView
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0
                                                           constant:0.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:blueTopView
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:transparentView
                                                          attribute:NSLayoutAttributeTop
                                                         multiplier:1.0
                                                           constant:0.0]];

    
    //constraints on blue middle box
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:blueMiddleView
                                                          attribute:NSLayoutAttributeHeight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:nil
                                                          attribute:NSLayoutAttributeNotAnAttribute
                                                         multiplier:1.0
                                                           constant:50.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:blueMiddleView
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:nil
                                                          attribute:NSLayoutAttributeNotAnAttribute
                                                         multiplier:1.0
                                                           constant:50.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:blueMiddleView
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:framingView
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0
                                                           constant:0.0]];

    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:blueMiddleView
                                                          attribute:NSLayoutAttributeCenterY
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:framingView
                                                          attribute:NSLayoutAttributeCenterY
                                                         multiplier:1.0
                                                           constant:0.0]];
    
    
    //constraints on blue bottom box
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:blueBottomView
                                                          attribute:NSLayoutAttributeHeight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:nil
                                                          attribute:NSLayoutAttributeNotAnAttribute
                                                         multiplier:1.0
                                                           constant:50.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:blueBottomView
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:nil
                                                          attribute:NSLayoutAttributeNotAnAttribute
                                                         multiplier:1.0
                                                           constant:50.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:blueBottomView
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:framingView
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0
                                                           constant:0.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:blueBottomView
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:transparentView
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.0
                                                           constant:0.0]];
    
    
    //constraints on red box
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:redView
                                                          attribute:NSLayoutAttributeRight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:framingView
                                                          attribute:NSLayoutAttributeRight
                                                         multiplier:1.0
                                                           constant:-20.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:redView
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:framingView
                                                          attribute:NSLayoutAttributeTop
                                                         multiplier:1.0
                                                           constant:20.0]];
    
    
    // constraints on left orange
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:orangeLeftView
                                                          attribute:NSLayoutAttributeHeight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:nil
                                                          attribute:NSLayoutAttributeNotAnAttribute
                                                         multiplier:1.0
                                                           constant:30.0]];
 
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:orangeLeftView
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:nil
                                                          attribute:NSLayoutAttributeNotAnAttribute
                                                         multiplier:1.0
                                                           constant:70.0]];
    

    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:orangeLeftView
                                                          attribute:NSLayoutAttributeLeft
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:redView
                                                          attribute:NSLayoutAttributeLeftMargin
                                                         multiplier:1.0
                                                           constant:0.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:orangeLeftView
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:redView
                                                          attribute:NSLayoutAttributeBottomMargin
                                                         multiplier:1.0
                                                           constant:0.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:orangeLeftView
                                                          attribute:NSLayoutAttributeTrailing
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:orangeRightView
                                                          attribute:NSLayoutAttributeLeading
                                                         multiplier:1.0
                                                           constant:-8.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:orangeLeftView
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:redView
                                                          attribute:NSLayoutAttributeTopMargin
                                                         multiplier:1.0
                                                           constant:0.0]];
    
    //constraints on right orange

    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:orangeRightView
                                                          attribute:NSLayoutAttributeHeight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:nil
                                                          attribute:NSLayoutAttributeNotAnAttribute
                                                         multiplier:1.0
                                                           constant:30.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:orangeRightView
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:nil
                                                          attribute:NSLayoutAttributeNotAnAttribute
                                                         multiplier:1.0
                                                           constant:50.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:orangeRightView
                                                          attribute:NSLayoutAttributeRight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:redView
                                                          attribute:NSLayoutAttributeRightMargin
                                                         multiplier:1.0
                                                           constant:0.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:orangeRightView
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:redView
                                                          attribute:NSLayoutAttributeBottomMargin
                                                         multiplier:1.0
                                                           constant:0.0]];

    
}

- (void)resizeFramingView:(id)sender
{
    CGFloat newWidth = 0.0;
    CGFloat newHeight = 0.0;
    
    if (sender == self.squareButton) {
        newWidth = 500.0;
        newHeight = 500.0;
    } else if (sender == self.portraitButton) {
        newWidth = 350.0;
        newHeight = 550.0;
    } else if (sender == self.landscapeButton) {
        newWidth = 900.0;
        newHeight = 300.0;
    }
    
    [UIView animateWithDuration:2.0 animations:^(){
        self.framingViewHeight.constant = newHeight;
        self.framingViewWidth.constant = newWidth;
        [self.view layoutIfNeeded];
    }];
}

@end
