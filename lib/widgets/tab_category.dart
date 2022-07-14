import 'package:flutter/material.dart';

class TabCategory extends StatefulWidget {
  final String? text;
  // ignore: prefer_const_constructors_in_immutables
  TabCategory({
    Key? key,
    this.text,
  }) : super(key: key);

  @override
  State<TabCategory> createState() => _TabCategoryState();
}

class _TabCategoryState extends State<TabCategory> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(child: Text(widget.text ?? '')),
      ],
    );
  }
}
