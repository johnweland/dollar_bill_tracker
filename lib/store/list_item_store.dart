import 'package:dollar_bill_tracker/model/list_item_model.dart';
import 'package:mobx/mobx.dart';

part 'list_item_store.g.dart';

class ListItemStore = _ListItemStore with _$ListItemStore;

abstract class _ListItemStore with Store {
  @observable
  ObservableList<ListItemModel> data = ObservableList<ListItemModel>();

  void init() {}
  void dispose() {}
}