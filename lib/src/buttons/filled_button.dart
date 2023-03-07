// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';

/// This code creates a filled button widget for the Flutter app that can be used to perform certain tasks with the addition of icons.
///
/// The widget class DariXFilledButton accepts optional parameters, such as [buttonText], [textStyle], [onPressed], [onLongPress], [width], [height], [icon], [buttonStyle], [progressBarSize], [progressBarColor], [isTonal], and [customProgressBar].
///
/// The stateful widget _DariXFilledButtonState provides two functions _onPressed() and _onLongPressed() which are used to handle when the button is pressed and logn pressed respectively.
///
///  If a customProgressBar is not provided then a circular progress indicator is used.
///
///  Finally, the widget uses either _simpleButton() or _buttonWithIcon() depending on the availability of the icon.
class DariXFilledButton extends StatefulWidget {
// String used to set the text shown on the button
  final String buttonText;

// Used to style the text
  final TextStyle? textStyle;

// Function invoked when the user taps the button
  final Function? onPressed;

// Function invoked when user holds down the button
  final Function? onLongPressed;

// Used to set the width of the button
  final double? width;

// Used to set the height of the button
  final double? height;

// Icon shown on the button
  final Icon? icon;

// Button appearance can be changed by setting this
  final ButtonStyle? buttonStyle;

// Used to set the size of the progress bar
  final double? progressBarSize;

// Used to set the color of the progress bar
  final Color? progressBarColor;

// Used to indicate if the progress bar is tonal
  final bool? isTonal;

// Used to customize the progress bar as a widget
  final Widget? customProgressBar;

  const DariXFilledButton({
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
    this.isTonal = false,
    this.customProgressBar,
  });

  @override
  State<DariXFilledButton> createState() => _DariXFilledButtonState();
}

class _DariXFilledButtonState extends State<DariXFilledButton> {
  bool _isLoading = false; // A flag to indicate whether the button is loading
  bool _disposed = false;

  void _onPressed() async {
    try {
      setState(() {
        _isLoading = true; // Set the flag to true when the button is pressed
      });

      // Call the 'onPressed' method
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

// Set the flag to true when the button is pressed
  void _onLongPressed() async {
    try {
      setState(() {
        _isLoading = true;
      });

      // Call the callback function when pressed
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

  Widget _simpleButton() {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      // Show progress bar or text depending on the _isLoading flag value
      child: widget.isTonal!
          ? FilledButton.tonal(
              onPressed: widget.onPressed != null ? (_isLoading ? null : _onPressed) : null,
              onLongPress: widget.onLongPressed != null ? (_isLoading ? null : _onLongPressed) : null,
              style: widget.buttonStyle,
              child: _isLoading ? _progressBar() : Text(widget.buttonText, style: widget.textStyle),
            )
          : FilledButton(
              onPressed: widget.onPressed != null ? (_isLoading ? null : _onPressed) : null,
              onLongPress: widget.onLongPressed != null ? (_isLoading ? null : _onLongPressed) : null,
              style: widget.buttonStyle,
              child: _isLoading ? _progressBar() : Text(widget.buttonText, style: widget.textStyle),
            ),
    );
  }

  Widget _buttonWithIcon() {
    // Use an Icon as icon when not loading
    final _icon = _isLoading ? _progressBar() : widget.icon!;
    final _label = Text(widget.buttonText, style: widget.textStyle);
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: widget.isTonal!
          ? FilledButton.tonalIcon(
              // Disable the button while loading
              onPressed: widget.onPressed != null ? (_isLoading ? null : _onPressed) : null,
              onLongPress: widget.onLongPressed != null ? (_isLoading ? null : _onLongPressed) : null,
              icon: _icon,
              label: _label,
              style: widget.buttonStyle,
            )
          : FilledButton.icon(
              // Disable the button while loading
              onPressed: widget.onPressed != null ? (_isLoading ? null : _onPressed) : null,
              onLongPress: widget.onLongPressed != null ? (_isLoading ? null : _onLongPressed) : null,
              icon: _icon,
              label: _label,
              style: widget.buttonStyle,
            ),
    );
  }

  Container _progressBar() {
    final _progressBarSize = widget.progressBarSize ?? (widget.icon != null ? widget.icon!.size : 22);

    // Returns a Container widget
    final _progressBarColor = widget.progressBarColor ?? Theme.of(context).buttonTheme.colorScheme!.onBackground.withAlpha(120); // Sets the progress bar color
    final _progressBarColorTonal = widget.progressBarColor ?? Theme.of(context).buttonTheme.colorScheme!.onBackground.withAlpha(180); // Sets the tonal effect on the color making it slightly brighter
    final _color = widget.isTonal! ? _progressBarColorTonal : _progressBarColor; // Determines which color should be used
    return Container(
      height: _progressBarSize, // Determines the height of the progress bar
      width: _progressBarSize, // Determines the width of the progress bar
      padding: const EdgeInsets.all(2.0),
      child: widget.customProgressBar ?? CircularProgressIndicator(color: _color, strokeWidth: 3), // Sets the progress bar as the child of the container
    );
  }

  @override
  void deactivate() {
    _disposed = true;
    super.deactivate();
  }

  /// This method returns either a _simpleButton() widget if no icon was provided, or a _buttonWithIcon() widget otherwise.
  /// At this point, we can assume that both methods exist and do not require further explanation.
  @override
  Widget build(BuildContext context) {
    return widget.icon == null ? _simpleButton() : _buttonWithIcon();
  }
}
