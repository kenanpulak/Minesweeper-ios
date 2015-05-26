//
//  Tile.h
//  KPMineSweeper
//
//  Created by Kenan Pulak on 5/26/15.
//  Copyright (c) 2015 Kenan Pulak. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum{
    TileStateNormalHidden,
    TileStateNormalRevealed,
    TileStateMineRevealed,
    TileStateMineHidden,
    TileStateShowMine
} TileState;

@interface Tile : UIButton

@property (nonatomic) int xPos;
@property (nonatomic) int yPos;
@property (nonatomic) TileState tileState;

-(id)initWithX:(int)xPosition andY:(int)yPosition;

@end
