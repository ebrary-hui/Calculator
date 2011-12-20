//
//  CalculatorBrain.m
//  Calculator
//
//  Created by HUI CHEN on 12/19/11.
//  Copyright (c) 2011 ebrary Inc. All rights reserved.
//

#import "CalculatorBrain.h"

@implementation CalculatorBrain

@synthesize operandStack = _operandStack;

-(NSMutableArray *)operandStack{
    if (_operandStack == nil){
        _operandStack = [[NSMutableArray alloc] init];
    }
    return _operandStack;
}

-(void)setOperand:(double)operand{
    [self.operandStack addObject:[NSNumber numberWithDouble:operand]];
}

-(double)popOperand{
    NSNumber *operand = [self.operandStack lastObject];
    if (operand){
        [self.operandStack removeLastObject];
    }
    return [operand doubleValue]; 
}

@end
