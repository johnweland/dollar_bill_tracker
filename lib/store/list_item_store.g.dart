// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_item_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ListItemStore on _ListItemStore, Store {
  final _$dataAtom = Atom(name: '_ListItemStore.data');

  @override
  ObservableList<ListItemModel> get data {
    _$dataAtom.reportRead();
    return super.data;
  }

  @override
  set data(ObservableList<ListItemModel> value) {
    _$dataAtom.reportWrite(value, super.data, () {
      super.data = value;
    });
  }

  @override
  String toString() {
    return '''
data: ${data}
    ''';
  }
}
