part of 'list_item_model.dart';

mixin _$ListItemModel on _ListItemModel, Store {
  final _$serialAtom = Atom(name: '_ListItemModel.serial');
  @override
  String get serial {
    _$serialAtom.reportRead();
    return super.serial;
  }
  @override
  set serial(String serial) {
    _$serialAtom.reportWrite(serial, super.serial, () {
      super.serial = serial;
    });
  }

  final _$locationAtom = Atom(name: '_ListItemModel.location');
  @override
  String get location {
    _$locationAtom.reportRead();
    return super.location;
  }
  @override
  set location(String location) {
    _$locationAtom.reportWrite(location, super.location, () {
      super.location = location;
     });
  }

  @override
  String toString() {
    return '''
    serial: $serial,
    location: $location
    ''';
  }
}