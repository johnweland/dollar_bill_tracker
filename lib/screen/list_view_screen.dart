import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import 'package:dollar_bill_tracker/model/list_item_model.dart';
import 'package:dollar_bill_tracker/widget/list_item.dart';
import 'package:dollar_bill_tracker/widget/drawer.dart';
import 'package:dollar_bill_tracker/widget/search_bar.dart';
import 'package:dollar_bill_tracker/widget/modal_trigger.dart';

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}


class _ListScreenState extends State<ListScreen> {
  @observable
  ObservableList<ListItemModel> _items = ObservableList<ListItemModel>();

  @observable 
  ObservableList<ListItemModel> _itemsToDisplay = ObservableList<ListItemModel>();

  @override
  void initState() {
    super.initState();
    _setItems();
  }

  @override
  void dispose() {
    super.dispose();
  }

  _setItems() {
    return _itemsToDisplay = _items..addAll([
      ListItemModel(serial: 'ABC124WX311', location: '3, 3'),
      ListItemModel(serial: 'ABC123M5208', location: '3, 2'),
      ListItemModel(serial: 'FHW929M5208', location: '3, 1'),
      ListItemModel(serial: 'ZYX987W0013', location: '2, 1'),
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
          itemCount: _items.length + 1
        ),
      ),
      floatingActionButton: ModalTrigger()
    );
  }

  _filter(value) {
    if (value == '') {
      _itemsToDisplay.clear();
      _setItems();
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
    return ListItem(
      _itemsToDisplay[index].serial,
      _itemsToDisplay[index].location,
      ()=> {
        _items.removeAt(index)
      });
  }
}

