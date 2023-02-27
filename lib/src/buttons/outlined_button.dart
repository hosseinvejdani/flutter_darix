import 'package:flutter/material.dart';

class DariXOutlinedButton extends StatefulWidget {
  Function onPressed;
  String buttonText;
  double? width;
  double? height;
  Icon? icon;
  double? progressBarSize;
  Color? progressBarColor;
  Color? sideColor;

  DariXOutlinedButton({
    Key? key,
    required this.onPressed,
    required this.buttonText,
    this.width,
    this.height,
    this.icon,
    this.progressBarSize,
    this.progressBarColor,
    this.sideColor,
  }) {
    progressBarSize = progressBarSize ?? (icon != null ? icon!.size : 22);
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
    await widget.onPressed();
    setState(() {
      _isLoading = false; // Set the flag back to false when the task is done
    });
  }

  Widget _simpleButton() {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: widget.sideColor ?? Theme.of(context).colorScheme.primary),
        ),
        onPressed: _onPressed,
        child: _isLoading ? _circularProgressBar() : Text(widget.buttonText),
      ),
    );
  }

  Widget _buttonWithIcon() {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: OutlinedButton.icon(
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: widget.sideColor ?? Theme.of(context).colorScheme.primary),
        ),
        onPressed: _onPressed,
        icon: _isLoading ? _circularProgressBar() : widget.icon!, // Use an Icon as icon when not loading
        label: Text(widget.buttonText),
      ),
    );
  }

  Container _circularProgressBar() {
    return Container(
      height: widget.progressBarSize,
      width: widget.progressBarSize,
      padding: const EdgeInsets.all(2.0),
      child: const CircularProgressIndicator(
        strokeWidth: 3,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.icon == null ? _simpleButton() : _buttonWithIcon();
  }
}
