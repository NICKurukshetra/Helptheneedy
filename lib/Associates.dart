import 'package:flutter/material.dart';

class Associates extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NGOs Entry'),
      ),
      body: MyCustomForm(),
    );
  }
}

enum BestTutorSite { Volunteer, NGO }

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
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  BestTutorSite _site = BestTutorSite.Volunteer;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.all(10.0),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 50.0)),
                  Text(
                    "VOLUNTEER",
                    style: TextStyle(),
                  ),
                  Radio(
                    value: BestTutorSite.Volunteer,
                    groupValue: _site,
                    onChanged: (BestTutorSite value) {
                      setState(() {
                        _site = value;
                      });
                    },
                  ),
                  Padding(padding: EdgeInsets.only(left: 50.0)),
                  Text("NGO"),
                  Radio(
                    value: BestTutorSite.NGO,
                    groupValue: _site,
                    onChanged: (BestTutorSite value) {
                      setState(() {
                        _site = value;
                      });
                    },
                  ),
                ],
              ),
              TextFormField(
                decoration: const InputDecoration(
                  icon: const Icon(Icons.add_box),
                  hintText: 'Enter NGO Registration number',
                  labelText: 'Registration number',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter valid Registration number';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  icon: const Icon(Icons.person),
                  hintText: 'Enter your full name',
                  labelText: 'Contact Person Name',
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
                  labelText: 'Contact Person Phone number',
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
                          'Category',
                          style: TextStyle(),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Text('Child Labor'),
                                  Checkbox(
                                    onChanged: (bool value) {
                                      setState(
                                          () => this._checkBoxVal1 = value);
                                    },
                                    value: this._checkBoxVal1,
                                  ),
                                  const Text('Injured Animals Care'),
                                  Checkbox(
                                    onChanged: (bool value) {
                                      setState(
                                          () => this._checkBoxVal2 = value);
                                    },
                                    value: this._checkBoxVal2,
                                  ),
                                  const Text('Shelter Home'),
                                  Checkbox(
                                    onChanged: (bool value) {
                                      setState(
                                          () => this._checkBoxVal3 = value);
                                    },
                                    value: this._checkBoxVal3,
                                  ),
                                ],
                              ),
                              Row(children: [
                                const Text('Blood'),
                                Checkbox(
                                  onChanged: (bool value) {
                                    setState(() => this._checkBoxVal4 = value);
                                  },
                                  value: this._checkBoxVal4,
                                ),
                                const Text('Accident'),
                                Checkbox(
                                  onChanged: (bool value) {
                                    setState(() => this._checkBoxVal5 = value);
                                  },
                                  value: this._checkBoxVal5,
                                ),
                                const Text('Rehabilitation Center'),
                                Checkbox(
                                  onChanged: (bool value) {
                                    setState(() => this._checkBoxVal6 = value);
                                  },
                                  value: this._checkBoxVal6,
                                ),
                              ]),
                              Row(
                                children: [
                                  const Text('Child Education'),
                                  Checkbox(
                                    onChanged: (bool value) {
                                      setState(
                                          () => this._checkBoxVal7 = value);
                                    },
                                    value: this._checkBoxVal7,
                                  ),
                                  const Text('Donation'),
                                  Checkbox(
                                    onChanged: (bool value) {
                                      setState(
                                          () => this._checkBoxVal8 = value);
                                    },
                                    value: this._checkBoxVal8,
                                  ),
                                  const Text('Deceased Animal Pickup'),
                                  Checkbox(
                                    onChanged: (bool value) {
                                      setState(
                                          () => this._checkBoxVal8 = value);
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
                  padding: const EdgeInsets.only(left: 30.0, top: 20.0),
                  child: new RaisedButton(
                      child: const Text('upload image'), onPressed: () {})),
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
        ],
      ),
    );
  }
}
