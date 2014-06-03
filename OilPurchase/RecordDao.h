//
//  RecordDao.h
//  OilPurchase
//
//  Created by 张洋 on 14-6-1.
//  Copyright (c) 2014年 chinawit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Record.h"
#import <sqlite3.h>

#define DBFILE_NAME @"ChangeRecord4.sqlite3"

@interface RecordDao : NSObject
{
    sqlite3 *db;
}
+ (RecordDao *)sharedManager;

-(BOOL)CreateDataBase;
-(NSString *)applicationDocumentsDirectoryFile;
//插入Note方法
-(int) create:(Record*)model;

//删除Note方法
//-(int) remove:(Record*)model;

//修改Note方法
//-(int) modify:(Record*)model;

//查询所有数据方法
-(NSMutableArray*) findAll;

//按照主键查询数据方法
//-(Record*) findById:(Record*)model;
@end
