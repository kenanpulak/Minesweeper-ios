//
//  Board.h
//  KPMineSweeper
//
//  Created by Kenan Pulak on 5/26/15.
//  Copyright (c) 2015 Kenan Pulak. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Board : NSObject

@property (nonatomic, strong) NSMutableArray *tiles;

+(Board *)sharedSingleton;

-(void)createBoardWithRows:(int)nRows Columns:(int)nColumns andMines:(int)nMines;

-(void)setBoardSize:(CGSize)size;

@end
