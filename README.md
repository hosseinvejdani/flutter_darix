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

A Simple Flutter package that help to create buttons with inner progres-bar indicator.
This package contains 4 button types: TextButton, ElevatedButton, FilledButton, and OutlinedButton.

## Preview

https://github.com/hosseinvejdani/flutter_darix/blob/master/assets/buttons.png

## Getting started

To use this package, add flutter_darix as a dependency in your pubspec.yaml file. Then import the package like this:
```
import 'package:flutter_darix/flutter_darix.dart';
```

## Usage
This is Simple example:

```dart
Column(
   mainAxisAlignment: MainAxisAlignment.center,
   mainAxisSize: MainAxisSize.min,
   children: [
   DariXTextButton(
      onPressed: () async {
         await Future.delayed(const Duration(milliseconds: 500));
         print('---- Helloooo!');
      },
      buttonText: 'push me!',
      width: 140,
   ),
   const SizedBox(height: 30),
   Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         DariXFilledButton(
         onPressed: () async {
            await Future.delayed(const Duration(milliseconds: 500));
            print('---- Helloooo!');
         },
         buttonText: 'push me!',
         width: 140,
         height: 45,
         ),
         const SizedBox(width: 30),
         DariXFilledButton(
         onPressed: () async {
            await Future.delayed(const Duration(milliseconds: 500));
            print('---- Helloooo!');
         },
         buttonText: 'push me!',
         width: 140,
         height: 45,
         icon: const Icon(Icons.save, size: 22),
         ),
      ],
   ),
   const SizedBox(height: 30),
   Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         DariXFilledButton(
         onPressed: () async {
            await Future.delayed(const Duration(milliseconds: 500));
            print('---- Helloooo!');
         },
         buttonText: 'push me!',
         width: 140,
         height: 45,
         isTonal: true,
         ),
         const SizedBox(width: 30),
         DariXFilledButton(
         onPressed: () async {
            await Future.delayed(const Duration(milliseconds: 500));
            print('---- Helloooo!');
         },
         buttonText: 'push me!',
         width: 140,
         height: 45,
         icon: const Icon(Icons.save, size: 22),
         isTonal: true,
         ),
      ],
   ),
   const SizedBox(height: 30),
   Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         DariXElevatedButton(
         onPressed: () async {
            await Future.delayed(const Duration(milliseconds: 500));
            print('---- Helloooo!');
         },
         buttonText: 'push me!',
         width: 140,
         height: 45,
         ),
         const SizedBox(width: 30),
         DariXElevatedButton(
         onPressed: () async {
            await Future.delayed(const Duration(milliseconds: 500));
            print('---- Helloooo!');
         },
         buttonText: 'push me!',
         width: 140,
         height: 45,
         icon: const Icon(Icons.save, size: 22),
         ),
      ],
   ),
   const SizedBox(height: 30),
   Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         DariXOutlinedButton(
         onPressed: () async {
            await Future.delayed(const Duration(milliseconds: 500));
            print('---- Helloooo!');
         },
         buttonText: 'push me!',
         width: 140,
         height: 45,
         sideColor: Theme.of(context).colorScheme.primary,
         ),
         const SizedBox(width: 30),
         DariXOutlinedButton(
         onPressed: () async {
            await Future.delayed(const Duration(milliseconds: 500));
            print('---- Helloooo!');
         },
         buttonText: 'push me!',
         width: 140,
         height: 45,
         icon: const Icon(Icons.save, size: 22),
         sideColor: Theme.of(context).colorScheme.primary,
         ),
      ],
   ),
   ],
)
```


