import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final String text;
  final Function()? onPresd;
  const SubmitButton({Key? key, required this.text, this.onPresd})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      child: ElevatedButton(
          onPressed: onPresd,
          child: Text(text, style: const TextStyle(color: Colors.white)),
          style: ElevatedButton.styleFrom(primary: Colors.green)),
      height: 40.0,
      width: width * 0.8,
    );
  }
}
