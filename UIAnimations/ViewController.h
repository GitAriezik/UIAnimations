//
//  ViewController.h
//  UIAnimations
//
//  Created by Vasily on 26.04.15.
//  Copyright (c) 2015 Vasily Filippov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>{
    
    BOOL isYes;
    
    BOOL isColorChanged;
    
    BOOL isPlaceHolderHiden;
    
}
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UILabel *label_PlaceHolder;

- (IBAction)textField_Changed:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *label_Glow;

@end

