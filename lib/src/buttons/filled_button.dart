// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';

class DariXFilledButton extends StatefulWidget {
  Function? onPressed;
  Function? onLongPressed;
  String buttonText;
  double? width;
  double? height;
  Icon? icon;
  ButtonStyle? style;
  double? progressBarSize;
  Color? progressBarColor;
  bool? isTonal;
  Widget? customProgressBar;

  DariXFilledButton({
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
    this.isTonal,
    this.customProgressBar,
  }) {
    progressBarSize = progressBarSize ?? (icon != null ? icon!.size : 22);
    onPressed = onPressed ?? () {};
    onLongPressed = onLongPressed ?? () {};
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
      child: widget.isTonal!
          ? FilledButton.tonal(
              onPressed: _isLoading ? null : _onPressed,
              onLongPress: _isLoading ? null : _onLongPressed,
              style: widget.style,
              child: _isLoading ? _progressBar() : Text(widget.buttonText),
            )
          : FilledButton(
              onPressed: _isLoading ? null : _onPressed,
              onLongPress: _isLoading ? null : _onLongPressed,
              style: widget.style,
              child: _isLoading ? _progressBar() : Text(widget.buttonText),
            ),
    );
  }

  Widget _buttonWithIcon() {
    // Use an Icon as icon when not loading
    final _icon = _isLoading ? _progressBar() : widget.icon!;
    final _label = Text(widget.buttonText);
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: widget.isTonal!
          ? FilledButton.tonalIcon(
              onPressed: _isLoading ? null : _onPressed,
              onLongPress: _isLoading ? null : _onLongPressed,
              icon: _icon,
              label: _label,
              style: widget.style,
            )
          : FilledButton.icon(
              onPressed: _isLoading ? null : _onPressed,
              onLongPress: _isLoading ? null : _onLongPressed,
              icon: _icon,
              label: _label,
              style: widget.style,
            ),
    );
  }

  Container _progressBar() {
    final _progressBarColor = widget.progressBarColor ?? Theme.of(context).buttonTheme.colorScheme!.onBackground.withAlpha(120);
    final _progressBarColorTonal = widget.progressBarColor ?? Theme.of(context).buttonTheme.colorScheme!.onBackground.withAlpha(180);
    final _color = widget.isTonal! ? _progressBarColorTonal : _progressBarColor;
    return Container(
      height: widget.progressBarSize,
      width: widget.progressBarSize,
      padding: const EdgeInsets.all(2.0),
      child: widget.customProgressBar ?? CircularProgressIndicator(color: _color, strokeWidth: 3),
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.icon == null ? _simpleButton() : _buttonWithIcon();
  }
}
