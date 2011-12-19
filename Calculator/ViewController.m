//
//  ViewController.m
//  Calculator
//
//  Created by HUI CHEN on 12/18/11.
//  Copyright (c) 2011 ebrary Inc. All rights reserved.
//

#import "ViewController.h"
@interface ViewController()
@property (nonatomic) BOOL userIsInMiddleOfEnteringANumber;
@end

@implementation ViewController
@synthesize display = _display;
@synthesize userIsInMiddleOfEnteringANumber = _userIsInMiddleOfEnteringANumber;
@synthesize digit7 = _digit7;
- (IBAction)digitPressed:(UIButton *)sender {
    NSLog(@"digit %@ is pressed.", sender.currentTitle);
    NSString *digit = sender.currentTitle;
    if (self.userIsInMiddleOfEnteringANumber){
        self.display.text = [self.display.text stringByAppendingString:digit];
        
    }else{
        self.display.text = digit;
        self.userIsInMiddleOfEnteringANumber = YES;
    }
}

- (IBAction)operandPressed:(UIButton *)sender {
}


- (IBAction)enterPressed {
}

- (void)viewDidUnload {
    [self setDigit7:nil];
    [super viewDidUnload];
}
@end
