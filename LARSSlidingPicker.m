//
//  LARSSlidingPicker.m
//  RealLED
//
//  Created by Lars Anderson on 11/9/10.

// The MIT License
//
// Copyright (c) 2010-2011 Lars Anderson
// 
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
// 
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//

#define ANIMATION_DURATION 0.15

#import "LARSSlidingPicker.h"


@implementation LARSSlidingPicker

@synthesize hidden = _hidden;
@synthesize otherPicker = _otherPicker;
@synthesize auxView = _auxView;

- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code.
		self.frame = frame;
		[self setHidden:YES];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

-(id)init{
	return [self initWithFrame:CGRectMake(0.0f, 460.0f, 320.0f, 180.0f)];
}

-(id)initWithHeight:(CGFloat)height{
	return [self initWithFrame:CGRectMake(0.0f, 460.0f, 320.0f, height)];
}

-(void)togglePickerBeforeToggling:(LARSSlidingPicker *)otherPicker withAdditionalView:(UIView *)view{
	[self setAuxView:view];
    [self setOtherPicker:otherPicker];
	if ([self isHidden]) {
		//animate picker on screen
        
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:ANIMATION_DURATION];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDidStopSelector:@selector(pickerAnimatedVisible)];

        self.frame = CGRectOffset(self.frame, 0, -self.frame.size.height);
        view.frame = CGRectOffset(view.frame, 0, -self.frame.size.height);
        
        [UIView commitAnimations];
	}
	else {		
		//animate picker off screen
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:ANIMATION_DURATION];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDidStopSelector:@selector(pickerAnimatedHidden)];
        
        self.frame = CGRectOffset(self.frame, 0, self.frame.size.height);
        view.frame = CGRectOffset(view.frame, 0, self.frame.size.height);

        [UIView commitAnimations];
	}
}

- (void)pickerAnimatedHidden{
    NSLog(@"picker is hidden!");
    [self setHidden:YES];
    if ([self otherPicker] != nil) {
        [[self otherPicker] togglePickerWithAdditionalView:[self auxView]];
        _otherPicker = nil;
        _auxView = nil;
    }
}
         
- (void)pickerAnimatedVisible{
    NSLog(@"Picker is visible!");
    [self setHidden:NO];
    if ([self otherPicker] != nil) {
        [[self otherPicker] togglePickerWithAdditionalView:[self auxView]];
        _otherPicker = nil;
        _auxView = nil;
    }
    
}

- (void)togglePickerBeforeToggling:(LARSSlidingPicker *)otherPicker{
	[self togglePickerBeforeToggling:otherPicker withAdditionalView:nil];
}

- (void)togglePickerWithAdditionalView:(UIView *)view{
	[self togglePickerBeforeToggling:nil withAdditionalView:view];
}

- (void)togglePicker{
	[self togglePickerBeforeToggling:nil withAdditionalView:nil];
}


@end
