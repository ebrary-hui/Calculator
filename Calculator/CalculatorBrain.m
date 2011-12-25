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

-(void)pushOperand:(double)operand{
    [self.operandStack addObject:[NSNumber numberWithDouble:operand]];
}

-(double)popOperand{
    NSNumber *operand = [self.operandStack lastObject];
    if (operand){
        [self.operandStack removeLastObject];
    }
    return [operand doubleValue]; 
}

-(double)performOperation: (NSString *)operation{
    double result = 0;
    if ([operation isEqualToString:@"+"]) {
        result = [self popOperand] + [self popOperand];
    } else if ([@"-" isEqualToString:operation]) {
        double b = [self popOperand];
        result = [self popOperand] - b;
        
    } else if ([@"*" isEqualToString:operation]) {
        result = [self popOperand] * [self popOperand];
    } else if ([@"sin" isEqualToString:operation]) {
        result = sin([self popOperand]);
    } else if ([@"cos" isEqualToString:operation]) {
        result = cos([self popOperand]);
    } else if ([@"sqrt" isEqualToString:operation]) {
        double b = [self popOperand];
        if (b >= 0){
            result = sqrt([self popOperand]);
        }else{
            NSLog(@"negative value is not allowed here.");
        }
        
    } else if ([@"/" isEqualToString:operation]) {
        double b = [self popOperand];
        if (b == 0){
            NSLog(@"denominator can not be 0");
        }
        result = [self popOperand] / b;
    } else if ([@"π" isEqualToString:operation]) {
        result = M_PI;
    }
    [self pushOperand:result];
    return result;
}

-(void)clear{
    [self.operandStack removeAllObjects];
}

@end
