//
//  ViewController.h
//  Calculator
//
//  Created by HUI CHEN on 12/18/11.
//  Copyright (c) 2011 ebrary Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CalculatorBrain.h"

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *display;
@property (nonatomic, strong) CalculatorBrain *brain;

@end
