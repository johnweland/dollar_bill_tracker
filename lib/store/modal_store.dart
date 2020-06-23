import 'package:mobx/mobx.dart';

part 'modal_store.g.dart';

class ModalStore = _ModalStore with _$ModalStore;

abstract class _ModalStore with Store {
  String newSerial;
  String newLocation;

  void init() {}
  void dispose() {}
}