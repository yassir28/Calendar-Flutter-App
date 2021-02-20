import 'package:flutter/material.dart';

class BoxwDialog extends StatelessWidget {
  final ListBody listBody;

  const BoxwDialog({
    Key key,
    this.listBody,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.live_help,
        size: 18,
      ),
      onPressed: () {
        return showDialog(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext context) {
            return AlertDialog(
              content: SingleChildScrollView(
                child: listBody,
              ),
              actions: <Widget>[
                TextButton(
                  child: Text('Ok'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }
}
