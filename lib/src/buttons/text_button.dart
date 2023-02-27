// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class DariXTextButton extends StatefulWidget {
  Function onPressed;
  String buttonText;
  double? width;
  double? height;
  double? progressBarLength;
  Color? progressBarColor;

  DariXTextButton({
    super.key,
    required this.onPressed,
    required this.buttonText,
    this.width,
    this.height,
    this.progressBarLength,
    this.progressBarColor,
  }) {
    progressBarLength = progressBarLength ?? 65;
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
    await widget.onPressed();
    setState(() {
      _isLoading = false; // Set the flag back to false when the task is done
    });
  }

  Container _LinearProgressBar() {
    return Container(
      width: widget.progressBarLength,
      padding: const EdgeInsets.all(2.0),
      child: LinearProgressIndicator(
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
          onPressed: _onPressed,
          child: _isLoading ? _LinearProgressBar() : Text(widget.buttonText),
        ),
      ),
    );
  }
}
