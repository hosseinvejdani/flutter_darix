// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class DariXTextButton extends StatefulWidget {
  String buttonText;
  TextStyle? textStyle;
  Function? onPressed;
  Function? onLongPressed;
  double? width;
  double? height;
  ButtonStyle? buttonStyle;
  double? progressBarLength;
  Color? progressBarColor;
  Widget? customProgressBar;

  DariXTextButton({
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
  }) {
    progressBarLength = progressBarLength ?? 65;
    onPressed = onPressed ?? () {};
    onLongPressed = onLongPressed ?? () {};
  }

  @override
  State<DariXTextButton> createState() => _DariXTextButtonState();
}

class _DariXTextButtonState extends State<DariXTextButton> {
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

  Container _progressBar() {
    return Container(
      width: widget.progressBarLength,
      padding: const EdgeInsets.all(2.0),
      child: widget.customProgressBar ??
          LinearProgressIndicator(
            color: widget.progressBarColor,
            minHeight: 3,
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Center(
        child: TextButton(
          onPressed: _isLoading ? null : _onPressed,
          onLongPress: _isLoading ? null : _onLongPressed,
          style: widget.buttonStyle,
          child: _isLoading ? _progressBar() : Text(widget.buttonText, style: widget.textStyle),
        ),
      ),
    );
  }
}
