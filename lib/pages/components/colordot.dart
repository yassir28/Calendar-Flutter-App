import 'package:flutter/material.dart';
import 'package:menstruating/constants.dart';

class ColorDot extends StatefulWidget {
  final Function refresh;

  const ColorDot({Key key, this.refresh}) : super(key: key);

  @override
  _ColorDotState createState() => _ColorDotState();
}

class _ColorDotState extends State<ColorDot> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = isSelected ? false : true;
          widget.refresh(isSelected);
        });
      },
      child: Container(
        margin: EdgeInsets.only(
          right: KDefaultPaddin / 2,
        ),
        padding: EdgeInsets.all(2.5),
        height: 24,
        width: 24,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.pink[400],
            width: 2,
          ),
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: isSelected ? Colors.pink[400] : Colors.transparent,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
