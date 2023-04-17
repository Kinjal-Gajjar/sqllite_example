import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  List<int> _selectedIndexes = [];

  @override
  Widget build(BuildContext context) {
    List<String> items = ['Item 1', 'Item 2', 'Item 3'];

    return Scaffold(
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                // update the list of selected indexes when an item is tapped
                if (_selectedIndexes.contains(index)) {
                  _selectedIndexes.remove(index);
                } else {
                  _selectedIndexes.add(index);
                }
              });
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: _selectedIndexes.contains(index)
                      ? Colors.blue // use blue border color for selected items
                      : Colors.grey, // use grey border color for unselected items
                  width: 2.0,
                ),
              ),
              padding: EdgeInsets.all(16.0),
              child: Text(
                items[index],
                style: TextStyle(fontSize: 24.0),
              ),
            ),
          );
        },
      ),
    );
  }
}
