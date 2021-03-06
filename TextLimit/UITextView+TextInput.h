//
//  UITextView+TextInput.h
//  TextLimit
//
//  Created by harvey.ding on 5/21/15.
//  Copyright (c) 2015 harvey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (TextInput)

- (NSInteger) lengthWithInRange:(NSRange)range replacementText:(NSString *)string;
- (BOOL) shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)string length:(NSInteger)length;

@end
