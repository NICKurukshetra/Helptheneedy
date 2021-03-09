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

String _value;
String objtext;
var _currencies = ['6 to 8', '8 to 10', '10 to 12', '12 to 14'];

var imgpath;
var imgurl;
var lat;
var lng;
String _uname, _usermobile;

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
  TextEditingController myRemarksController = TextEditingController();

  getuserdetail() async {
    final prefs = await SharedPreferences.getInstance();
    _uname = prefs.getString("username");
    _usermobile = prefs.getString("usermobile");
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

  String _selectedAge;
  String _category;
  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: ListView(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(top: 30, left: 20, right: 20),
              child: TextFormField(
                controller: myLocController,
                enabled: false,
                decoration: const InputDecoration(
                  fillColor: Colors.red,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  hintText: 'Enter your Place',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter Place';
                  }
                  return null;
                },
              )),

          //Padding(padding: EdgeInsets.only(left: 10.0, top: 10.0)),
          //Text("Age"),
          Padding(
              padding: EdgeInsets.only(top: 20, left: 20, right: 20),
              child: TextFormField(
                controller: myRemarksController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  hintText: 'Enter Remarks',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Enter Remarks';
                  }
                  return null;
                },
              )),

          Padding(
              padding: EdgeInsets.only(top: 20, left: 20, right: 20),
              child: InputDecorator(
                decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    labelText: "Select Gender",
                    errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 12.0),
                    hintText: 'Please select',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(width: 2.0, color: Colors.red),
                        borderRadius: BorderRadius.circular(20)),
                    focusColor: Colors.red),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
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
              )),

          Padding(
              padding: EdgeInsets.only(top: 20, left: 20, right: 20),
              child: InputDecorator(
                decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    labelText: "Select Age",
                    errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 12.0),
                    hintText: 'Please select',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    autofocus: true,
                    isDense: true,
                    onChanged: (String newValue) {
                      setState(() {
                        _value = newValue;
                      });
                    },
                    value: _value,
                    items: _currencies.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: new Text(value),
                      );
                    }).toList(),
                  ),
                ),
              )),
          Container(
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 80, left: 20, right: 20),
                ),
                new ElevatedButton.icon(
                    onPressed: clickPhoto,
                    icon: Icon(Icons.camera_alt),
                    label: Text("Upload image")),
                Padding(padding: EdgeInsets.only(left: 50.0)),
                new ElevatedButton.icon(
                    onPressed: clickPhoto,
                    icon: Icon(Icons.video_collection),
                    label: Text("Upload Video")),
              ],
            ),
          ),
          Container(
            width: 100.0,
            height: 100.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            child: Image.network(
              imgurl != null ? imgurl : "",
              height: 100.0,
              width: 100.0,
            ),
          ),

          new Container(
              padding: EdgeInsets.only(top: 20, left: 30, right: 30),
              child: new ElevatedButton.icon(
                  onPressed: () async {
                    // It returns true if the form is valid, otherwise returns false
                    if (_formKey.currentState.validate()) {
                      setState(() {});
                      // If the form is valid, display a Snackbar.
                      final fs = FirebaseFirestore.instance;
                      await fs.collection("data").add({
                        'Requestby': _uname,
                        'RequestMob': _usermobile,
                        //Data ap per Required Page
                        'Category': 'Child Labour',
                        'Age': _selectedAge,
                        'Sex': _category,
                        //---Data collection end
                        'Remarks': myRemarksController.text,
                        'imageurl': imgurl,
                        "latitude": lat,
                        "longitude": lng,
                        "status": "Open"
                      }).whenComplete(() => Navigator.of(context).pop());

                      Scaffold.of(context).showSnackBar(
                        SnackBar(content: Text('Data is in processing.')),
                      );
                      //sleep(Duration(seconds: 5));
                    }
                  },
                  icon: Icon(Icons.save_alt_outlined),
                  label: Text("Submit Your Request"))),
        ],
      ),
    );
  }
}
