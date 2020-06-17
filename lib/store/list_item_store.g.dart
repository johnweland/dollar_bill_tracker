part of 'list_item_store.dart';


mixin _$ListItemStore on _ListItemStore, Store {
  final _$listDataAtom = Atom(name: '_ListItemStore.data');

  @override
  ObservableList<ListItemModel> get data {
    _$listDataAtom.reportRead();
    return super.data;
  }

  @override
  set data(ObservableList<ListItemModel> value) {
    _$listDataAtom.reportWrite(value, super.data, () {
      super.data = value;
    });
  }
}