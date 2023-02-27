import 'package:flutter/material.dart';

class DariXOutlinedButton extends StatefulWidget {
  String buttonText;
  TextStyle? textStyle;
  Function? onPressed;
  Function? onLongPressed;
  double? width;
  double? height;
  Icon? icon;
  ButtonStyle? buttonStyle;
  double? progressBarSize;
  Color? progressBarColor;
  Color? sideColor;
  Widget? customProgressBar;

  DariXOutlinedButton({
    Key? key,
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
  }) {
    progressBarSize = progressBarSize ?? (icon != null ? icon!.size : 22);
    onPressed = onPressed ?? () {};
    onLongPressed = onLongPressed ?? () {};
  }

  @override
  State<DariXOutlinedButton> createState() => _DariXOutlinedButtonState();
}

class _DariXOutlinedButtonState extends State<DariXOutlinedButton> {
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
      child: OutlinedButton(
        style: widget.buttonStyle ??
            OutlinedButton.styleFrom(
              side: BorderSide(color: widget.sideColor ?? Theme.of(context).colorScheme.primary),
            ),
        onPressed: _isLoading ? null : _onPressed,
        onLongPress: _isLoading ? null : _onLongPressed,
        child: _isLoading ? _progressBar() : Text(widget.buttonText, style: widget.textStyle),
      ),
    );
  }

  Widget _buttonWithIcon() {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: OutlinedButton.icon(
        style: widget.buttonStyle ??
            OutlinedButton.styleFrom(
              side: BorderSide(color: widget.sideColor ?? Theme.of(context).colorScheme.primary),
            ),
        onPressed: _isLoading ? null : _onPressed,
        onLongPress: _isLoading ? null : _onLongPressed,
        icon: _isLoading ? _progressBar() : widget.icon!, // Use an Icon as icon when not loading
        label: Text(widget.buttonText, style: widget.textStyle),
      ),
    );
  }

  Container _progressBar() {
    return Container(
      height: widget.progressBarSize,
      width: widget.progressBarSize,
      padding: const EdgeInsets.all(2.0),
      child: widget.customProgressBar ??
          const CircularProgressIndicator(
            strokeWidth: 3,
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.icon == null ? _simpleButton() : _buttonWithIcon();
  }
}
