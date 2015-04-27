//
//  Animations.h
//  UIAnimations
//
//  Created by Vasily on 26.04.15.
//  Copyright (c) 2015 Vasily Filippov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIkit/UIkit.h>

@interface Animations : NSObject

- (void) cange_Check_Box: (UIView *) view Color: (UIColor *) color;

+ (void) move_Placeholder: (UILabel *) label Alpha: (int) alpha;

+ (void) move_Placeholder_UP_DOWN:(UILabel *)label Points:(int)points TextColor: (UIColor *) text_Color;

+ (void) set_Glow_Effect:(UILabel *) label Alpha: (int) alpha;

@end
