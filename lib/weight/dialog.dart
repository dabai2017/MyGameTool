import 'package:flutter/material.dart';

void dialog_tip(BuildContext context, String text) {
  showDialog(
      context: context,
      builder: (b) {
        return AlertDialog(
          title: Text("提示"),
          content: SingleChildScrollView(
            child: Text(text),
          ),
          actions: <Widget>[
            FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("确定"))
          ],
        );
      });
}
