//
//  ViewController.m
//  TextLimit
//
//  Created by harvey.ding on 5/21/15.
//  Copyright (c) 2015 harvey. All rights reserved.
//

#import "ViewController.h"
#import "UITextView+TextInput.h"

static NSInteger const kLimit = 10;

@interface ViewController () <UITextFieldDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //UITextInputCurrentInputModeDidChangeNotification
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange:) name:UITextFieldTextDidChangeNotification object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {

    NSLog(@"cuurent text: %@",textField.text);
    NSLog(@"replace text: %@",string);
    
    UITextRange *makedRange = [_textField markedTextRange];
    UITextPosition *postion = [_textField positionFromPosition:makedRange.start offset:0];
    if (!postion) {
        NSString *newStr = [_textField.text stringByReplacingCharactersInRange:range withString:string];
        if (newStr.length > kLimit) {
            return false;
        }
    }
    
    return YES;
}

- (void)textChange:(NSNotification *)notification {
    UITextRange *makedRange = [_textField markedTextRange];
    UITextPosition *postion = [_textField positionFromPosition:makedRange.start offset:0];
    if (self.textField.text.length > kLimit && postion == nil) {
        self.textField.text = [self.textField.text substringToIndex:kLimit];
    }
    
}

@end
