import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ListItem extends StatelessWidget {
  final String serial;
  final String location;
  final Function onTap;
  ListItem(this.serial, this.location, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Slidable(
        actionPane: SlidableDrawerActionPane(),
        actionExtentRatio: 0.25,
        key: Key(serial),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.grey,
                width: .50,
              ),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Serial Number',
                        style: Theme.of(context).textTheme.caption,
                      ),
                      Text(serial),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Location',
                        style: Theme.of(context).textTheme.caption,
                      ),
                      Text(location),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: <Widget>[
          IconSlideAction(
            caption: 'Edit',
            color: Colors.grey[300],
            icon: Icons.edit,
            onTap: () => {},
          ),
        ],
        secondaryActions: <Widget>[
          IconSlideAction(
            caption: 'Delete',
            color: Colors.red[900],
            icon: Icons.delete,
            onTap: onTap
          ),
        ],
      )
    );
  }
}