//
//  MMComboBox.h
//  Pods
//
//  Created by Marco Mardegan on 12/01/16.
//
//

#import <UIKit/UIKit.h>

@class MMComboBox;

@protocol MMComboBoxDataSource <NSObject>

@required

-(NSUInteger)numberOfElementInComboBox:(MMComboBox*)comboBox;
-(UIView*)viewForElementAtIndex:(NSUInteger)index inComboBox:(MMComboBox*)comboBox;

@end

@protocol MMComboBoxDelegate <NSObject>

@optional

-(void)didSelectedElementAtIndex:(NSUInteger)index inComboBox:(MMComboBox*)comboBox;

@end

@interface MMComboBox : UIView {
    NSLayoutConstraint *heightConstraint;
    NSMutableArray<NSValue*> *elementYRanges;
}

@property (assign) id<MMComboBoxDataSource> datasource;
@property (assign) id<MMComboBoxDelegate> delegate;

@property (nonatomic) BOOL isOpen;
@property (nonatomic) NSTimeInterval openAnimationDuration;
@property (nonatomic) NSTimeInterval closeAnimationDuration;

@property (nonatomic) CGFloat startingAlpha;
@property (nonatomic) CGFloat finalAlpha;

@property (nonatomic) UIEdgeInsets edgeInsets;
@property (nonatomic) CGFloat elementGap;

-(void)open;
-(void)close;
-(void)toogle;



@end
