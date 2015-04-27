//
//  ViewController.m
//  UIAnimations
//
//  Created by Vasily on 26.04.15.
//  Copyright (c) 2015 Vasily Filippov. All rights reserved.
//

#import "ViewController.h"
#import "Animations.h"


@interface ViewController ()



@property (weak, nonatomic) IBOutlet UIView *view_BG_YES;

@property (weak, nonatomic) IBOutlet UIView *view_BG_NO;

@property (weak, nonatomic) IBOutlet UIView *view_Check_YES;

@property (weak, nonatomic) IBOutlet UIView *view_Check_NO;

- (IBAction)action_YES:(id)sender;

- (IBAction)action_NO:(id)sender;



@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
        
    isPlaceHolderHiden = NO;
    isColorChanged = NO;
    
    [self setView];
    
}
    -(void) setView {
        //здесь мы прорисовываем внешний вид элементов (граница, цвет, радиус закругления и т.д.)

        
        self.textField.layer.borderColor = [UIColor colorWithWhite:1.0 alpha:0.10].CGColor;
        self.textField.layer.borderWidth = 1.0;
        self.textField.layer.cornerRadius = 5.0;
        
        
        self.view_Check_YES.backgroundColor = [UIColor whiteColor];
        
        
        self.view_BG_NO.layer.borderColor = [UIColor redColor].CGColor;
        self.view_BG_NO.layer.borderWidth = 1.0;
        self.view_BG_NO.layer.cornerRadius = 5.0;
        
        
        self.view_BG_YES.layer.borderColor = [UIColor redColor].CGColor;
        self.view_BG_YES.layer.borderWidth = 1.0;
        self.view_BG_YES.layer.cornerRadius = 5.0;


        
        self.view_Check_YES.layer.borderColor = [UIColor blueColor].CGColor;
        self.view_Check_YES.layer.borderWidth = 1.0;
        self.view_Check_YES.layer.cornerRadius = 5.0;


        
        self.view_Check_NO.layer.borderColor = [UIColor blueColor].CGColor;
        self.view_Check_NO.layer.borderWidth = 1.0;
        self.view_Check_NO.layer.cornerRadius = 5.0;
        
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField {
    
    [self.textField resignFirstResponder];
    
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)action_YES:(id)sender {
    
    if (!isColorChanged) {
    
        Animations * anim = [Animations new];
        [anim cange_Check_Box:self.view_Check_YES Color:[UIColor blueColor]];
        [anim cange_Check_Box:self.view_Check_NO Color:[UIColor whiteColor]];
        
        
     
        
        isColorChanged = YES;
        
        isYes = YES;
        
        [Animations set_Glow_Effect:self.label_Glow Alpha:1];

        
    }
    
    
    else if (!isYes) {
        
        Animations * anim = [Animations new];
        [anim cange_Check_Box:self.view_Check_YES Color:[UIColor blueColor]];
        [anim cange_Check_Box:self.view_Check_NO Color:[UIColor whiteColor]];
        
        
        
        isYes = YES;
        
        [Animations set_Glow_Effect:self.label_Glow Alpha:1];//подсвечивается надпись ДА

        
    }

}


- (IBAction)action_NO:(id)sender {
  
    if (!isColorChanged) {
        
        Animations * anim = [Animations new];
        [anim cange_Check_Box:self.view_Check_YES Color:[UIColor whiteColor]];
        [anim cange_Check_Box:self.view_Check_NO Color:[UIColor blueColor]];
        
        isColorChanged = YES;
        
        isYes = NO;
        
        [Animations set_Glow_Effect:self.label_Glow Alpha:0];//подсвечивается надпись НЕТ

        
    }
    
    
    else if (isYes) {
        
        Animations * anim = [Animations new];
        [anim cange_Check_Box:self.view_Check_YES Color:[UIColor whiteColor]];
        [anim cange_Check_Box:self.view_Check_NO Color:[UIColor blueColor]];
        
        
        isYes = NO;
        
        [Animations set_Glow_Effect:self.label_Glow Alpha:0];

        
    }

    }


- (IBAction)textField_Changed:(id)sender {
     //данный метод при введении в поле букв - отодвигает Лейбл вправо (метод анимации вызывается из класса Animations)
    
    if (self.textField.text.length == 0) {
        //условие на наличие хотябы одного символа в поле текстфилда
        
        if (isPlaceHolderHiden) {
            [Animations move_Placeholder_UP_DOWN:self.label_PlaceHolder Points:40 TextColor:[UIColor blackColor]];
            
            isPlaceHolderHiden = NO;
        }
        
    }
    
    else {
        
        if (!isPlaceHolderHiden) {
            [Animations move_Placeholder_UP_DOWN:self.label_PlaceHolder Points:-40 TextColor:[UIColor whiteColor]];
            isPlaceHolderHiden = YES;
        }
        
    }
}
@end
