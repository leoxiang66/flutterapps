import 'package:flutter/material.dart';

class OpenTextInput extends StatefulWidget {
  final void Function(String) onSubmitted;
  final void Function(String) onChanged;
  final String label;
  final double width;
  final int minLines;
  final int? maxLines;
  final String placeholder;
  final String? defaultValue;

  OpenTextInput({
    Key? key,
    required this.onSubmitted,
    required this.onChanged,
    required this.label,
    required this.width,
    this.minLines = 1,
    this.maxLines = 1,
    this.placeholder = '',
    this.defaultValue,
  }) : super(key: key);

  @override
  OpenTextInputState createState() => OpenTextInputState();
}

class OpenTextInputState extends State<OpenTextInput> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: TextField(
        minLines: widget.minLines,
        maxLines: widget.maxLines,
        controller: _controller,
        decoration: InputDecoration(
          hintText: widget.placeholder,
          labelText: widget.label,
          border: const OutlineInputBorder(),
        ),
        onChanged: (value) {
          widget.onChanged(value);
        },
        onSubmitted: (value) {
          widget.onSubmitted(value);
        },
      ),
    );
  }
}