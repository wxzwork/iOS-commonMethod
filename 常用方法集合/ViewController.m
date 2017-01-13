//
//  ViewController.m
//  常用方法集合
//
//  Created by WOSHIPM on 17/1/13.
//  Copyright © 2017年 WOSHIPM. All rights reserved.
//

#import "ViewController.h"
#import "UITextField+LimitTextLength.h"
#import "UIColor+ColorCategory.h"
#import "NSString+CategoryMethods.h"
@interface ViewController ()<UIWebViewDelegate,UITextFieldDelegate>
@property(nonatomic, strong)UITextField *textFieid;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *QQButton=[UIButton buttonWithType:UIButtonTypeSystem];
    QQButton.frame = CGRectMake(100, 100, 100, 50);
    [QQButton setTitle:@"QQ" forState:UIControlStateNormal];
    [self.view addSubview:QQButton];
    QQButton.backgroundColor = [UIColor colorWithHex:@"#5bbb53" alpha:0.5];
    [QQButton addTarget:self action:@selector(didClickQQButton) forControlEvents:UIControlEventTouchUpInside];
//
    UIButton *phoneButton=[UIButton buttonWithType:UIButtonTypeSystem];
    phoneButton.frame = CGRectMake(100, 170, 100, 50);
    [phoneButton setTitle:@"打电话" forState:UIControlStateNormal];
    [self.view addSubview:phoneButton];
    phoneButton.backgroundColor = [UIColor colorWithHex:@"#5bbb53"];
    [phoneButton addTarget:self action:@selector(didClickPhoneButton) forControlEvents:UIControlEventTouchUpInside];
    
   _textFieid=[[UITextField alloc] initWithFrame:CGRectMake(20, 240, self.view.frame.size.width-40, 50)];
    [self.view addSubview:_textFieid];
    _textFieid.layer.borderWidth=.5;
    _textFieid.delegate = self;
     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldEditChanged:) name:UITextFieldTextDidChangeNotification object:_textFieid];
    
   NSString *timeStr=@"1484273089170";
    NSString *date=[timeStr getDateStringWithTimeInterval:timeStr DataFormatterString:@"yyyy-MM-dd HH:mm"];
    UILabel *label=[[UILabel alloc] initWithFrame:CGRectMake(50, 310, 240, 20)];
    [self.view addSubview:label];
    label.text = [NSString stringWithFormat:@"日期为：%@",date];
    
    
    double TimeInterval=[date getTimeIntervalWithDateString:@"2017-01-13 10:04" DataFormatterString:@"yyyy-MM-dd HH:mm"];
    NSLog(@"转换后的日期为：%f", TimeInterval);
    
}
-(void)textFieldEditChanged:(NSNotification *)obj {
    UITextField *textField = (UITextField *)obj.object;
    if (textField == _textFieid) {
        [_textFieid limitTextLength:10 TextField:_textFieid];
        
    }
}
#pragma mark -- QQ咨询
-(void)didClickQQButton{
    //需要在info.plist中增加LSApplicationQueriesSchemes数组，然后添加item0，item0对应的值为mqqapi；增加item1，item1的值为mqq。
    NSString * QQNumber=@"1255204981";
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"mqq://"]]) {
        UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectZero];
        
        NSURL * url=[NSURL URLWithString:[NSString stringWithFormat:@"mqq://im/chat?chat_type=wpa&uin=%@&version=1&src_type=web", QQNumber]];
        
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        
        webView.delegate = self;
        
        [webView loadRequest:request];
        
        [self.view addSubview:webView];
        
    }else{
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"nil" message:@"对不起，您还没安装QQ" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
            
            return ;
            
        }];
        
        [alertController addAction:cancelAction];
        
        [self presentViewController:alertController animated:YES completion:nil];
        
    }
    
    
}
-(void)textFieldDidEndEditing:(UITextField *)textField{
    if (_textFieid==textField) {
       BOOL isPhoneNumber= [_textFieid.text isMobileNumber:textField.text];
        if (isPhoneNumber==YES) {
            
        }else{
            NSLog(@"手机号不正确");
        }
        
        BOOL isEmail= [_textFieid.text isValidateEmail:_textFieid.text];
        if (isEmail==YES) {
            
        }else{
            NSLog(@"邮箱格式不正确");
        }
        //base64加密
        NSString *base64String=[_textFieid.text base64];
        NSLog(@"%@",base64String);

    }
}
#pragma mark--电话咨询
-(void)didClickPhoneButton{
    NSString *PhoneNumber=@"18940933835";
    NSMutableString* str=[[NSMutableString alloc] initWithFormat:@"telprompt://%@", PhoneNumber];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]  ];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
