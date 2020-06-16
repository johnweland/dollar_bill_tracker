import 'package:flutter/material.dart';

class DrawerOptions extends StatelessWidget {
  IconData icon;
  String text;
  Function onTap;
  DrawerOptions(this.icon, this.text, this.onTap);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.greenAccent,
      child: Padding(
        padding: EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
        child: Container(
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey[400]))
          ),
          height:  50.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 8.0, 0),
                    child: Icon(icon)
                  ),
                  Text(text),
                ],
              ),
              Icon(Icons.arrow_right),
            ],
          ),
        ),
      ),
      onTap: onTap
    );
  }

}