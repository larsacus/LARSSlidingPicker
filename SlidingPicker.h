//
//  SlidingPicker.h
//  RealLED
//
//  Created by Lars Anderson on 11/9/10.
//  Copyright 2010 Lars Anderson. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SlidingPicker : UIPickerView {
	BOOL hidden;
}
@property (nonatomic, getter=isHidden) BOOL hidden;

-(id)initWithHeight:(CGFloat)height;
-(void)togglePicker;
- (void)togglePickerWithAdditionalView:(UIView *)view;
- (void)togglePickerBeforeToggling:(SlidingPicker *)otherPicker;
-(void)togglePickerBeforeToggling:(SlidingPicker *)otherPicker withAdditionalView:(UIView *)view;

@end
