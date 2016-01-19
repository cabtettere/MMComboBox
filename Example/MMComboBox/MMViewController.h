//
//  MMViewController.h
//  MMComboBox
//
//  Created by Marco Mardegan on 01/12/2016.
//  Copyright (c) 2016 Marco Mardegan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MMComboBox/MMComboBox.h>


@interface MMViewController : UIViewController <MMComboBoxDataSource, MMComboBoxDelegate>

@property (weak, nonatomic) IBOutlet UIButton *buttonToggle;
@property (weak, nonatomic) IBOutlet UILabel *labelSelected;
@property (weak, nonatomic) IBOutlet MMComboBox *comboBox;
- (IBAction)show:(id)sender;

@property (weak, nonatomic) IBOutlet UISlider *sldElementCount;
@property (weak, nonatomic) IBOutlet UISlider *sldElementHeight;
@property (weak, nonatomic) IBOutlet UISlider *sldEdgeInsets;
@property (weak, nonatomic) IBOutlet UISlider *sldElementGap;
@property (weak, nonatomic) IBOutlet UISlider *sldEnterAnimation;

- (IBAction)valueChanged:(id)sender;


@property (weak, nonatomic) IBOutlet UILabel *lblElementCount;
@property (weak, nonatomic) IBOutlet UILabel *lblElementHeight;
@property (weak, nonatomic) IBOutlet UILabel *lblEdgeInsets;
@property (weak, nonatomic) IBOutlet UILabel *lblElementGap;
@property (weak, nonatomic) IBOutlet UILabel *lblAnimationDuration;
@end
