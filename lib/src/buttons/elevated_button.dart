import 'package:flutter/material.dart';

class DariXElevatedButton extends StatefulWidget {
  Function? onPressed;
  Function? onLongPressed;
  String buttonText;
  double? width;
  double? height;
  Icon? icon;
  ButtonStyle? style;
  double? progressBarSize;
  Color? progressBarColor;
  Widget? customProgressBar;

  DariXElevatedButton({
    super.key,
    required this.buttonText,
    this.onPressed,
    this.onLongPressed,
    this.width,
    this.height,
    this.icon,
    this.style,
    this.progressBarSize,
    this.progressBarColor,
    this.customProgressBar,
  }) {
    progressBarSize = progressBarSize ?? (icon != null ? icon!.size : 22);
    onPressed = onPressed ?? () {};
    onLongPressed = onLongPressed ?? () {};
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
    // Simulate a long-running task (e.g. network request)
    await widget.onPressed!();
    setState(() {
      _isLoading = false; // Set the flag back to false when the task is done
    });
  }

  void _onLongPressed() async {
    setState(() {
      _isLoading = true; // Set the flag to true when the button is pressed
    });
    // Simulate a long-running task (e.g. network request)
    await widget.onLongPressed!();
    setState(() {
      _isLoading = false; // Set the flag back to false when the task is done
    });
  }

  Widget _simpleButton() {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: ElevatedButton(
        onPressed: _onPressed,
        onLongPress: _onLongPressed,
        style: widget.style,
        child: _isLoading ? _progressBar() : Text(widget.buttonText),
      ),
    );
  }

  Widget _buttonWithIcon() {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: ElevatedButton.icon(
        onPressed: _onPressed,
        onLongPress: _onLongPressed,
        icon: _isLoading ? _progressBar() : widget.icon!, // Use an Icon as icon when not loading
        label: Text(widget.buttonText),
        style: widget.style,
      ),
    );
  }

  Widget _progressBar() {
    return Container(
      height: widget.progressBarSize,
      width: widget.progressBarSize,
      padding: const EdgeInsets.all(2.0),
      child: widget.customProgressBar ??
          CircularProgressIndicator(
            color: widget.progressBarColor,
            strokeWidth: 3,
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.icon == null ? _simpleButton() : _buttonWithIcon();
  }
}
