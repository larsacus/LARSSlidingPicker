#LARSSlidingPicker

## Description
`LARSSlidingPicker` is a subclass of UIPicker that supports pairing with another `LARSSlidingPicker` to support chained toggling.  The sliding picker was designed to eliminate the need for a second page to grab input from a `UIPicker`.
The Sliding Picker adds the following new features above the standard `UIPicker` class:

1. Provides the UIPicker class with the ability to be called and mimic the look/feel of the standard keyboard.  The picker will slide onto the screen from the bottom just like the native iPhone keyboard.
2. Ability to be toggled with a second `LARSSlidingPicker`.  When toggled with a second picker, the first picker will be dismissed just like the native iPhone keyboard while the new picker is toggled on-screen in the same manner.  This can also be paired with a UIView as in #3.
3. Ability to have a `UIView` ride on top of the sliding picker (in my case, this was an iAd `ADBannerView`).

## Usage

1. Create the Sliding Picker just like you would a normal `UIPicker` (create variable, set delegate, etc.)
    ````c++
        [[LARSSlidingPicker alloc] initWithHeight:300];
    ````
2. By default, the picker is created off-screen (if you have a status bar). Need to add support for all types of view containers.
3. To use the picker with another `LARSSlidingPicker`, create another `LARSSlidingPicker` and call the
        ````c
        [picker togglePickerWithOtherPicker:otherPicker];
        ````
4. You can alternatively toggle the picker with a riding view on top
        ````javascript
            [picker togglePickerWithOtherPicker:otherPicker withView:[self adBanner]];
        ````

## License
Copyright (c) 2011 Lars Anderson, drink&apple

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

__THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.__
