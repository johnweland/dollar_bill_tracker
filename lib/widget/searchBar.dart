import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final Function filter;
  SearchBar(this.filter);
  @override
  Widget build (BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search...',
          suffixIcon: Icon(Icons.search)
        ),
        onChanged: (text) {
          filter(text);
        }
      ),
    );
  }
}