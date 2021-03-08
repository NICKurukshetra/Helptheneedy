import 'package:flutter/material.dart';

class Accident extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Accident Reported Entry Form'),
      ),
      body: MyCustomForm(),
    );
  }
}

enum Gender { Male, Female }
enum BloodRequired { Yes, No }

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class, which holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();
  List<String> _locations = [
    'Between 15 to 20',
    'Between 21 to 25',
    'Between 26 to 30',
    'Between 31 to 35',
    'Between 36 to 40',
    'Between 41 to 45',
    'Between 46 to 50',
    'Between 51 to 55',
    'Between 56 to 60',
    'Between 60 to 65',
    'Between 66 to 70',
    'Between 71 to 75',
    'Between 76 to 80',
    'Between 81 to 85',
    'Between 86 to 90',
    'Between 91 to 95',
    'Between 96 to 100',
    'Above 100',
  ];
  // ignore: non_constant_identifier_names
  List<String> _BloodGroup = ['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'];
  String _selectedLocation;
  String _selectedBloodGroup;
  Gender _category = Gender.Male;

  //Gender _category2 = Gender.Female;
  BloodRequired _required1 = BloodRequired.Yes;
  //BloodRequired _required2 = BloodRequired.No;

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
              labelText: 'Name of Informer',
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
              labelText: 'Phone no of Informer',
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
              child: ListView(
            shrinkWrap: true,
            // padding: EdgeInsets.all(10.0),
            children: [
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    //Text("Gender"),
                    Row(
                      children: [
                        Icon(
                          Icons.accessibility,
                          color: Colors.grey,
                        ),
                        Padding(padding: EdgeInsets.only(left: 20.0)),
                        Text(
                          "Male",
                          style: TextStyle(),
                        ),
                        Radio(
                          value: Gender.Male,
                          groupValue: _category,
                          onChanged: (Gender value) {
                            setState(() {
                              _category = value;
                            });
                          },
                        ),
                        Padding(padding: EdgeInsets.only(left: 50.0)),
                        Text("Female"),
                        Radio(
                          value: Gender.Female,
                          groupValue: _category,
                          onChanged: (Gender value) {
                            setState(() {
                              _category = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ])
            ],
          )),
          //Padding(padding: EdgeInsets.only(left: 10.0, top: 10.0)),
          //Text("Age"),
          Padding(
            padding: EdgeInsets.only(left: 40, bottom: 0, top: 0),
            child: Divider(
              color: Colors.black,
              height: 15.0,
            ),
          ),
          Container(
            width: 400,
            child: Row(
              children: [
                Icon(
                  Icons.account_circle_rounded,
                  color: Colors.grey,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15.0),
                ),
                DropdownButton(
                  hint: Text('Approximate Age of Patient'),

                  // Not necessary for Option 1
                  value: _selectedLocation,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedLocation = newValue;
                    });
                  },
                  items: _locations.map((location) {
                    return DropdownMenuItem(
                      child: new Text(location),
                      value: location,
                    );
                  }).toList(),
                ),
              ],
            ),
          ),

          Container(
              child: ListView(
            shrinkWrap: true,
            // padding: EdgeInsets.all(10.0),
            children: [
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    //Text("Blood Required"),
                    Row(
                      children: [
                        Icon(
                          Icons.add_box,
                          color: Colors.grey,
                        ),
                        Text("Blood Required"),
                        Padding(padding: EdgeInsets.only(left: 20.0)),
                        Text(
                          "Yes",
                          style: TextStyle(),
                        ),
                        Radio(
                          value: BloodRequired.Yes,
                          groupValue: _required1,
                          onChanged: (BloodRequired value) {
                            setState(() {
                              _required1 = value;
                            });
                          },
                        ),
                        Padding(padding: EdgeInsets.only(left: 50.0)),
                        Text("No"),
                        Radio(
                          value: BloodRequired.No,
                          groupValue: _required1,
                          onChanged: (BloodRequired value) {
                            setState(() {
                              _required1 = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ])
            ],
          )),
          //Padding(padding: EdgeInsets.only(left: 10.0, top: 10.0)),

          //Blood Group
          Container(
            width: 400,
            child: Row(
              children: [
                Icon(
                  Icons.grid_on_outlined,
                  color: Colors.grey,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15.0),
                ),
                DropdownButton(
                  hint: Text('Select Blood Group'),

                  // Not necessary for Option 1
                  value: _selectedBloodGroup,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedBloodGroup = newValue;
                    });
                  },
                  items: _BloodGroup.map((location) {
                    return DropdownMenuItem(
                      child: new Text(location),
                      value: location,
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
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
