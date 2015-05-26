//
//  ViewController.m
//  KPMineSweeper
//
//  Created by Kenan Pulak on 5/26/15.
//  Copyright (c) 2015 Kenan Pulak. All rights reserved.
//

#import "ViewController.h"
#import "Board.h"
#import "Tile.h"

@interface ViewController ()

@property (nonatomic, strong) UIView *boardView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"MineSweeper";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"New Game" style:UIBarButtonItemStylePlain target:self action:@selector(resetGame)];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    self.boardView = [[UIView alloc]init];
    [self.boardView setBackgroundColor:[UIColor blackColor]];
    
    [self.boardView setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    self.boardView.layer.borderWidth = 2.0f;
    self.boardView.layer.borderColor = [[UIColor blackColor]CGColor];
    
    [self.view addSubview:self.boardView];
    
    NSDictionary *views = @{@"boardView": self.boardView};
    NSDictionary *metrics = @{@"margin": @30};
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(margin)-[boardView]-(margin)-|" options:0 metrics:metrics views:views]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.boardView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.boardView attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.boardView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:100]];
    
    NSMutableArray *testArray = [Board sharedSingleton].tiles;
    
    NSLog(@"%@",self.view.subviews);
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)viewWillAppear:(BOOL)animated{
    


}

-(void)viewDidAppear:(BOOL)animated{
    [[Board sharedSingleton]setBoardSize:self.boardView.frame.size];
    
    [self addViewsFromArray:[Board sharedSingleton].tiles toView:self.boardView];
}

-(void)viewWillLayoutSubviews{
    
}

- (void)updateViewConstraints{
    
    [super updateViewConstraints];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)addViewsFromArray:(NSMutableArray*)views toView:(UIView*)view{
    
    for(Tile *tile in views){
        [view addSubview:tile];
    }
}

-(void)resetGame{
    
    NSArray *viewsToRemove = [self.boardView subviews];
    for (UIView *v in viewsToRemove) {
        [v removeFromSuperview];
    }
    
    [[Board sharedSingleton]createBoardWithRows:8 Columns:8 andMines:10];
    
    [[Board sharedSingleton]setBoardSize:self.boardView.frame.size];
    
    [self addViewsFromArray:[Board sharedSingleton].tiles toView:self.boardView];
}

@end
