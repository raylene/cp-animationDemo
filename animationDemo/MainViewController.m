//
//  MainViewController.m
//  animationDemo
//
//  Created by Timothy Lee on 11/3/14.
//  Copyright (c) 2014 Timothy Lee. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController () <UIGestureRecognizerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *bikerView;
@property (strong, nonatomic) IBOutlet UIPinchGestureRecognizer *pinchGesture;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.bikerView.alpha = 0.5;
    
    self.pinchGesture.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onGo:(id)sender {
    self.bikerView.alpha = 0.5;
    [UIView animateWithDuration:0.4 delay:0 usingSpringWithDamping:0.1 initialSpringVelocity:50 options:0 animations:^{
        self.bikerView.alpha = 1;
        self.bikerView.transform = CGAffineTransformMakeScale(3, 3);
        
        CGRect frame = self.bikerView.frame;
        frame.origin.y += 300;
        self.bikerView.frame = frame;
    } completion:^(BOOL finished) {
        self.bikerView.transform = CGAffineTransformRotate(self.bikerView.transform, -10 * M_PI / 180);
        
        [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse animations:^{
            self.bikerView.transform = CGAffineTransformRotate(self.bikerView.transform, 20 * M_PI / 180);
        } completion:nil];
    }];
}

- (IBAction)onPanGesture:(UIPanGestureRecognizer *)sender {

}
- (IBAction)onLongPress:(UILongPressGestureRecognizer *)sender {
    CGPoint location = [sender locationInView:self.view];
    
    if (sender.state == UIGestureRecognizerStateBegan) {
        NSLog(@"gesture began");
        [UIView animateWithDuration:0.2 animations:^{
            self.bikerView.transform = CGAffineTransformMakeScale(1.2, 1.2);
        }];
    } else if (sender.state == UIGestureRecognizerStateChanged) {
        NSLog(@"gesture changed");
        self.bikerView.center = location;
    } else if (sender.state == UIGestureRecognizerStateEnded) {
        NSLog(@"gesture ended");
        [UIView animateWithDuration:0.2 animations:^{
            self.bikerView.transform = CGAffineTransformMakeScale(1, 1);
        }];
    }
}

- (IBAction)onTapGesture:(UITapGestureRecognizer *)sender {
    NSLog(@"You tapped Mr. T!");
}

- (IBAction)onSwipe:(UISwipeGestureRecognizer *)sender {
    NSLog(@"You swiped Mr. T!");
}

- (IBAction)onPinchGesture:(UIPinchGestureRecognizer *)sender {
    NSLog(@"scale: %f", sender.scale);
    self.bikerView.transform = CGAffineTransformMakeScale(sender.scale, sender.scale);
}

- (IBAction)onRotateGesture:(UIRotationGestureRecognizer *)sender {
    NSLog(@"rotation: %f", sender.rotation);
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
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
