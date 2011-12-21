//
//  CalculatorBrain.h
//  Calculator
//
//  Created by HUI CHEN on 12/19/11.
//  Copyright (c) 2011 ebrary Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject
@property (nonatomic,strong) NSMutableArray *operandStack;

-(void)pushOperand: (double)operand;

-(double)performOperation: (NSString *)operation;

-(double)popOperand;

@end
