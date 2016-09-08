//
//  CaptchaView.h
//  验证码
//
//  Created by coral_xxd on 16/1/27.
//  Copyright © 2016年 coral_xxd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CaptchaView : UIView

@property (nonatomic, retain) NSArray *changeArray; //字符素材数组

@property (nonatomic, retain) NSMutableString *changeString;  //验证码的字符串

-(void)changeCaptcha;

- (void)drawRect:(CGRect)rect;

@end
