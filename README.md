<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->
[![pub](https://img.shields.io/pub/v/flutter_darix.svg)](https://pub.dev/packages/flutter_darix)
[![license: MIT](https://img.shields.io/badge/license-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

A Simple Flutter package that help to create buttons with inner progressBar indicator for using delayed processes.
This package contains 5 button types: TextButton, ElevatedButton, simple and tonal FilledButton, and OutlinedButton.
You can pass an icon for ElevatedButton, FilledButton, OutlinedButton optionaly.

## Preview

![Flutter Buttons with progressbar indicators](https://github.com/hosseinvejdani/flutter_darix/blob/master/assets/buttons.png)

## Getting started

To use this package, add flutter_darix as a dependency in your pubspec.yaml file. Then import the package like this:
```
import 'package:flutter_darix/flutter_darix.dart';
```

## Usage
There are some simple examples:

### TextButton example 
```dart
DariXTextButton(
   onPressed: () {},
   buttonText: 'push me!',
   width: 140,
   height: 45,
)
```

### FilledButton without icon 

```dart
DariXFilledButton(
   onPressed: () {},
   buttonText: 'push me!',
   width: 140,
   height: 45,
)
```

### FilledButton with icon 
```dart
DariXFilledButton(
   onPressed: () {},
   buttonText: 'push me!',
   width: 140,
   height: 45,
   icon: const Icon(Icons.save),
)
```

### Tonal FilledButton without icon 
```dart
DariXFilledButton(
   onPressed: () {},
   buttonText: 'push me!',
   width: 140,
   height: 45,
   isTonal: true,
)
```

### Tonal FilledButton with icon 
```dart
DariXFilledButton(
   onPressed: () {},
   buttonText: 'push me!',
   width: 140,
   height: 45,
   icon: const Icon(Icons.save),
   isTonal: true,
)
```

### ElevatedButton without icon 
```dart
DariXElevatedButton(
   onPressed: () {},
   buttonText: 'push me!',
   width: 140,
   height: 45,
)
```

### ElevatedButton with icon 
```dart
DariXElevatedButton(
   onPressed: () {},
   buttonText: 'push me!',
   width: 140,
   height: 45,
   icon: const Icon(Icons.save),
)
```

### OutlinedButton without icon 
```dart
DariXOutlinedButton(
   onPressed: () {},
   buttonText: 'push me!',
   width: 140,
   height: 45,
)
```

### OutlinedButton with icon 
```dart
DariXOutlinedButton(
   onPressed: () {},
   buttonText: 'push me!',
   width: 140,
   height: 45,
   icon: const Icon(Icons.save),
)
```

## Notes
For more customizations, you can use some other optional filed for the buttons such as:
style, progressBarSize, progressBarColor, customProgressBar, etc. 
for more info see source code of each button class in [repo](https://github.com/hosseinvejdani/flutter_darix).
