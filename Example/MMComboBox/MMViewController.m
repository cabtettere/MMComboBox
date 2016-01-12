//
//  MMViewController.m
//  MMComboBox
//
//  Created by Marco Mardegan on 01/12/2016.
//  Copyright (c) 2016 Marco Mardegan. All rights reserved.
//

#import "MMViewController.h"

@interface MMViewController ()

@end

@implementation MMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.comboBox.layer.borderColor = [[UIColor redColor] CGColor];
    self.comboBox.datasource = self;
    self.comboBox.delegate = self;
    
    self.comboBox.edgeInsets = UIEdgeInsetsMake(8, 8, 8, 8);
    self.comboBox.elementGap = 8;
    
    self.comboBox.openAnimationDuration = 0.5f;
    self.comboBox.closeAnimationDuration = 0.2f;
    
    self.comboBox.startingAlpha = 0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)show:(id)sender {
    [self.comboBox open];
}

-(NSUInteger)numberOfElementInComboBox:(MMComboBox *)comboBox {
    return 5;
}

-(UIView *)viewForElementAtIndex:(NSUInteger)index inComboBox:(MMComboBox *)comboBox {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
    label.text = [NSString stringWithFormat:@"Option %lu",(unsigned long)index];
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor cyanColor];
    label.layer.cornerRadius = 5.;
    label.clipsToBounds = YES;
    return label;
}

-(void)didSelectedElementAtIndex:(NSUInteger)index inComboBox:(MMComboBox *)comboBox {
    NSLog(@"Selected %lu",(unsigned long)index);
    self.labelSelected.text = [NSString stringWithFormat:@"Option %lu",(unsigned long)index];
    [comboBox close];
}

@end
