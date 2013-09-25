//
//  Student.h
//  Do_StoryBoard
//
//  Created by Colin Yang Hong on 13-9-25.
//  Copyright (c) 2013年 Yang Hong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Student : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * serial;
@property (nonatomic, retain) NSNumber * man;
@property (nonatomic, retain) NSDate * date;

@end
