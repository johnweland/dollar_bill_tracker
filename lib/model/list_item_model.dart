import 'package:mobx/mobx.dart';

class ListItem {
  @observable
  String serial;
  
  @observable
  String location;

  ListItem({this.serial, this.location});
}