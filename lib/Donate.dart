import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_application_2/Latest.dart';

class Donate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Latest(),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class, which holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  bool _checkBoxVal1 = false;
  bool _checkBoxVal2 = false;
  bool _checkBoxVal3 = false;
  bool _checkBoxVal4 = false;
  bool _checkBoxVal5 = false;
  bool _checkBoxVal6 = false;
  bool _checkBoxVal7 = false;
  bool _checkBoxVal8 = false;
  bool _checkBoxVal9 = false;

  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              icon: const Icon(Icons.person),
              hintText: 'Enter your full name',
              labelText: 'Name',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              icon: const Icon(Icons.phone),
              hintText: 'Enter a phone number',
              labelText: 'Phone number',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter valid phone number';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              //filled: true,
              icon: Icon(Icons.email),
              hintText: 'Your email address',
              labelText: 'E-mail',
            ),
            /*keyboardType: TextInputType.emailAddress,
            onSaved: (String value) {
              this._email = value;
              print('email=$_email');
            },*/
          ),
          //const SizedBox(height: 24.0),
          TextFormField(
            decoration: const InputDecoration(
              icon: const Icon(Icons.location_city),
              hintText: 'Enter your Place',
              labelText: 'Place',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter Place';
              }
              return null;
            },
          ),

          Container(
              padding: EdgeInsets.only(left: 40.0, top: 20.0, bottom: 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Type of Donation',
                      style: TextStyle(),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text('Books'),
                              Checkbox(
                                onChanged: (bool value) {
                                  setState(() => this._checkBoxVal1 = value);
                                },
                                value: this._checkBoxVal1,
                              ),
                              const Text('Clothes'),
                              Checkbox(
                                onChanged: (bool value) {
                                  setState(() => this._checkBoxVal2 = value);
                                },
                                value: this._checkBoxVal2,
                              ),
                              const Text('Shoes'),
                              Checkbox(
                                onChanged: (bool value) {
                                  setState(() => this._checkBoxVal3 = value);
                                },
                                value: this._checkBoxVal3,
                              ),
                              const Text('Bag'),
                              Checkbox(
                                onChanged: (bool value) {
                                  setState(() => this._checkBoxVal4 = value);
                                },
                                value: this._checkBoxVal4,
                              ),
                              const Text('Cooked Food'),
                              Checkbox(
                                onChanged: (bool value) {
                                  setState(() => this._checkBoxVal9 = value);
                                },
                                value: this._checkBoxVal9,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Text('Toys'),
                              Checkbox(
                                onChanged: (bool value) {
                                  setState(() => this._checkBoxVal5 = value);
                                },
                                value: this._checkBoxVal5,
                              ),
                              const Text('Medicines'),
                              Checkbox(
                                onChanged: (bool value) {
                                  setState(() => this._checkBoxVal6 = value);
                                },
                                value: this._checkBoxVal6,
                              ),
                              const Text('Kitchenware'),
                              Checkbox(
                                onChanged: (bool value) {
                                  setState(() => this._checkBoxVal7 = value);
                                },
                                value: this._checkBoxVal7,
                              ),
                              const Text('Grossary'),
                              Checkbox(
                                onChanged: (bool value) {
                                  setState(() => this._checkBoxVal8 = value);
                                },
                                value: this._checkBoxVal8,
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ])),

          Container(
            child: Row(
              children: [
                Padding(padding: EdgeInsets.only(left: 50.0)),
                new RaisedButton(
                    child: const Text('Upload Image'), onPressed: () {}),
                Padding(padding: EdgeInsets.only(left: 50.0)),
                new RaisedButton(
                    child: const Text('Upload Video'), onPressed: () {}),
              ],
            ),
          ),

          new Container(
              padding: const EdgeInsets.only(left: 150.0, top: 40.0),
              child: new RaisedButton(
                child: const Text('Submit'),
                onPressed: () {
                  // It returns true if the form is valid, otherwise returns false
                  if (_formKey.currentState.validate()) {
                    // If the form is valid, display a Snackbar.
                    Scaffold.of(context).showSnackBar(
                        SnackBar(content: Text('Data is in processing.')));
                  }
                },
              )),
        ],
      ),
    );
  }
}
