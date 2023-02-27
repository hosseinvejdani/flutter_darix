import 'package:flutter/material.dart';

class DariXFilledButton extends StatefulWidget {
  Function onPressed;
  String buttonText;
  double? width;
  double? height;
  Icon? icon;
  double? progressBarSize;
  Color? progressBarColor;
  bool? isTonal;

  DariXFilledButton({
    super.key,
    required this.onPressed,
    required this.buttonText,
    this.width,
    this.height,
    this.icon,
    this.progressBarSize,
    this.progressBarColor,
    this.isTonal,
  }) {
    progressBarSize = progressBarSize ?? (icon != null ? icon!.size : 22);
    isTonal = isTonal ?? false;
  }

  @override
  State<DariXFilledButton> createState() => _DariXFilledButtonState();
}

class _DariXFilledButtonState extends State<DariXFilledButton> {
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
      child: widget.isTonal!
          ? FilledButton.tonal(
              onPressed: _onPressed,
              child: _isLoading ? _circularProgressBar() : Text(widget.buttonText),
            )
          : FilledButton(
              onPressed: _onPressed,
              child: _isLoading ? _circularProgressBar() : Text(widget.buttonText),
            ),
    );
  }

  Widget _buttonWithIcon() {
    // Use an Icon as icon when not loading
    final _icon = _isLoading ? _circularProgressBar() : widget.icon!;
    final _label = Text(widget.buttonText);
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: widget.isTonal! ? FilledButton.tonalIcon(onPressed: _onPressed, icon: _icon, label: _label) : FilledButton.icon(onPressed: _onPressed, icon: _icon, label: _label),
    );
  }

  Container _circularProgressBar() {
    final _progressBarColor = widget.progressBarColor ?? Theme.of(context).colorScheme.onPrimary;
    final _color = widget.isTonal! ? Theme.of(context).buttonTheme.colorScheme!.onBackground.withAlpha(200) : _progressBarColor;
    return Container(
      height: widget.progressBarSize,
      width: widget.progressBarSize,
      padding: const EdgeInsets.all(2.0),
      child: CircularProgressIndicator(color: _color, strokeWidth: 3),
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.icon == null ? _simpleButton() : _buttonWithIcon();
  }
}
