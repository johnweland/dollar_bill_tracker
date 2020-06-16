import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:dollar_bill_tracker/model/list_item_model.dart';
import 'package:dollar_bill_tracker/widget/drawer.dart';
import 'package:dollar_bill_tracker/widget/searchBar.dart';
import 'package:dollar_bill_tracker/widget/modalTrigger.dart';

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}


class _ListScreenState extends State<ListScreen> {
  @observable
  ObservableList<ListItem> _items = ObservableList<ListItem>();

  @observable 
  ObservableList<ListItem> _itemsToDisplay = ObservableList<ListItem>();

  @override
  void initState() {
    super.initState();
    setItems();
  }

  @override
  void dispose() {
    super.dispose();
  }

  setItems() {
    return _itemsToDisplay = _items..addAll([
      ListItem(serial: 'ABC123M5208', location: '3, 2'),
      ListItem(serial: 'FHW929M5208', location: '3, 1'),
      ListItem(serial: 'ZYX987W0013', location: '2, 1'),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List'),
      ),
      drawer: SettingsDrawer(),
      body: Observer(
        builder: (_) => ListView.builder(
          itemBuilder: (context, index) {
            return index == 0 ? SearchBar(_filter) : _listItem(index -1);
          },
          itemCount: _items.length + 1 // items.length
        ),
      ),
      floatingActionButton: ModalTrigger()
    );
  }

  _filter(value) {
    if (value == '') {
      _itemsToDisplay.clear();
      setItems();
    } else {
      var _list =
        _itemsToDisplay.where((item) => item.serial
        .toLowerCase()
        .contains(value.toString().toLowerCase()))
        .toList();
      _itemsToDisplay.clear();
      _itemsToDisplay..addAll(_list);
    }
  }

  _listItem(index) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Slidable(
        actionPane: SlidableDrawerActionPane(),
        actionExtentRatio: 0.25,
        key: Key(_itemsToDisplay[index].serial),
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
                      Text(_itemsToDisplay[index].serial),
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
                      Text(_itemsToDisplay[index].location),
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
            onTap: () => {
              _items.removeAt(index)
            },
          ),
        ],
      )
    );
  }
}

