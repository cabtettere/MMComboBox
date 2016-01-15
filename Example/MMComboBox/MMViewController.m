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

    self.sldElementCount.value = 10;
    self.sldElementHeight.value = 20;
    self.sldEdgeInsets.value = 8;
    self.sldElementGap.value = 8;
    
    [self valueChanged:self.sldElementCount];
    [self valueChanged:self.sldElementHeight];
    [self valueChanged:self.sldEdgeInsets];
    [self valueChanged:self.sldElementGap];
    
    self.comboBox.openAnimationDuration = 0.25f;
    self.comboBox.closeAnimationDuration = 0.25f;
    
    self.comboBox.startingAlpha = 1;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)show:(id)sender {
    self.comboBox.edgeInsets = UIEdgeInsetsMake(self.sldEdgeInsets.value, self.sldEdgeInsets.value, self.sldEdgeInsets.value, self.sldEdgeInsets.value);
    self.comboBox.elementGap = self.sldElementGap.value;
    
    [self.comboBox open];
}

-(NSUInteger)numberOfElementInComboBox:(MMComboBox *)comboBox {
    return self.sldElementCount.value;
}

-(UIView *)viewForElementAtIndex:(NSUInteger)index inComboBox:(MMComboBox *)comboBox {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, self.sldElementHeight.value)];
    label.text = [NSString stringWithFormat:@"Option %lu",(unsigned long)index];
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor cyanColor];
    return label;
}

-(void)didSelectedElementAtIndex:(NSUInteger)index inComboBox:(MMComboBox *)comboBox {
    NSLog(@"Selected %lu",(unsigned long)index);
    self.labelSelected.text = [NSString stringWithFormat:@"Option %lu",(unsigned long)index];
    [comboBox close];
}

- (IBAction)valueChanged:(id)sender {
    
    if ([sender isKindOfClass:[UISlider class]]) {
        UISlider *slider = (UISlider*)sender;
        int discreteValue = roundl([slider value]); // Rounds float to an integer
        [slider setValue:(float)discreteValue];
    }
    
    
    if (sender == self.sldElementCount){
        self.lblElementCount.text = [NSString stringWithFormat:@"%.0f",self.sldElementCount.value];
        
    }else if (sender == self.sldElementHeight){
        self.lblElementHeight.text = [NSString stringWithFormat:@"%.0f",self.sldElementHeight.value];
        
    }else if (sender == self.sldEdgeInsets){
        self.lblEdgeInsets.text = [NSString stringWithFormat:@"%.0f",self.sldEdgeInsets.value];
        
    }else if (sender == self.sldElementGap){
        self.lblElementGap.text = [NSString stringWithFormat:@"%.0f",self.sldElementGap.value];
        
    }
    
}
@end
