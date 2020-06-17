import 'package:flutter/material.dart';
import 'package:dollar_bill_tracker/widget/drawer_options.dart';

class SettingsDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  Colors.green,
                  Colors.greenAccent
                ]
              )
            ),
            child: Container(
              child: Column(
                children: <Widget>[
                  Material(
                    elevation: 10,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.settings,
                        size: 80,
                        color: Colors.green,
                      ),
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Settings',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      )
                    ),
                  )
                ],
              ),
            ),
          ),
          DrawerOptions(Icons.restore, 'Import', ()=> {}),
          DrawerOptions(Icons.backup, 'Export', ()=> {}),
        ],
      ),
    );
  }
}