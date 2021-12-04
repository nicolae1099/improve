import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReusableListItem extends StatefulWidget {
  final Color colour;
  final String pill;
  bool isChecked = false;

  ReusableListItem(this.colour, this.pill, {Key? key}) : super(key: key);

  @override
  _ReusableListItemState createState() => _ReusableListItemState();
}

class _ReusableListItemState extends State<ReusableListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: widget.colour,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Row(
        children: [
          Text(widget.pill),
          Checkbox(
            value: widget.isChecked,
            onChanged: (bool? value) {
              setState(() {
                widget.isChecked = value ?? false;
              });
            },
          ),
        ],
      ),
    );
  }
}
