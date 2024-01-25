import 'package:flutter/material.dart';

class MySearchBar extends StatefulWidget {
  final Function(String) onSearch;
  final TextEditingController? controller;

  const MySearchBar({super.key, required this.onSearch, this.controller});

  @override
  State<MySearchBar> createState() {
    return _MySearchBarState();
  }
}

class _MySearchBarState extends State<MySearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: Colors.grey),
        ),
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.search, color: Colors.grey,),
            ),
            Expanded(
              child: TextFormField(
                controller: widget.controller,
                onChanged: (query) {
                  widget.onSearch(query);
                },
                decoration: const InputDecoration(
                  hintText: "Search",
                  hintStyle: TextStyle(fontFamily: 'SofiaPro'),
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
