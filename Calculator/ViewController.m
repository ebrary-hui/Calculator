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
- (IBAction)decimalPointPressed {
    NSLog(@"Decimal point pressed");
}

- (IBAction)digitPressed:(UIButton *)sender {
    NSString *digit = sender.currentTitle;
    NSString *currentText = self.display.text;
    if ([@"." isEqualToString: digit]){
        NSRange range = [currentText rangeOfString:@"."];
        if (range.location != NSNotFound){
            return;
        }
    }
    if (self.userIsInMiddleOfEnteringANumber){
        currentText = [self.display.text stringByAppendingString:digit];
    }else{
        currentText = digit;
        self.userIsInMiddleOfEnteringANumber = YES;
    }
    self.display.text = currentText;
}

- (IBAction)enterPressed {
    [self.brain pushOperand:[self.display.text doubleValue]];
    self.userIsInMiddleOfEnteringANumber = NO;
}


- (IBAction)operationPressed:(UIButton *)sender {
    if (self.userIsInMiddleOfEnteringANumber) [self enterPressed];
    self.userIsInMiddleOfEnteringANumber = NO;
    NSString *resultString = [NSString stringWithFormat:@"%g", [self.brain performOperation:sender.currentTitle]];
    self.display.text = resultString;
}


- (void)viewDidUnload {
    [super viewDidUnload];
}
@end
