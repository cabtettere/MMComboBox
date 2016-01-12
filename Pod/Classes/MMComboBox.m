//
//  MMComboBox.m
//  Pods
//
//  Created by Marco Mardegan on 12/01/16.
//
//

#import "MMComboBox.h"

@implementation MMComboBox

-(instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self == [super initWithCoder:(NSCoder *)aDecoder]) {
        [self setup];
    }
    return self;
}

-(instancetype)init {
    if (self == [super init]) {
        [self setup];
    }
    return self;
}

-(void)setup {
    
    heightConstraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:0];
    heightConstraint.priority = UILayoutPriorityRequired;
    
    [self addConstraint:heightConstraint];
    
    [self updateConstraints];
    self.clipsToBounds = YES;
    _isOpen = NO;
    _openAnimationDuration = 0.3f;
    _closeAnimationDuration = 0.3f;
    _edgeInsets = UIEdgeInsetsZero;
    _elementGap = 0;
    _startingAlpha = 1;
    _finalAlpha = 1;
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches.allObjects firstObject];
    CGPoint locationInView = [touch locationInView:self];

    __block NSInteger touchedIndex = -1;
    
    [elementYRanges enumerateObjectsUsingBlock:^(NSValue * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (NSLocationInRange(locationInView.y, obj.rangeValue)) {
            touchedIndex = idx;
            *stop = YES;
        }
    }];
    
    if (self.delegate && touchedIndex>=0) {
        [self.delegate didSelectedElementAtIndex:touchedIndex inComboBox:self];
    }
    
}

-(void)open {
    
    if (_isOpen) {
        return;
    }
    
    for (UIView *child in self.subviews) {
        [child removeFromSuperview];
    }
    
    if (self.datasource) {
        
        float currentYPos = _edgeInsets.top;
        
        NSUInteger elementNumber = [self.datasource numberOfElementInComboBox:self];
        elementYRanges = [NSMutableArray arrayWithCapacity:elementNumber];
        
        for (NSUInteger elementIndex=0; elementIndex<elementNumber; elementIndex++) {
            
            UIView *elementView = [self.datasource viewForElementAtIndex:elementIndex inComboBox:self];
            
            CGRect originalElementFrame = elementView.frame;
            
            originalElementFrame.origin.x = _edgeInsets.left;
            
            originalElementFrame.size.width = self.frame.size.width - (_edgeInsets.left + _edgeInsets.right);
            
            if (elementIndex>0) {
                currentYPos+=_elementGap;
            }
            
            [elementYRanges addObject:[NSValue valueWithRange:NSMakeRange(currentYPos, originalElementFrame.size.height)]];
            
            originalElementFrame.origin.y = currentYPos;
            
            elementView.frame = originalElementFrame;
            
            [self addSubview:elementView];
            
            currentYPos += originalElementFrame.size.height;
        }
        
        currentYPos += _edgeInsets.bottom;
        heightConstraint.constant = currentYPos;
        self.alpha = _startingAlpha;
        [UIView animateWithDuration:self.openAnimationDuration animations:^{
            [self.superview layoutIfNeeded];
            self.alpha = _finalAlpha;
        } completion:^(BOOL finished) {
            
        }];
        
        _isOpen = YES;
        
        
    }
    
}

-(void)close {
    if (!_isOpen) {
        return;
    }
    heightConstraint.constant = 0;
    [UIView animateWithDuration:self.closeAnimationDuration animations:^{
        [self.superview layoutIfNeeded];
        self.alpha = _startingAlpha;
    } completion:^(BOOL finished) {
        for (UIView *child in self.subviews) {
            [child removeFromSuperview];
        }
    }];
    _isOpen = NO;
}

-(void)toogle {
    if (_isOpen) {
        [self close];
    }else {
        [self open];
    }
}

@end
