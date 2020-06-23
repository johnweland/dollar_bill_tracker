// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_item_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ListItemModel on _ListItemModel, Store {
  final _$serialAtom = Atom(name: '_ListItemModel.serial');

  @override
  String get serial {
    _$serialAtom.reportRead();
    return super.serial;
  }

  @override
  set serial(String value) {
    _$serialAtom.reportWrite(value, super.serial, () {
      super.serial = value;
    });
  }

  final _$locationAtom = Atom(name: '_ListItemModel.location');

  @override
  String get location {
    _$locationAtom.reportRead();
    return super.location;
  }

  @override
  set location(String value) {
    _$locationAtom.reportWrite(value, super.location, () {
      super.location = value;
    });
  }

  @override
  String toString() {
    return '''
serial: ${serial},
location: ${location}
    ''';
  }
}
