//
//  Board.m
//  KPMineSweeper
//
//  Created by Kenan Pulak on 5/26/15.
//  Copyright (c) 2015 Kenan Pulak. All rights reserved.
//

#import "Board.h"
#import "Tile.h"

static Board *sBoard;

@interface Board()

@property (nonatomic, strong) NSNumber *rows;
@property (nonatomic, strong) NSNumber *columns;
@property (nonatomic, strong) NSNumber *mines;

@end

@implementation Board

+ (void)initialize {
    NSAssert(self == [Board class], @"Singleton is not designed to be subclassed.");
    
    sBoard = [Board new];
    
    [sBoard createBoardWithRows:8 Columns:8 andMines:10];
}

+ (Board *)sharedSingleton {
    return sBoard;
}

-(void)createBoardWithRows:(int)nRows Columns:(int)nColumns andMines:(int)nMines{
    
    self.rows = [NSNumber numberWithInt:nRows];
    self.columns = [NSNumber numberWithInt:nColumns];
    self.mines = [NSNumber numberWithInt:nMines];
    self.tiles = [[NSMutableArray alloc]init];
    
    for (int i = 0; i < self.rows.intValue; i++){
        for (int j = 0; j< self.columns.intValue; j++){
            Tile *tile = [[Tile alloc] initWithX:i andY:j];
            tile.tileState = TileStateNormalHidden;
            NSLog(@"My view frame: %@", NSStringFromCGRect(tile.frame));
            
            [self.tiles addObject:tile];
        }
    }
    
    NSLog(@"Tiles:%@", self.tiles);
    
}

-(void)setBoardSize:(CGSize)boardSize{
    
    float tileWidth = boardSize.width / self.columns.intValue;
    float tileHeight = boardSize.height / self.rows.intValue ;
    
    for (Tile *tile in self.tiles) {
        [tile setFrame:CGRectMake(tile.xPos * tileWidth, tile.yPos * tileHeight, tileWidth, tileHeight)];
        NSLog(@"%@",tile);
    }
}

@end
