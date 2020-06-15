import 'package:flutter/material.dart';

class NewItemForm extends StatefulWidget {
  @override
  _NewItemFormState createState() => _NewItemFormState();
}

class _NewItemFormState extends State<NewItemForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
            }
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
            }
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ButtonBar(
              alignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FlatButton(
                  child: Text("Save"),
                  onPressed: () {
                    setState(() {
                      _submit();
                    });
                  },
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

  _submit(){
    if (_formKey.currentState.validate()){
      Navigator.of(context).pop();
      // TODO: Add new item to list
    }
  }
}