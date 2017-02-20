//
//  ViewController.m
//  Marquee
//
//  Created by jcz on 2017/2/20.
//  Copyright © 2017年 jcz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    CABasicAnimation *rotationAnimation;
    NSTimer *myTimer;
    
    CGFloat marqueeAngleInt;
}
@property (nonatomic,strong) UIImageView *marqueeImageView;

@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    marqueeAngleInt = 0;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [myTimer invalidate];
    myTimer = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.marqueeImageView = [[UIImageView alloc] initWithFrame:CGRectMake(53, 37, [UIScreen mainScreen].bounds.size.width - 106, [UIScreen mainScreen].bounds.size.width - 106)];
    self.marqueeImageView.image = [UIImage imageNamed:@"icon_bg_turntable"];
    [self.view addSubview:self.marqueeImageView];
    
    myTimer = [NSTimer scheduledTimerWithTimeInterval:0.6 target:self selector:@selector(lotteryViewBgAction) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:myTimer forMode:NSDefaultRunLoopMode];
}

- (void)lotteryViewBgAction {
    CGAffineTransform transform= CGAffineTransformMakeRotation(marqueeAngleInt);
    self.marqueeImageView.transform = transform;
    marqueeAngleInt -= 45;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
