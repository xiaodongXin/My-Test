//
//  ViewController.m
//  验证码
//
//  Created by coral_xxd on 16/1/27.
//  Copyright © 2016年 coral_xxd. All rights reserved.
//

#import "ViewController.h"
#import "CaptchaView.h"
#import <CommonCrypto/CommonDigest.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CaptchaView *view = [[CaptchaView alloc] initWithFrame:CGRectMake(20, 20, 200, 50)];
    [self.view addSubview:view];
    
    
    
    
}

//1.导入头文件 #import <CommonCrypto/CommonDigest.h>
//
//2.写下面的方法 - (NSString *)md5_32bit:(NSString *)input;
//
//1).传入的参数必须是字符串,NSData 可以转成字符串.

//2).得到的结果就是32个字.


- (NSString *)md5_32bit:(NSString *)input {
        //传入参数,转化成char
        const char * str = [input UTF8String];
        //开辟一个16字节（128位：md5加密出来就是128位/bit）的空间（一个字节=8字位=8个二进制数）
      unsigned char md[CC_MD5_DIGEST_LENGTH];
       /*
                 extern unsigned char * CC_MD5(const void *data, CC_LONG len, unsigned char *md)官方封装好的加密方法
                 把str字符串转换成了32位的16进制数列（这个过程不可逆转） 存储到了md这个空间中
                 */
       CC_MD5(str, (int)strlen(str), md);
        //创建一个可变字符串收集结果
        NSMutableString * ret = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH];
         for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
                 /**
                              X 表示以十六进制形式输入/输出
                              02 表示不足两位，前面补0输出；出过两位不影响
                              printf("%02X", 0x123); //打印出：123
                              printf("%02X", 0x1); //打印出：01
                              */
                 [ret appendFormat:@"%02X",md[i]];
             }
        //返回一个长度为32的字符串
         return ret;
     }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
