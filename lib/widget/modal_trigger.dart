import 'package:flutter/material.dart';
import 'package:dollar_bill_tracker/store/modal_store.dart';
class ModalTrigger extends StatelessWidget {
  final modalStore = ModalStore();
  final _formKey = GlobalKey<FormState>();
  final Function _submit;
  ModalTrigger(this._submit);

  _showModalBottomSheet(context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)),
      ),
      builder: (BuildContext context) {
        return Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
              Center(
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                  color: Colors.white,
                  child: Stack(
                    children: <Widget>[
                      Icon(
                        Icons.crop_free,
                        size: 150,
                        color: Colors.grey,
                      ),
                      Positioned(
                        bottom: 50,
                        left: 50,
                        child:Icon(
                          Icons.camera_alt,
                          size: 50,
                          color: Colors.grey,
                        ),
                      ),
                    ]
                  ),
                  onPressed: (){
                    // TODO: Open OCR camera or Firebase ML, on select add value to Serial TextFormField
                  },
                )
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter a Serial Number or Scan...'
                ),
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'input cannot be empty';
                  }
                  return null;
                },
                onSaved: (input) => {
                  modalStore.newSerial = input
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter a Location...'
                ),
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'input cannot be empty';
                  }
                  return null;
                },
                onSaved: (input) => {
                  modalStore.newLocation = input
                },
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: ButtonBar(
                  alignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    FlatButton(
                      child: Text("Save"),
                      onPressed: () => {
                        if (_formKey.currentState.validate()){
                          this._submit()
                        }
                      }
                    ),
                    FlatButton(
                      child: Text("Cancel"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                )
              )
            ],
            )
          )
        );  
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