//
//  TabBarController.m
//  animationDemo
//
//  Created by Timothy Lee on 11/3/14.
//  Copyright (c) 2014 Timothy Lee. All rights reserved.
//

#import "TabBarController.h"
#import "PinkViewController.h"
#import "BlueViewController.h"
#import "GreenViewController.h"

@interface TabBarController ()

@property (weak, nonatomic) IBOutlet UIScrollView *containerView;

@property (nonatomic, strong) PinkViewController *pinkVC;
@property (nonatomic, strong) BlueViewController *blueVC;
@property (nonatomic, strong) GreenViewController *greenVC;

@end

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.pinkVC = [[PinkViewController alloc] init];
    self.blueVC = [[BlueViewController alloc] init];
    self.greenVC = [[GreenViewController alloc] init];
    
    CGRect frame = self.containerView.bounds;
    self.pinkVC.view.frame = frame;
    [self.containerView addSubview:self.pinkVC.view];
    
    frame.origin.x += 320;
    self.blueVC.view.frame = frame;
    [self.containerView addSubview:self.blueVC.view];
    
    frame.origin.x += 320;
    self.greenVC.view.frame = frame;
    [self.containerView addSubview:self.greenVC.view];
    
    self.containerView.contentSize = CGSizeMake(320 * 3, self.containerView.frame.size.height);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onPinkButton:(id)sender {
    [self addChildViewController:self.pinkVC];
    self.pinkVC.view.frame = self.containerView.bounds;
    [self.containerView addSubview:self.pinkVC.view];
    
    self.pinkVC.view.alpha = 0;
    [UIView animateWithDuration:0.2 animations:^{
        self.pinkVC.view.alpha = 1;
    } completion:^(BOOL finished) {
        [self.pinkVC didMoveToParentViewController:self];
    }];
}

- (IBAction)onBlueButton:(id)sender {
    self.blueVC.view.frame = self.containerView.bounds;
    [self.containerView addSubview:self.blueVC.view];
}

- (IBAction)onGreenButton:(id)sender {
    self.greenVC.view.frame = self.containerView.bounds;
    [self.containerView addSubview:self.greenVC.view];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
