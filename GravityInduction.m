//
//  GravityInduction.m
//  BuFu
//
//  Created by 郑鹏 on 15/11/3.
//  Copyright © 2015年 Hangzhou Huifeng Technology Co., Ltd. All rights reserved.
//

#import "GravityInduction.h"

@interface GravityInduction ()

{
    NSTimeInterval updateInterval;
}
@property (nonatomic,strong) CMMotionManager *mManager;

@end

@implementation GravityInduction

- (CMMotionManager *)mManager
{
    if (!_mManager) {
        updateInterval = 1.0/15.0;
        _mManager = [[CMMotionManager alloc] init];
    }
    return _mManager;
}

- (void)startUpdateAccelerometerResult:(void (^)(NSInteger))result
{
    __weak typeof(self) weakSelf = self;
    if ([self.mManager isAccelerometerAvailable] == YES) {
        [self.mManager setAccelerometerUpdateInterval:updateInterval];
        [self.mManager startAccelerometerUpdatesToQueue:[NSOperationQueue currentQueue] withHandler:^(CMAccelerometerData *accelerometerData, NSError *error)
         {
             double x = accelerometerData.acceleration.x;
             double y = accelerometerData.acceleration.y;
             if (fabs(y) >= fabs(x))
             {
                 if (y >= 0){
                     //Down   home键朝上
                     result(2);
                 }
                 else{
                     //Portrait   home键朝上
                     result(1);
                 }
             }
             else
             {
                 if (x >= 0){
                     //Right  home键朝左
                     result(4);
                 }
                 else{
                     //Left  home键朝右
                     result(3);
                 }
             }
         }];
    }
}

- (void)stopUpdate
{
    if ([self.mManager isAccelerometerActive] == YES)
    {
        [self.mManager stopAccelerometerUpdates];
    }
}

- (void)dealloc
{
    _mManager = nil;
}

@end
