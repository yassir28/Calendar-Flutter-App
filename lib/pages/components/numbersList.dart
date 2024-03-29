import 'package:flutter/material.dart';
import 'package:menstruating/models/user.dart';
import 'package:provider/provider.dart';

class NumbersList extends StatefulWidget {
  final int numbermin;
  final int numbermax;
  final Function onChanged;

  const NumbersList(
      {Key key,
      @required this.numbermax,
      @required this.numbermin,
      this.onChanged})
      : super(key: key);

  @override
  _NumbersListState createState() => _NumbersListState();
}

class _NumbersListState extends State<NumbersList> {
  int _selectedItemIndex = 0;
  Color _color = Colors.grey[500];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    final user = Provider.of<User>(context);

    return Stack(
      children: [
        Container(
          height: height * 0.5,
          alignment: Alignment.center,
          child: Container(
            height: width * 0.12,
            width: width * 0.12,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.pink[300],
                width: 2,
              ),
            ),
          ),
        ),
        Center(
          child: new ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: 250,
            ),
            child: new ListWheelScrollView.useDelegate(
              physics: const FixedExtentScrollPhysics(),
              diameterRatio: 100,
              itemExtent: 50,
              onSelectedItemChanged: (index) {
                setState(() {
                  _selectedItemIndex = index;
                });
                widget.onChanged(_selectedItemIndex, user);
              },
              childDelegate: ListWheelChildLoopingListDelegate(
                children: List.generate(
                  widget.numbermax - widget.numbermin + 1,
                  (index) => Container(
                    width: width,
                    child: Center(
                      child: Text(
                        '${index + widget.numbermin}',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline5.copyWith(
                            color: _selectedItemIndex == index
                                ? Colors.pink[300]
                                : _color,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
