import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/main.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChildLabor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Child Labor Entry Form'),
      ),
      body: MyCustomForm(),
    );
  }
}

var imgpath;
var imgurl;
var lat;
var lng;

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class, which holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  TextEditingController myLocController = TextEditingController();
  TextEditingController myNameController = TextEditingController();
  TextEditingController myMobController = TextEditingController();

  getuserdetail() async {
    final prefs = await SharedPreferences.getInstance();
    myNameController.text = prefs.getString("username");
    myMobController.text = prefs.getString("usermobile");
  }
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  // final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  //Future<Position> position =      Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

  clickPhoto() async {
    var picker = ImagePicker();
    var img = await picker.getImage(source: ImageSource.camera);
    setState(() {
      if (img != null) {
        imgpath = File(img.path);
      }
    });
    var fbstore = FirebaseStorage.instance.ref().child("path").child(DateTime
            .now()
        .toString()); //to connect to core bucket we use ref function & child will create folder if not present
    await fbstore.putFile(imgpath);
    var imgurl1 = await fbstore.getDownloadURL();
    setState(() {
      imgurl = imgurl1;
    });
    print(imgurl);
  }

  location() async {
    var p = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    setState(() {
      lat = p.latitude;
      lng = p.longitude;
    });
    myLocController.text = lat.toString() + ',' + lng.toString();
    print(lat);
    print(lng);
  }

  @override
  void initState() {
    location();
    getuserdetail();
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  List<String> _locations = ['6 to 8', '8 to 10', '10 to 12', '12 to 14'];
  String _selectedAge;
  String _category;
  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: myNameController,
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
            controller: myMobController,
            decoration: const InputDecoration(
              icon: const Icon(Icons.phone),
              hintText: 'Enter a phone number',
              labelText: 'Phone no of informer',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter valid phone number';
              }
              return null;
            },
          ),
          TextFormField(
            controller: myLocController,
            enabled: false,
            decoration: const InputDecoration(
              icon: const Icon(Icons.location_city),
              hintText: 'Enter your Place',
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
                          value: "Male",
                          groupValue: _category,
                          onChanged: (value) {
                            setState(() {
                              _category = value;
                            });
                          },
                        ),
                        Padding(padding: EdgeInsets.only(left: 50.0)),
                        Text("Female"),
                        Radio(
                          value: "Female",
                          groupValue: _category,
                          onChanged: (value) {
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
                  hint: Text('Approximate Child Age'),

                  // Not necessary for Option 1
                  value: _selectedAge,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedAge = newValue;
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
            child: Row(
              children: [
                Padding(padding: EdgeInsets.only(left: 50.0)),
                new RaisedButton(
                    child: const Text('Upload Image'), onPressed: clickPhoto),
                Padding(padding: EdgeInsets.only(left: 50.0)),
                new RaisedButton(
                    child: const Text('Upload Video'), onPressed: () {}),
              ],
            ),
          ),
          Padding(
              padding: EdgeInsets.only(left: 30),
              child: InkWell(
                child: CircleAvatar(
                  radius: 60.0,
                  backgroundImage: imgurl != null ? NetworkImage(imgurl) : null,
                ),
              )),

          new Container(
              padding: const EdgeInsets.only(left: 150.0, top: 40.0),
              child: new RaisedButton(
                child: const Text('Submit'),
                onPressed: () async {
                  // It returns true if the form is valid, otherwise returns false
                  if (_formKey.currentState.validate()) {
                    setState(() {});
                    // If the form is valid, display a Snackbar.
                    final fs = FirebaseFirestore.instance;
                    await fs
                        .collection("data")
                        .doc("Child Labour")
                        .collection("Child Labour")
                        .add({
                          'Requestby': myNameController.text,
                          'RequestMob': myMobController.text,
                          //Data ap per Required Page
                          'Category': 'Child Labour',
                          'Age': _selectedAge,
                          'Sex': _category,
                          //---Data collection end
                          'imageurl': imgurl,
                          "latitude": lat,
                          "longitude": lng,
                          "status": "Open"
                        })
                        .whenComplete(() =>
                            showdg(context, "Alert Success", "Record Saved"))
                        .onError((error, stackTrace) => null);
                    Navigator.of(context, rootNavigator: true).pop();
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
