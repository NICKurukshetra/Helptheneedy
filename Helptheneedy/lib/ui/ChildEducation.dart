import 'dart:io';

import 'package:android_intent/android_intent.dart';

import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/Apiservices.dart';
import 'package:flutter_application_2/models/Data.dart';
import 'package:flutter_application_2/main.dart';

import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_player/video_player.dart';

String _cat;
bool _Age;
bool _Gender;
bool _child;

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

//New Change

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
  String mediatype;
  bool _imagevis = false;
  bool _videovis = false;
  bool _imageinit = false;
  bool _videointi = false;

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
  var fileurl;
  String lat;
  String lng;

  bool startedPlaying = false;
  VideoPlayerController controller; // used to controller videos
  Future<bool> futureController() async {
    //await controller.initialize();

    startedPlaying = true;
    return true;
  }

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
    setState(() {
      _imagevis = true;
      _imageinit = true;

      fileurl = null;
      _videovis = false;
      _videointi = false;

      //futureController.call();
    });
    var picker = ImagePicker();
    var img = await picker.getImage(source: ImageSource.camera);

    if (img != null) {
      var imgpath = File(img.path);

      var fbstore = FirebaseStorage.instance.ref().child("path").child(DateTime
              .now()
          .toString()); //to connect to core bucket we use ref function & child will create folder if not present
      await fbstore.putFile(imgpath);
      var imgurl1 = await fbstore.getDownloadURL();
      setState(() {
        fileurl = imgurl1;
        _imageinit = false;
        _imagevis = true;
        mediatype = 'I';
      });
    }
  }

  clickVideo() async {
    setState(() {
      _videovis = true;
      _videointi = true;

      fileurl = null;
      _imagevis = false;
      _imageinit = false;
      //futureController.call();
    });
    var picker = ImagePicker();
    var video = await picker.getVideo(
      source: ImageSource.camera,
      maxDuration: const Duration(seconds: 240),
    );

    if (video != null) {
      var fbstore = FirebaseStorage.instance.ref().child("path").child(DateTime
              .now()
          .toString()); //to connect to core bucket we use ref function & child will create folder if not present

      await fbstore.putFile(File(video.path));
      var url = await fbstore.getDownloadURL();

      setState(() {
        fileurl = url;
        _videointi = false;
        controller = new VideoPlayerController.network(url);
        futureController.call();
        mediatype = 'V';
      });
    }
  }

  location() async {
    var p = await Geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    setState(() {
      lat = p.latitude.toString();
      lng = p.longitude.toString();
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
    fileurl = null;
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
                          errorStyle: TextStyle(
                              color: Colors.redAccent, fontSize: 12.0),
                          hintText: 'Please select',
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2.0, color: Colors.red),
                              borderRadius: BorderRadius.circular(20)),
                          focusColor: Colors.red),
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        alignment: WrapAlignment.spaceAround,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        //mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                      )))),

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
                          _selectedAge = newValue;
                        });
                      },
                      value: _selectedAge,
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
                  hintText: 'Enter Details',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Enter Details';
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
                    onPressed: clickPhoto,
                    icon: Icon(Icons.camera_alt),
                    label: Text("Upload image")),
                Padding(padding: EdgeInsets.only(left: 20.0)),
                new ElevatedButton.icon(
                    onPressed: clickVideo,
                    icon: Icon(Icons.video_collection),
                    label: Text("Upload Video")),
              ],
            ),
          ),
          //---Image
          Visibility(
            visible: _imagevis,
            child: fileurl != null
                ? Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    child: Image.network(
                      fileurl != null ? fileurl : "",
                      height: 100.0,
                      width: 100.0,
                    ),
                  )
                : new Center(child: CircularProgressIndicator()),
          ),

//Video
          Visibility(
              visible: _videovis,
              child: _videointi
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: 100.0,
                      child: FutureBuilder(
                        future: futureController(),
                        builder: (context, snapshot) {
                          // if video to ready to play, else show a progress bar to the user
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            return AspectRatio(
                                aspectRatio: 16 / 9,
                                child: VideoPlayer(controller));
                          } else {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      ),
                    )),
          new Container(
              padding: EdgeInsets.only(top: 20, left: 30, right: 30),
              child: new ElevatedButton.icon(
                  onPressed: () async {
                    // It returns true if the form is valid, otherwise returns false
                    {
                      //setState(() {});
                      if (_formKey.currentState.validate() == true) {
                        if (_Age == true && _selectedAge == null) {
                          showSnack(context, "Select Age");
                          return;
                        }
                        if (_Gender == true && _category == null) {
                          showSnack(context, "Select Category");
                          return;
                        }
                        if (fileurl == null) {
                          showSnack(context, "Upload image/videos");
                          return;
                        }

                        try {
                          NeedyData users = NeedyData(
                              requestby: _uname,
                              requestmob: _usermobile,
                              category: _cat,
                              age: _selectedAge,
                              sex: _category,
                              remarks: myRemarksController.text,
                              imgurl: fileurl,
                              lat: lat,
                              longit: lng,
                              mediatype: mediatype,
                              status: 'Open');
                          showSnack(context, "Processing Data..");
                          var res = await APIServices.postNeedyData(users)
                              .whenComplete(() => null);

                          if (res.toString() == "1") {
                            showdg(context, "Success", "Request Submitted");
                          }
                        } on Exception catch (exception) {
                          print(exception);
                        } catch (exception) {
                          print(exception);
                        }
                      }
                    }
                  },
                  icon: Icon(Icons.save_alt_outlined),
                  label: Text("Submit Your Request"))),
        ],
      ),
    );
  }

  Future _checkGps() async {
    if (!(await Geolocator.isLocationServiceEnabled())) {
      if (Theme.of(context).platform == TargetPlatform.android) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Can't get Current location"),
                content:
                    const Text('Please make sure you enable GPS and try again'),
                actions: <Widget>[
                  ElevatedButton(
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
    if (!(await Geolocator.isLocationServiceEnabled())) {
      _checkGps();
      return null;
    } else
      return true;
  }
}
