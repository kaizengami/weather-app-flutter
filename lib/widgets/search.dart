import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: TextField(
        textAlign: TextAlign.center,
        decoration: InputDecoration(
            border: InputBorder.none, hintText: 'Search place...'),
      ),
    );
  }
}
