# HLProgressView

HLProgressView is a lightweight and easy-to-use progress view, subclass of UIView.

![Preview: HLProgressView on iOS7](cloud.makeitbad.fr/fiftydegrees/HLProgressView.png)
![Preview: HLProgressView on iOS7](cloud.makeitbad.fr/fiftydegrees/HLProgressView.gif)

## Installation

_**If your project doesn't use ARC**: you must add the `-fobjc-arc` compiler flag to `HLProgressView.m` in Target Settings > Build Phases > Compile Sources._

* Drag the `./HLProgressView` folder into your project.
* Import `HLProgressView.h` in your view controller.

## Usage

Set the line color and width:
```objective-c
- (void)setColor :(UIColor *)color;
- (void)setWidth :(NSInteger)width;
```

### Storyboard

Drag a UIView component, make it a subclass of HLProgressView, then drag an IBOutlet.

### Source code

Instantiate a new object of type HLProgressView.

```objective-c
HLProgressView *progressView = [HLProgressView new];
```
