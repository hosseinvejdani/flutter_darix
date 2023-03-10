// ignore_for_file: non_constant_identifier_names, must_be_immutable, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';

/// This code is a custom class representing a text button in the Flutter UI framework. The top part of this code is defining the class itself and the various properties that are available when creating an instance of DariXTextButton.
///
///The _DariXTextButtonState subclass handles the loading state of the button. Its build method handles the displaying of the actual button with its style and text content, as well as displaying the progress indicator when appropriate.
///
///The _onPressed and _onLongPress methods handle the execution of the task tied to the pressing of the button and triggering the on-screen progress bar if present. Finally, the _progressBar method builds the correct progress bar based on the given configuration.
class DariXTextButton extends StatefulWidget {
  final String buttonText; // Text for the button
  final TextStyle? textStyle; // Style for the text
  final Function? onPressed; // Function to perform when the button is pressed
  final Function? onLongPressed; // Function to perform when the button is long-pressed
  final double? width; // Widht of the button
  final double? height; // Height of the button
  final ButtonStyle? buttonStyle; // Style of the button
  final double? progressBarLength; // Length of the progress bar, if present
  final Color? progressBarColor; // Color of the progress bar, if present
  final Widget? customProgressBar; // Custom progress bar widget, if specified

  const DariXTextButton({
    super.key,
    required this.buttonText,
    this.textStyle,
    this.onPressed,
    this.onLongPressed,
    this.width,
    this.height,
    this.buttonStyle,
    this.progressBarLength,
    this.progressBarColor,
    this.customProgressBar,
  });

  @override
  State<DariXTextButton> createState() => _DariXTextButtonState();
}

class _DariXTextButtonState extends State<DariXTextButton> {
  bool _isLoading = false; // A flag to indicate whether the button is loading
  bool _disposed = false;

  void _onPressed() async {
    try {
      setState(() {
        _isLoading = true; // Set the flag to true when the button is pressed
      });

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

//Function that handles generating progress bars for Widgets
  Container _progressBar() {
    final _progressBarLength = widget.progressBarLength ?? 65;
    //Returns a Container widget
    return Container(
      //Sets the width of the progress bar to the length passed in through widget property
      width: _progressBarLength,
      //Padding to make sure all views have adequate spacing
      padding: const EdgeInsets.all(2.0),
      //Child of the container is either a custom progress bar issued as an argument or
      //A LinearProgressIndicator with set properties.
      child: widget.customProgressBar ??
          LinearProgressIndicator(
            color: widget.progressBarColor,
            minHeight: 3,
          ),
    );
  }

  @override
  void deactivate() {
    _disposed = true;
    super.deactivate();
  }

  ///This function is used to build the button. It returns a SizedBox with width and height from the widget, and has a TextButton centered inside it. The onPressed and onLongPress properties of the TextButton are set to the corresponding functions if the flag _isLoading is not set. The Text Button's child is either the loading bar, or the text that is set in the buttonText property.
  @override
  Widget build(BuildContext context) {
    // Returns a sizedBox with width and height specified by the widget
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Center(
        // Creates a TextButton, with onPressed and onLongPress specified in the widget
        child: TextButton(
          onPressed: widget.onPressed != null ? (_isLoading ? null : _onPressed) : null,
          onLongPress: widget.onLongPressed != null ? (_isLoading ? null : _onLongPressed) : null,
          style: widget.buttonStyle,
          // Conditionally display either the progress bar, or the text based on the _isLoading flag
          child: _isLoading ? _progressBar() : Text(widget.buttonText, style: widget.textStyle),
        ),
      ),
    );
  }
}
