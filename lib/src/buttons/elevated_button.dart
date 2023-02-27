import 'package:flutter/material.dart';

///This code defines a custom ElevatedButton widget for the Flutter framework.
///
///The class handle the button press and long press events and to display a progress bar when the button is loading.
///
/// The build method returns either a simple button or a button with an icon depending on whether an icon was provided as a parameter.
///
/// [buttonText] is a String that contains the text that will be displayed on the button.
///
/// [textStyle] is an optional TextStyle object that can be used to customize the text style of the button.
///
/// [onPressed] is an optional Function that will be executed when the button is pressed.
///
/// [onLongPressed] is an optional Function that will be executed when the button is long pressed.
///
/// [width] and [height] are optional double values for setting the width and height of the button, respectively.
///
/// [icon] is an optional Icon object for displaying an icon on the button.
///
/// [buttonStyle] is an optional ButtonStyle object for customizing the look of the button.
///
/// [progressBarSize] and progressBarColor are optional double and Color objects, respectively, for setting size and color of a progress bar if one should appear on the button.
///
/// [customProgressBar] is an optional Widget object for displaying a custom progress bar on the button if desired.
class DariXElevatedButton extends StatefulWidget {
// String to be displayed on the button
  String buttonText;

// Text style object used to change font size and colour, etc.
  TextStyle? textStyle;

// Function called when button is pressed
  Function? onPressed;

// Function called when button is long-pressed
  Function? onLongPressed;

// Width of the button
  double? width;

// Height of the button
  double? height;

// Icon to be displayed on the button in form of an image
  Icon? icon;

// Button style object used to align and style the element's children
  ButtonStyle? buttonStyle;

// Size of the progress bar attached to the button
  double? progressBarSize;

// Color changes the color of the ProgressBar attached to the button
  Color? progressBarColor;

// Widget for customizing ProgressBar
  Widget? customProgressBar;

  DariXElevatedButton({
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
    this.customProgressBar,
  }) {
    // Assign a default value to progressBarSize in case no other value is assigned
    progressBarSize = progressBarSize ?? (icon != null ? icon!.size : 22);
  }

  @override
  State<DariXElevatedButton> createState() => _DariXElevatedButtonState();
}

class _DariXElevatedButtonState extends State<DariXElevatedButton> {
  bool _isLoading = false; // A flag to indicate whether the button is loading

  void _onPressed() async {
    setState(() {
      _isLoading = true; // Set the flag to true when the button is pressed
    });

    await widget.onPressed!();
    setState(() {
      _isLoading = false; // Set the flag back to false when the task is done
    });
  }

  void _onLongPressed() async {
    setState(() {
      _isLoading = true; // Set the flag to true when the button is pressed
    });

    await widget.onLongPressed!();
    setState(() {
      _isLoading = false; // Set the flag back to false when the task is done
    });
  }

  Widget _simpleButton() {
    // Create a button widget
    return SizedBox(
      width: widget.width, // Define the width
      height: widget.height, // Define the height
      child: ElevatedButton(
        onPressed: widget.onPressed != null ? (_isLoading ? null : _onPressed) : null,
        onLongPress: widget.onLongPressed != null ? (_isLoading ? null : _onLongPressed) : null,
        style: widget.buttonStyle, // Set the button style
        child: _isLoading ? _progressBar() : Text(widget.buttonText, style: widget.textStyle), // Add child elements conditionally based on `_isloading`
      ),
    );
  }

  Widget _buttonWithIcon() {
    // Create a SizeBox Widget with set width and height of the button
    return SizedBox(
      width: widget.width,
      height: widget.height,

      // Create an ElevatedButton theme element with icon, label, style and onPress callbacks
      child: ElevatedButton.icon(
        onPressed: widget.onPressed != null ? (_isLoading ? null : _onPressed) : null,
        onLongPress: widget.onLongPressed != null ? (_isLoading ? null : _onLongPressed) : null,
        // Use an Icon as icon when not loading
        icon: _isLoading ? _progressBar() : widget.icon!,
        label: Text(widget.buttonText, style: widget.textStyle),
        style: widget.buttonStyle,
      ),
    );
  }

// Returns a Container with the CircularProgressIndicator or the custom progress bar
  Widget _progressBar() {
    return Container(
      // Sets the height and width of the progress bar
      height: widget.progressBarSize,
      width: widget.progressBarSize,
      padding: const EdgeInsets.all(2.0),

      // Checks whether the customProgressBar has been defined
      // If not, assigns the CircularProgressIndicator
      child: widget.customProgressBar ??
          CircularProgressIndicator(
            color: widget.progressBarColor,
            strokeWidth: 3,
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // if the 'icon' attribute of the widget is null, return _simpleButton()
    // else, return _buttonWithIcon()
    return widget.icon == null ? _simpleButton() : _buttonWithIcon();
  }
}
