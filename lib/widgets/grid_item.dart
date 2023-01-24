import 'package:flutter/material.dart';

class GridItem extends StatefulWidget {
  final String name;
  final ValueChanged<bool> isSelected;

  const GridItem({required this.name, required this.isSelected});

  @override
  _GridItemState createState() => _GridItemState();
}

class _GridItemState extends State<GridItem> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
          widget.isSelected(isSelected);
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 4.0),
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        decoration: BoxDecoration(
          color: isSelected ? Colors.red[400] : Colors.blueGrey,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: Colors.black54,
            width: 0.5,
          ),
        ),
        child: Center(child: Text(widget.name)),
      ),
    );
  }
}