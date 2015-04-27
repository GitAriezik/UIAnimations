//
//  Animations.m
//  UIAnimations
//
//  Created by Vasily on 26.04.15.
//  Copyright (c) 2015 Vasily Filippov. All rights reserved.
//

#import "Animations.h"

@implementation Animations


- (void) cange_Check_Box: (UIView *) view Color: (UIColor *) color {
    
    CATransition * animation = [CATransition animation];
    animation.type = kCATransitionFade; // вид анимации
    animation.duration = 0.35;//интервал анимации
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
    
    [animation setFillMode:kCAFillModeBoth];//как проходит анимация
    
    [view.layer addAnimation:animation forKey:@"Fade"];
    view.backgroundColor = color;
}


+ (void) move_Placeholder: (UILabel *) label Alpha: (int) alpha {
    //данный метод отодвигает Лейбл на текстовом фрейме - вправо

    CATransition * animation = [CATransition animation];
    animation.type = kCATransitionPush;  // вид анимации

    
    if (alpha == 0) {
        animation.subtype = kCATransitionFromLeft;
        
    }
    
    else {
        animation.subtype = kCATransitionFromRight;
        
    }
    
    animation.duration = 0.35;//интервал анимации
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
    
    [animation setFillMode:kCAFillModeBoth];//как проходит анимация
    
    [label.layer addAnimation:animation forKey:@"Fade"];
    label.alpha = alpha;
    
}

+(void) move_Placeholder_UP_DOWN:(UILabel *)label Points:(int)points TextColor: (UIColor *) text_Color {
    //данный метод отодвигает Лейбл в текстовом фрейме - вверх, а так же меняет цвет текста
   
    [UIView animateWithDuration:0.4 delay:0.0 usingSpringWithDamping:0.2 initialSpringVelocity:5.7 options:0 animations:^{
        //анимация типа пружины
 
        
        CGRect newFram = [label frame];
        
        newFram.origin.y = label.frame.origin.y + points;

        label.frame = newFram;
        
        int64_t delay = 10; //указываем задержку смены цвета
        
        dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, delay * NSEC_PER_MSEC);
        
        dispatch_after(time, dispatch_get_main_queue(), ^{
            
            CATransition * animation = [CATransition animation];
            animation.type = kCATransitionFade; // вид анимации
            animation.duration = 0.3;//интервал анимации
            [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
            
            [animation setFillMode:kCAFillModeBoth];//как проходит анимация
            
            [label.layer addAnimation:animation forKey:@"Fade"];
            label.textColor = text_Color;
            
        });
    } completion:^(BOOL finished) {
        
    }];
 
    
//    [UIView animateWithDuration:1.3 delay:0.0 options: UIViewAnimationOptionTransitionNone animations:^{
//        
//        label.frame = newFram;
//        
//        int64_t delay = 10;
//        
//        dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, delay * NSEC_PER_MSEC);
//        
//        dispatch_after(time, dispatch_get_main_queue(), ^{
//            
//            CATransition * animation = [CATransition animation];
//            animation.type = kCATransitionFade;
//            animation.duration = 1.2;
//            [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
//            
//            [animation setFillMode:kCAFillModeBoth];
//            
//            [label.layer addAnimation:animation forKey:@"Fade"];
//            label.textColor = text_Color;
//            
//            });
//        
//    } completion:^(BOOL finished) {
//        
//        if (finished) {
//            
//            
//            NSLog(@"Animation is OK");
//        }
//        
//    }];
    
}


+ (void) set_Glow_Effect:(UILabel *) label Alpha: (int) alpha {
    //данный метод делает свечение вокруг лейбла

    
    CATransition * animation = [CATransition animation];
    animation.type = kCATransitionFade;// вид анимации
    
//    if (alpha == 0) {
//        animation.subtype = kCATransitionFromLeft;
//        
//    }
//    
//    else {
//        animation.subtype = kCATransitionFromRight;
//        
//    }
    
    animation.duration = 1.35;
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
    
    [animation setFillMode:kCAFillModeBoth];//как проходит анимация
    
    [label.layer addAnimation:animation forKey:@"Fade"];

    label.layer.shadowColor = [UIColor colorWithWhite:1.0 alpha:alpha].CGColor; //цвет тени
    
    label.layer.shadowOffset = CGSizeMake(0.0, 0.0);//направление тени
    
    label.layer.shadowRadius = 7.5f;
    
    label.layer.shadowOpacity = 12.5f;//прозрачность
    
    label.layer.masksToBounds = NO;//если нет, то глоу-эффект светит без ограничения (т.е. на всю вьюшку)

    
}

@end
