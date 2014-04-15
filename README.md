# HLProgressView

HLProgressView is a lightweight and easy-to-use progress view, subclass of UIView.

## Installation

_**If your project doesn't use ARC**: you must add the `-fobjc-arc` compiler flag to `HLProgressView.m` in Target Settings > Build Phases > Compile Sources._

* Drag the `./HLProgressView` folder into your project.
* Import `HLProgressView.h` in your view controller.

## Usage

Drag a UIView component, make it a subclass of HLProgressView, then drag an IBOutlet, or simply instantiate a new object of kind HLProgressView.

Update the current progress state by setting the `progress` value of your HLProgressView instance. You should pass a parameter **between 0. and 1.**.

### Customization

To change default line color and width values, use `color` and `width` properties of your HLProgressView instance.

## Credits

HLProgressView was developed by Emmanuel Perez & [Hervé Heurtault de Lammerville](http://www.fifty-degrees.com). If you have any feature suggestion or bug report, please help out by creating [an issue](https://github.com/fiftydegrees/HLProgressView/issues/new) on GitHub. If you're using HLProgressView in your project, attribution would be apprecied.
