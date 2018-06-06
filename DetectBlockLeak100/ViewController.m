//
//  ViewController.m
//  DetectBlockLeak100
//
//  Created by MaxwellMaxwell on 5/31/18.
//  Copyright © 2018 MaxwellMaxwell. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self CreateLeak];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) CreateLeak{
    NSLog(@"\ncreate a block that will cause a memory leak\n");
    
    [self letsDoIt:^{
        NSLog(@"\ncallBack block was called.\nPlace all of your callBack code here. It will run after the letsDoIt main body call it.\n");
    }];
}

-(void) letsDoIt:(void (^)(void))callBack
{
    NSLog(@"\n (void) letsDoIt:(void (^)(void))callBack method's code body goes here\n...calling the callBack block when this method's body is finished running its code.\n");
   // [self performSelector:@selector(delayedMethod) withObject:nil afterDelay:3.5];
    callBack();
    
}

@end
