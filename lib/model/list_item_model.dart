import 'package:mobx/mobx.dart';

part 'list_item_model.g.dart';

class ListItemModel = _ListItemModel with _$ListItemModel;

abstract class _ListItemModel with Store {
  @observable
  String serial;
  
  @observable
  String location;
}