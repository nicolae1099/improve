import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants/colors.dart' as color;

class ReusableListItem extends StatefulWidget {
  final Color color1;
  final Color color2;
  final String pill;
  bool isChecked = false;

  ReusableListItem(this.color1, this.color2, this.pill, {Key? key})
      : super(key: key);

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
        gradient: LinearGradient(
          colors: [
            widget.color1.withOpacity(0.8),
            widget.color2.withOpacity(0.9),
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.centerRight,
        ),
        boxShadow: [
          BoxShadow(
              offset: const Offset(5, 5),
              blurRadius: 5,
              color: color.AppColor.coolGray)
        ],
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Row(
        children: [
          const SizedBox(width: 30),
          Text(widget.pill,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: color.AppColor.coolGray,
              )),
          Expanded(child: Container()),
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
