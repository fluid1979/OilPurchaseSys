//
//  RecordDao.m
//  OilPurchase
//
//  Created by 张洋 on 14-6-1.
//  Copyright (c) 2014年 chinawit. All rights reserved.
//

#import "RecordDao.h"

@implementation RecordDao


static RecordDao *sharedManager = nil;

+ (RecordDao *)sharedManager
{
    static dispatch_once_t once;
    dispatch_once(&once, ^{
            sharedManager = [[self alloc] init];
        });
    return sharedManager;
}

//插入Record方法
-(int) create:(Record*)model
{

    NSString *path=[self applicationDocumentsDirectoryFile];
    
    if(sqlite3_open([path UTF8String], &db)!=SQLITE_OK){
        sqlite3_close(db);
        return 0;
    }
    else{
        
        NSString *sqlstr=@"insert or replace into ChangeRecords4 (ID,purchaseTime,Amount,status,fapiaocategory,fapiaotaitou) values(?,?,?,?,?,?)";
        
        sqlite3_stmt *statement;
        
        //预处理过程
        if(sqlite3_prepare_v2(db, [sqlstr UTF8String], -1, &statement, NULL)==SQLITE_OK){
            
            //准备参数
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
            [dateFormatter setDateFormat:@"yyyy-MM-dd"];
            NSString *nsdate=[dateFormatter stringFromDate:model.PurchaseTime];
            
            //参数绑定
            sqlite3_bind_text(statement, 1, [model.Id UTF8String], -1, NULL);
            sqlite3_bind_text(statement, 2, [nsdate UTF8String], -1, NULL);
            sqlite3_bind_text(statement, 3, [model.Amount UTF8String], -1, NULL);
            sqlite3_bind_text(statement, 4, [model.Status UTF8String], -1, NULL);
            sqlite3_bind_text(statement, 5, [model.FaPiaoCategory UTF8String], -1, NULL);
            sqlite3_bind_text(statement, 6, [model.FaPiaoTaiTou UTF8String], -1, NULL);
            
            //执行
            if(sqlite3_step(statement)==SQLITE_DONE){
                
                return 1;
            }
            else
                return 4;
            
        }
        else
            return 2;
        
        sqlite3_finalize(statement);
        sqlite3_close(db);
        
    }
    return 3;

}

//查询所有数据方法
-(NSMutableArray*) findAll
{
    NSString *path=[self applicationDocumentsDirectoryFile];
    NSMutableArray *listData=[[NSMutableArray alloc] init];
    
    
    if(sqlite3_open([path UTF8String], &db)!=SQLITE_OK){
        sqlite3_close(db);

    }
    else{
        
        NSString *qsql=@"select ID,purchaseTime,Amount,status,fapiaocategory,fapiaotaitou from ChangeRecords4";
        
        sqlite3_stmt *statement;
        
        //预处理过程
        if(sqlite3_prepare_v2(db, [qsql UTF8String], -1, &statement, NULL)==SQLITE_OK){
            
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
            [dateFormatter setDateFormat:@"yyyy-MM-dd"];
            
            
            //执行
            while (sqlite3_step(statement)==SQLITE_ROW){
                
                char *cdID=(char *)sqlite3_column_text(statement, 0);
                NSString *nsID=[[NSString alloc] initWithUTF8String:cdID];
                
                char *cdPurchaseTime=(char *)sqlite3_column_text(statement, 1);
                NSString *nsPurchaseTime=[[NSString alloc] initWithUTF8String:cdPurchaseTime];
                
                char *cdAmount=(char *)sqlite3_column_text(statement, 2);
                NSString *nsAmount=[[NSString alloc] initWithUTF8String:cdAmount];
                
                char *cdStatus=(char *)sqlite3_column_text(statement, 3);
                NSString *nsStatus=[[NSString alloc] initWithUTF8String:cdStatus];
                
                char *cdFPC=(char *)sqlite3_column_text(statement, 4);
                NSString *nsFPC=[[NSString alloc] initWithUTF8String:cdFPC];
                
                char *cdFPTT=(char *)sqlite3_column_text(statement, 5);
                NSString *nsFPTT=[[NSString alloc] initWithUTF8String:cdFPTT];
                
                Record *record=[[Record alloc] init];
                record.Id=nsID;
                record.Amount=nsAmount;
                record.Status=nsStatus;
                record.PurchaseTime=[dateFormatter dateFromString:nsPurchaseTime];
                record.FaPiaoCategory=nsFPC;
                record.FaPiaoTaiTou=nsFPTT;
                [listData addObject:record];
                
            }
            
        }
        
        sqlite3_finalize(statement);
        sqlite3_close(db);
        
    }
    return listData;
}



//////////////////
//获得放置在沙箱Document目录下面的文件的完整路径
-(NSString *)applicationDocumentsDirectoryFile{
    NSString *documentDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *path = [documentDirectory stringByAppendingPathComponent:DBFILE_NAME];
    
	return path;
}
//对数据文件进行预处理
-(BOOL)CreateDataBase{
    
    NSString *writableDBPath=[self applicationDocumentsDirectoryFile];
    
    if(sqlite3_open([writableDBPath UTF8String], &db)!=SQLITE_OK){

        sqlite3_close(db);
        return NO;
        
    }
    else{
       
        char *err;
        NSString *createSQL=[NSString stringWithFormat:@"Create Table if not exists ChangeRecords4 (ID text primary key,purchaseTime text,amount text,status text,fapiaocategory text,fapiaotaitou text);"];
        
        if(sqlite3_exec(db, [createSQL UTF8String], NULL, NULL, &err)!=SQLITE_OK){
            sqlite3_close(db);
            return NO;
        }
        else
        {
            sqlite3_close(db);
            return YES;
        }

    }
    
}


@end
