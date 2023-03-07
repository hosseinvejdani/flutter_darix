// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';

/// This code defines a class called DariXOutlinedButton which is a custom button widget for the Flutter framework.
///
/// It has several parameters that can be passed in to customize the button, such as the text to display, the text style, and an icon.
///
///  It also has two functions, onPressed and onLongPressed, that can be used to perform an action when the button is pressed or held down.
///
///  The class also contains a flag called _isLoading which is used to indicate whether the button is currently loading or not.
///
///  Finally, it contains two methods: _simpleButton() and _buttonWithIcon(), which are used to create
/// either a simple button or a button with an icon depending on what parameters were passed in.
class DariXOutlinedButton extends StatefulWidget {
  /// The text written on the button.
  final String buttonText;

  /// The style used for the text written on the button.
  final TextStyle? textStyle;

  /// Called when the user tapped and released the button quickly.
  final Function? onPressed;

  /// Called when the user presses down on the button and holds it.
  final Function? onLongPressed;

  /// The width of the button.
  final double? width;

  /// The height of the button.
  final double? height;

  /// An icon to show on the button.
  final Icon? icon;

  /// Defines the visual appearance of the button.
  final ButtonStyle? buttonStyle;

  /// The size of the progress bar inside the button.
  final double? progressBarSize;

  /// The color of the progress bar.
  final Color? progressBarColor;

  /// The color on either side of the progress bar.
  final Color? sideColor;

  /// A custom widget to use as the progress bar instead of a linear one.
  final Widget? customProgressBar;

  const DariXOutlinedButton({
    super.key,
    required this.buttonText,
    this.textStyle,
    this.onPressed,
    this.onLongPressed,
    this.width,
    this.height,
    this.icon,
    this.buttonStyle,
    this.progressBarSize,
    this.progressBarColor,
    this.sideColor,
    this.customProgressBar,
  });

  @override
  State<DariXOutlinedButton> createState() => _DariXOutlinedButtonState();
}

class _DariXOutlinedButtonState extends State<DariXOutlinedButton> {
  bool _isLoading = false; // A flag to indicate whether the button is loading
  bool _disposed = false;

  void _onPressed() async {
    try {
      setState(() {
        _isLoading = true; // Set the flag to true when the button is pressed
      });

      // This function runs once the onPressed() event has been triggered //
      await widget.onPressed!();

      if (!_disposed) {
        setState(() {
          _isLoading = false; // Set the flag back to false when the task is done
        });
      }
    } on Exception catch (_) {
      // TODO
    }
  }

  // This function runs once the onLongPressed() event has been triggered //
  void _onLongPressed() async {
    try {
      setState(() {
        _isLoading = true; // Set the flag to true when the button is pressed
      });

      await widget.onLongPressed!();
      if (!_disposed) {
        setState(() {
          _isLoading = false; // Set the flag back to false when the task is done
        });
      }
    } on Exception catch (_) {
      // TODO
    }
  }

  ///This function returns a SizedBox widget with an OutlinedButton as its child. The button style and size is based off parameters that can be set via the State's widget variable. It also has an onPressed property for handling the press action and an onLongPress property for handling long pressing. Its text property is dependent on loading status and either provides custom progress bar or button text style based on the provided parameter from the widget variable.
  Widget _simpleButton() {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: OutlinedButton(
        style: widget.buttonStyle ??
            OutlinedButton.styleFrom(
              side: BorderSide(color: widget.sideColor ?? Theme.of(context).colorScheme.primary),
            ),
        onPressed: widget.onPressed != null ? (_isLoading ? null : _onPressed) : null,
        onLongPress: widget.onLongPressed != null ? (_isLoading ? null : _onLongPressed) : null,
        child: _isLoading ? _progressBar() : Text(widget.buttonText, style: widget.textStyle),
      ),
    );
  }

  /// This function returns a SizedBox widget as well, but with an OutlinedButton.Icon as its child instead of an OutlinedButton. The button style and size is based off parameters that can be set via the State's widget variable. As with _simpleButton(), it has an onPressed and onLongPress property for managing presses. In this case icon and label properties are used in order to provide either a custom progress bar when loading or Icon and button text style when not loading.
  Widget _buttonWithIcon() {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: OutlinedButton.icon(
        style: widget.buttonStyle ??
            OutlinedButton.styleFrom(
              side: BorderSide(color: widget.sideColor ?? Theme.of(context).colorScheme.primary),
            ),
        onPressed: widget.onPressed != null ? (_isLoading ? null : _onPressed) : null,
        onLongPress: widget.onLongPressed != null ? (_isLoading ? null : _onLongPressed) : null,
        icon: _isLoading ? _progressBar() : widget.icon!, // Use an Icon as icon when not loading
        label: Text(widget.buttonText, style: widget.textStyle),
      ),
    );
  }

  ///This function is responsible for returning the custom display elements of the button when the loading state is active, using the parameters passed along the widget variable. It is a Container widget with the CircularProgressIndicator set as child by default. However, you can use a custom ProgressBar if you prefer.
  Container _progressBar() {
    final _progressBarSize = widget.progressBarSize ?? (widget.icon != null ? widget.icon!.size : 22);

    return Container(
      height: _progressBarSize,
      width: _progressBarSize,
      padding: const EdgeInsets.all(2.0),
      child: widget.customProgressBar ??
          const CircularProgressIndicator(
            strokeWidth: 3,
          ),
    );
  }

  @override
  void deactivate() {
    _disposed = false;
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return widget.icon == null ? _simpleButton() : _buttonWithIcon();
  }
}
