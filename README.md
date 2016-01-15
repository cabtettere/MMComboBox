# MMComboBox

[![CI Status](http://img.shields.io/travis/Marco Mardegan/MMComboBox.svg?style=flat)](https://travis-ci.org/Marco Mardegan/MMComboBox)
[![Version](https://img.shields.io/cocoapods/v/MMComboBox.svg?style=flat)](http://cocoapods.org/pods/MMComboBox)
[![License](https://img.shields.io/cocoapods/l/MMComboBox.svg?style=flat)](http://cocoapods.org/pods/MMComboBox)
[![Platform](https://img.shields.io/cocoapods/p/MMComboBox.svg?style=flat)](http://cocoapods.org/pods/MMComboBox)

![Open combobox](/screens/screen0.png?raw=true "Open combobox")

## Description

A classic combobox with editabile open and close animation time, element gap, elements insets.
The element view can ben any UIView subclass.

## Usage

1. Insert ad UIView in your storyboard and change class to MMComboBox.
2. Add an height constraint with low priority
3. Implement MMComboBoxDatasource protocol
4. Call '[_combobox open]' to show the combobox
5. Implement MMComboBoxDelegate protocol to intercept element selection event

## Requirements

Use of ARC and auto-layout.

## Installation

MMComboBox is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "MMComboBox"
```

## Author

Marco Mardegan, mardegan.m@gmail.com

## License

MMComboBox is available under the MIT license. See the LICENSE file for more info.
