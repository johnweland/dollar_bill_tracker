import 'package:flutter/material.dart';
import 'package:dollar_bill_tracker/widget/new_item_form.dart';

class ModalTrigger extends StatelessWidget {

  _showModalBottomSheet(context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)),
      ),
      builder: (BuildContext context) {
        return NewItemForm();    
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        _showModalBottomSheet(context);
      },
    );
  }
}