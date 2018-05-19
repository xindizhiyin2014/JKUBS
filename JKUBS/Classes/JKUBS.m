//
//  JKUBS.m
//  Pods
//
//  Created by Jack on 17/4/5.
//
//

#import "JKUBS.h"

NSString const *JKUBSPVKey = @"PV";
NSString const *JKUBSEventKey = @"Event";
NSString const *JKUBSEventIDKey = @"EventID";
NSString const *JKUBSEventConfigKey = @"EventConfig";
NSString const *JKUBSSelectorStrKey = @"selectorStr";
NSString const *JKUBSTargetKey = @"target";

@interface JKUBS()

@property (nonatomic,strong,readwrite) NSDictionary *configureData;

@end

@implementation JKUBS
static JKUBS *_ubs =nil;
+ (instancetype)shareInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _ubs = [JKUBS new];
    });
    return _ubs;
}

+ (void)configureDataWithJSONFile:(NSString *)jsonFilePath{
    NSData *data = [NSData dataWithContentsOfFile:jsonFilePath];
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
    [JKUBS shareInstance].configureData = dic;
    if ([JKUBS shareInstance].configureData) {
        [self setUp];
    }
}

+ (void)configureDataWithPlistFile:(NSString *)plistFileName{
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:plistFileName ofType:@"plist"]];
    [JKUBS shareInstance].configureData = dic;
    if ([JKUBS shareInstance].configureData) {
        [self setUp];
    }
}

+ (void)setUp{
    [self configPV];
    [self configEvents];
}

#pragma mark  - - - - PVConfig - - - -

+ (void)configPV{
    for (NSString *vcName in [[JKUBS shareInstance].configureData[JKUBSPVKey] allKeys]) {
        Class target = NSClassFromString(vcName);
        [target aspect_hookSelector:@selector(viewDidAppear:) withOptions:JKUBSAspectPositionAfter usingBlock:^(id data){
            [self JKhandlePV:data status:JKUBSPV_ENTER];
        } error:nil];
        [target aspect_hookSelector:@selector(viewDidDisappear:) withOptions:JKUBSAspectPositionAfter usingBlock:^(id data){
            [self JKhandlePV:data status:JKUBSPV_LEAVE];
        } error:nil];
    }
}

+ (void)JKhandlePV:(id<JKUBSAspectInfo>)data status:(JKUBSPVSTATUS)status{}

#pragma mark - - - - EventConfig - - - -

+ (void)configEvents{
    NSDictionary *eventsDic = [JKUBS shareInstance].configureData[JKUBSEventKey];
    NSArray *events =[eventsDic allValues];
    for (NSDictionary *dic in events) {
        NSString * EventID = dic[JKUBSEventIDKey];
        NSArray *eventConfigs = [dic[JKUBSEventConfigKey] allValues];
        for (NSDictionary *eventConfig in eventConfigs) {
            NSString *selectorStr = eventConfig[JKUBSSelectorStrKey];
            NSString *targetClass = eventConfig[JKUBSTargetKey];
            Class target =NSClassFromString(targetClass);
            if ([selectorStr hasPrefix:@"+"]) {
                selectorStr = [selectorStr substringFromIndex:1];
                SEL selector = NSSelectorFromString(selectorStr);
                [target  aspect_hookClassSelector:selector withOptions:JKUBSAspectPositionBefore usingBlock:^(id<JKUBSAspectInfo> data){
                    [self JKHandleEvent:data EventID:EventID];
                } error:nil];
            }else{
             SEL selector = NSSelectorFromString(selectorStr);
                [target aspect_hookSelector:selector withOptions:JKUBSAspectPositionBefore usingBlock:^(id<JKUBSAspectInfo> data){
                    [self JKHandleEvent:data EventID:EventID];
                } error:nil];
            }
    
        }
    }
}

+ (void)JKHandleEvent:(id<JKUBSAspectInfo>)data EventID:(NSString *)eventId{}

@end
