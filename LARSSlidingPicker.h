//
//  LARSSlidingPicker.h
//  Droid Light
//
//  Created by Lars Anderson on 11/9/10.
//
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

#import <UIKit/UIKit.h>


@interface LARSSlidingPicker : UIPickerView {
@private
	BOOL _hidden;
    UIView *__weak _auxView;
    LARSSlidingPicker *__weak _otherPicker;
}
@property (nonatomic, getter=isHidden) BOOL hidden;
@property (nonatomic, weak) UIView *auxView;
@property (nonatomic, weak) LARSSlidingPicker *otherPicker;

-(id)initWithHeight:(CGFloat)height;
-(void)togglePicker;
- (void)togglePickerWithAdditionalView:(UIView *)view;
- (void)togglePickerBeforeToggling:(LARSSlidingPicker *)otherPicker;
-(void)togglePickerBeforeToggling:(LARSSlidingPicker *)otherPicker withAdditionalView:(UIView *)view;
- (void)pickerAnimatedHidden;
- (void)pickerAnimatedVisible;

@end
