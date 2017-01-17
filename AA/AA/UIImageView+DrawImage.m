//
//  UIImageView+DrawImage.m
//  AA
//
//  Created by YKJ3 on 2017/1/3.
//  Copyright © 2017年 YKJ3. All rights reserved.
//

#import "UIImageView+DrawImage.h"

@implementation UIImageView (DrawImage)
-(void)drawRect:(CGRect)rect{
    UIImage *image2=[UIImage imageNamed:@"购物菜单图标"];
    [image2 drawAtPoint:CGPointMake(100, 100)];
}
@end
