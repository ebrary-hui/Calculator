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
@synthesize brain = _brain;

@synthesize userIsInMiddleOfEnteringANumber = _userIsInMiddleOfEnteringANumber;

- (CalculatorBrain *) brain{
    if (_brain == nil){
        _brain = [[CalculatorBrain alloc] init];
    }
    return _brain;
}
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

- (IBAction)operationPressed:(UIButton *)sender {
    NSString *operand = sender.currentTitle;
    self.userIsInMiddleOfEnteringANumber = NO;
    if ([@"+" isEqualToString:operand]){
        
    }
}


- (IBAction)enterPressed {
    [self.brain setOperand:[self.display.text doubleValue]];
}

- (void)viewDidUnload {
    [super viewDidUnload];
}
@end
