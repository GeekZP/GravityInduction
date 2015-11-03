//
//  GravityInduction.h
//  BuFu
//
//  联系开发者:QQ1397819210
//
//  Created by 郑鹏 on 15/11/3.
//  Copyright © 2015年 Hangzhou Huifeng Technology Co., Ltd. All rights reserved.
//
#import <CoreMotion/CoreMotion.h>
#import <Foundation/Foundation.h>

@interface GravityInduction : NSObject

/**
 *  开始
 *
 *  @param result 返回手机朝向
 */
- (void)startUpdateAccelerometerResult:(void (^)(NSInteger))result;

/**
 *  结束
 */
- (void)stopUpdate;

@end



