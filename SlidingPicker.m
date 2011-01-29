//
//  SlidingPicker.m
//  RealLED
//
//  Created by Lars Anderson on 11/9/10.
//  Copyright 2010 Lars Anderson. All rights reserved.
//
#define ANIMATION_DURATION 0.15

#import "SlidingPicker.h"


@implementation SlidingPicker

@synthesize hidden;

- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code.
		self.frame = frame;
		[self setHidden:YES];
    }
    return self;
}

-(id)init{
	return [self initWithFrame:CGRectMake(0.0f, 460.0f, 320.0f, 180.0f)];
}

-(id)initWithHeight:(CGFloat)height{
	return [self initWithFrame:CGRectMake(0.0f, 460.0f, 320.0f, height)];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code.
}
*/

-(void)togglePickerBeforeToggling:(SlidingPicker *)otherPicker withAdditionalView:(UIView *)view{
	
	if ([self isHidden]) {
		//animate picker on screen
		[UIView animateWithDuration:ANIMATION_DURATION 
							  delay:0 
							options:UIViewAnimationOptionCurveEaseIn
						 animations:^{
							 self.frame = CGRectOffset(self.frame, 0, -self.frame.size.height);
							 view.frame = CGRectOffset(view.frame, 0, -self.frame.size.height);
						 }
						 completion:^(BOOL finished){
							 [self setHidden:NO];
							 if (otherPicker != nil) {
								 [otherPicker togglePickerWithAdditionalView:view];
							 }
						 }
		 ];
	}
	else {		
		//animate picker off screen
		[UIView animateWithDuration:ANIMATION_DURATION 
							  delay:0 
							options:UIViewAnimationOptionCurveEaseOut
						 animations:^{
							 self.frame = CGRectOffset(self.frame, 0, self.frame.size.height);
							 view.frame = CGRectOffset(view.frame, 0, self.frame.size.height);
						 }
						 completion:^(BOOL finished){
							 [self setHidden:YES];
							 if (otherPicker != nil) {
								 [otherPicker togglePickerWithAdditionalView:view];
							 }
						 }
		 ];
	}
}

- (void)togglePickerBeforeToggling:(SlidingPicker *)otherPicker{
	[self togglePickerBeforeToggling:otherPicker withAdditionalView:nil];
}

- (void)togglePickerWithAdditionalView:(UIView *)view{
	[self togglePickerBeforeToggling:nil withAdditionalView:view];
}

- (void)togglePicker{
	[self togglePickerBeforeToggling:nil withAdditionalView:nil];
}

- (void)dealloc {
    [super dealloc];
	self = nil;
}


@end
