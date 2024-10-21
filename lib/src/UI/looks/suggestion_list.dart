import 'package:flutter/material.dart';

class SuggestionList extends StatefulWidget {
  const SuggestionList(
      {super.key, required this.items, required this.controller});
  final List<String> items;
  final SearchController controller;
  @override
  State<SuggestionList> createState() => _SuggestionListState();
}

class _SuggestionListState extends State<SuggestionList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.items.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(widget.items[index]),
        onTap: () {
          setState(() {
            widget.controller.closeView(widget.items[index]);
          });
        },
        trailing: IconButton(
            onPressed: () {
              setState(() {
                widget.items.remove(widget.items[index]);
              });
              // controller.closeView(controller.text.trim());
              // controller.openView();
            },
            icon: Icon(Icons.cancel)),
      ),
    );
  }
}
