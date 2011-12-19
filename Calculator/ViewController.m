//
//  ViewController.m
//  Calculator
//
//  Created by HUI CHEN on 12/18/11.
//  Copyright (c) 2011 ebrary Inc. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController
@synthesize display = _display;
@synthesize digit7 = _digit7;
- (IBAction)digitPressed:(UIButton *)sender {
    NSLog(@"digit %@ is pressed.", sender.currentTitle);
    self.display.text = sender.currentTitle;
}


- (void)viewDidUnload {
    [self setDigit7:nil];
    [super viewDidUnload];
}
@end
