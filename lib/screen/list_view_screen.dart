import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import 'package:dollar_bill_tracker/model/list_item_model.dart';
import 'package:dollar_bill_tracker/widget/list_item.dart';
import 'package:dollar_bill_tracker/widget/drawer.dart';
import 'package:dollar_bill_tracker/widget/search_bar.dart';
import 'package:dollar_bill_tracker/widget/modal_trigger.dart';

import 'package:dollar_bill_tracker/store/list_item_store.dart';

class ListScreen extends StatefulWidget {
  final listItemStore = ListItemStore();
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
    widget.listItemStore.init();
    setItems();
  }

  setItems() {
    return _itemsToDisplay = _items..addAll(widget.listItemStore.data);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List'),
      ),
      drawer: SettingsDrawer(),
      body: Column(
        children: <Widget> [
          SearchBar(_filter),
          Expanded(
            child: Observer(
              builder: (_) => ListView.builder(
                itemBuilder: (context, index) {
                  return _listItem(index);
                },
                itemCount: _items.length
              )
            ),
          )
        ]
      ),
      floatingActionButton: ModalTrigger(()=> _submit())
    );
  }

  _filter(value) {
    if (value == '') {
      _itemsToDisplay.clear();
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
      serial: _itemsToDisplay[index].serial,
      location: _itemsToDisplay[index].location,
      onTap: ()=> {
        _items.removeAt(index)
      }
    );
  }

  _submit(){
    _items.add(ListItemModel()
    ..serial = "" //modalStore.newSerial
    ..location = ""); //modalStore.newLocation);
    _itemsToDisplay = _items;
    Navigator.of(context).pop();
  }
}

