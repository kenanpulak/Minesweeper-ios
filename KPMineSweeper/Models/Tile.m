//
//  Tile.m
//  KPMineSweeper
//
//  Created by Kenan Pulak on 5/26/15.
//  Copyright (c) 2015 Kenan Pulak. All rights reserved.
//

#import "Tile.h"

@implementation Tile

-(id)initWithX:(int)xPosition andY:(int)yPosition{
    
    self = [super init];
    
    if(self){
        self.xPos = xPosition;
        self.yPos = yPosition;
    }
    
    [self setFrame:CGRectMake(self.xPos * 30 + 1, self.yPos * 30 + 1, 29, 29)];
    
    [self addTarget:self action:@selector(changeState) forControlEvents:UIControlEventTouchUpInside];
    
    [self clipsToBounds];
    

    return self;
}

-(NSString*)description{
    NSMutableString *description = [NSMutableString stringWithFormat:@"<%@: ", NSStringFromClass([self class])];
    [description appendFormat:@"%d,%d", self.xPos,self.yPos];
    [description appendFormat:@" Frame:%@", NSStringFromCGRect(self.frame)];
    [description appendString:@">"];
    return description;
}

-(void)changeState{
    
    switch (self.tileState) {
        case TileStateNormalHidden:
            [self setTileState:TileStateNormalRevealed];
            break;
        case TileStateMineHidden:
            [self setTileState:TileStateMineRevealed];
            break;
            
        default:
            break;
    }
    
}

-(void)setTileState:(TileState)tileState{
    
    switch (tileState) {
        case TileStateNormalHidden:
        case TileStateMineHidden:
            [self setBackgroundColor:[UIColor grayColor]];
            self.layer.allowsEdgeAntialiasing = YES;
            self.layer.borderWidth = 1.0f;
            self.layer.borderColor = [[UIColor blackColor]CGColor];
            break;
            
        case TileStateNormalRevealed:
            [self setBackgroundColor:[UIColor whiteColor]];
            self.layer.allowsEdgeAntialiasing = NO;
            self.layer.borderWidth = 0;
            //set number of adjacent mines, if any

            break;
            
        case TileStateMineRevealed:
            [self setBackgroundColor:[UIColor whiteColor]];
            self.layer.allowsEdgeAntialiasing = NO;
            self.layer.borderWidth = 0;
            // show image of mine

            break;
            
        case TileStateShowMine:
            [self setBackgroundColor:[UIColor redColor]];
            // show image of mine
            
            break;
            
        default:
            break;
    }
}

@end
