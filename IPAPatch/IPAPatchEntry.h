//
//  IPAPatchEntry.h
//  IPAPatch
//
//  Created by wutian on 2017/3/17.
//  Copyright © 2017年 Weibo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IPAPatchEntry : NSObject

@end


@interface WCDeviceStepObject : NSObject

@property(retain, nonatomic) NSMutableArray *allHKSampleSource; // @synthesize allHKSampleSource;
@property(nonatomic) unsigned int hkStepCount; // @synthesize hkStepCount;
@property(nonatomic) unsigned int m7StepCount; // @synthesize m7StepCount;
@property(nonatomic) unsigned int endTime; // @synthesize endTime;
@property(nonatomic) unsigned int beginTime; // @synthesize beginTime;


@end
