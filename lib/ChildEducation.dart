import 'dart:io';

import 'package:android_intent/android_intent.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/main.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

String _cat;
bool _Age;
bool _Gender;
bool _child;

Color getColor(Set<MaterialState> states) {
  const Set<MaterialState> interactiveStates = <MaterialState>{
    MaterialState.pressed,
    MaterialState.hovered,
    MaterialState.focused,
  };
  if (states.any(interactiveStates.contains)) {
    return Colors.blue;
  }
  return Colors.teal;
}

class ChildEducation extends StatelessWidget {
  ChildEducation(String cat, String Gender, String Age) {
    _cat = cat;
    Gender != "0" ? _Gender = true : _Gender = false;
    Age != "0" ? _Age = true : _Age = false;
    Age == "2" ? _child = true : _child = false;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_cat),
      ),
      body: MyCustomForm(),
    );
  }
}

String _value;
String objtext;
var _currencies = [
  '1 to 10',
  '10 to 20',
  '20 to 40',
  '40 to 60',
  'Above 60',
  'Not Known'
];
var _childval = ['1 to 5', '5 to 10', '10 to 14', 'Not Known'];

var imgpath;
var imgurl;
var lat;
var lng;

//New Change
bool _imagevis = false;
//--
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

//Changed

  getPermisson() async {
    await _gpsService();
  }

  clickPhoto() async {
    var picker = ImagePicker();
    var img = await picker.getImage(source: ImageSource.camera);
    setState(() async {
      if (img != null) {
        imgpath = File(img.path);

        var fbstore = FirebaseStorage.instance.ref().child("path").child(DateTime
                .now()
            .toString()); //to connect to core bucket we use ref function & child will create folder if not present
        await fbstore.putFile(imgpath);
        var imgurl1 = await fbstore.getDownloadURL();
        setState(() {
          imgurl = imgurl1;
          _imagevis = true;
        });
      }
    });
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
    getPermisson();
    location();
    getuserdetail();
    imgurl = null;
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
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  labelText: "Geo Location",
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

          Visibility(
              visible: _Gender,
              child: Padding(
                  padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: InputDecorator(
                    decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        labelText: "Select Gender",
                        errorStyle:
                            TextStyle(color: Colors.redAccent, fontSize: 12.0),
                        hintText: 'Please select',
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2.0, color: Colors.red),
                            borderRadius: BorderRadius.circular(20)),
                        focusColor: Colors.red),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
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
                          ],
                        ),
                        Row(
                          children: [
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
                        Row(
                          children: [
                            Text("Transgender"),
                            Radio(
                              value: "Transgender",
                              groupValue: _category,
                              onChanged: (value) {
                                setState(() {
                                  _category = value;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ))),

          Visibility(
            visible: _Gender,
            child: Padding(
                padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                child: InputDecorator(
                  decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      labelText: "Select Age (Year)",
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
                      items: _child
                          ? _childval.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: new Text(value),
                              );
                            }).toList()
                          : _currencies.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: new Text(value),
                              );
                            }).toList(),
                    ),
                  ),
                )),
          ),
          Padding(
              padding:
                  EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
              child: TextFormField(
                maxLines: 3,
                keyboardType: TextInputType.multiline,
                controller: myRemarksController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  hintText: 'Enter Complete Details',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Enter Remarks';
                  }
                  return null;
                },
              )),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                new ElevatedButton.icon(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith(getColor)),
                    onPressed: clickPhoto,
                    icon: Icon(Icons.camera_alt),
                    label: Text("Upload image")),
                Padding(padding: EdgeInsets.only(left: 20.0)),
                new ElevatedButton.icon(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith(getColor)),
                    onPressed: clickPhoto,
                    icon: Icon(Icons.video_collection),
                    label: Text("Upload Video")),
              ],
            ),
          ),
          //---New
          Visibility(
              visible: _imagevis ? _imagevis : _imagevis,
              child: Container(
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
              )),

//New
          new Container(
              padding: EdgeInsets.only(top: 20, left: 30, right: 30),
              child: new ElevatedButton.icon(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.resolveWith(getColor)),
                  onPressed: () async {
                    // It returns true if the form is valid, otherwise returns false
                    if (_formKey.currentState.validate()) {
                      setState(() {});
                      if (imgurl == null) {
                        showdg(context, "Erro ?", "Upload image");
                        return;
                      }
                      // If the form is valid, display a Snackbar.
                      final fs = FirebaseFirestore.instance;
                      await fs.collection("data").add({
                        'Requestby': _uname,
                        'RequestMob': _usermobile,
                        //Data ap per Required Page
                        'Category': _cat,
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

  Future _checkGps() async {
    if (!(await Geolocator().isLocationServiceEnabled())) {
      if (Theme.of(context).platform == TargetPlatform.android) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Can't get Current location"),
                content:
                    const Text('Please make sure you enable GPS and try again'),
                actions: <Widget>[
                  FlatButton(
                      child: Text('Ok'),
                      onPressed: () {
                        final AndroidIntent intent = AndroidIntent(
                            action:
                                'android.settings.LOCATION_SOURCE_SETTINGS');
                        intent.launch();
                        Navigator.of(context, rootNavigator: true).pop();
                        _gpsService();
                      })
                ],
              );
            });
      }
    }
  }

/*Check if gps service is enabled or not*/
  Future _gpsService() async {
    if (!(await Geolocator().isLocationServiceEnabled())) {
      _checkGps();
      return null;
    } else
      return true;
  }
}
