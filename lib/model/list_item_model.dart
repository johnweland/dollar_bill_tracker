import 'package:mobx/mobx.dart';

class ListItemModel {
  @observable
  String serial;
  
  @observable
  String location;

  ListItemModel({this.serial, this.location});
}