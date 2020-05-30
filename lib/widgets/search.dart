import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  Search({@required this.value, @required this.updateSearch});

  final value;
  final Function updateSearch;

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  _SearchState();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: TextField(
        textCapitalization: TextCapitalization.sentences,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
            border: InputBorder.none, hintText: 'Search place...'),
        controller: TextEditingController()..text = widget.value,
        onSubmitted: (newValue) {
          widget.updateSearch(newValue);
        },
      ),
    );
  }
}
