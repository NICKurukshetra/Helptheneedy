import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_application_2/models/Apiservices.dart';
import 'package:flutter_application_2/models/UsersReg.dart';
import 'package:flutter_application_2/main.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

User _user;

List<String> _value;
var _childval = [
  'Child Labour',
  'Child Education (Dropouts)',
  'Missing Child',
  'Runaway Child',
  'Elderly Care (at Home)',
  'Elderly Care (Old Age Home)',
  'Shelter Home',
  'Injured Animal',
  'Accident',
  'De Addiction',
  'Dead Animal Pickup',
  'Donate (Clothes,Food)',
  'Blood',
];

final _multiKey = GlobalKey<FormState>();

class ProfilePage extends StatefulWidget {
  ProfilePage(User user) {
    _user = user;
  }
  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<ProfilePage> {
  bool _status = false;
  bool isNameValid = false;
  bool isEmgHomeValid = false;
  bool isEmgFrndValid = false;
  bool isRegValid = false;

  final FocusNode myFocusNode = FocusNode();
  TextEditingController mycontrollerReg = TextEditingController();
  TextEditingController myControllerName = TextEditingController();
  TextEditingController myControllerEmail = TextEditingController();
  TextEditingController myControllerMob = TextEditingController();
  TextEditingController myControllerEmgHome = TextEditingController();
  TextEditingController myControllerEmgFrnd = TextEditingController();

  String _site = "Public";
  bool myreg = false;
  @override
  void initState() {
    final prefs = SharedPreferences.getInstance();
    if (_user != null) {
      myControllerName.text = _user.displayName;
      myControllerEmail.text = _user.email;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("Profile"),
        ),
        body: new Container(
          child: new ListView(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Container(
                    height: 140.0,
                    color: Colors.white,
                    child: new Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 0.0),
                          child:
                              new Stack(fit: StackFit.loose, children: <Widget>[
                            new Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new Container(
                                    width: 140.0,
                                    height: 140.0,
                                    decoration: new BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: new DecorationImage(
                                          image: NetworkImage(
                                        _user.photoURL,
                                      )),
                                    )),
                              ],
                            ),
                          ]),
                        )
                      ],
                    ),
                  ),
                  new Container(
                    color: Color(0xffFFFFFF),
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 5.0),
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 1.0),
                              child: new Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      _status
                                          ? _getEditIcon()
                                          : new Container(),
                                    ],
                                  )
                                ],
                              )),
                          Row(
                            children: [
                              Padding(padding: EdgeInsets.only(left: 25.0)),
                              Text("Public"),
                              Radio(
                                value: "Public",
                                groupValue: _site,
                                onChanged: (value) {
                                  setState(() {
                                    myreg = false;
                                    _site = value;
                                  });
                                },
                              ),
                              Padding(padding: EdgeInsets.only(left: 10.0)),
                              Text(
                                "Volunteer",
                                style: TextStyle(),
                              ),
                              Radio(
                                value: "VOLUNTEER",
                                groupValue: _site,
                                onChanged: (value) {
                                  setState(() {
                                    myreg = false;
                                    _site = value;
                                  });
                                },
                              ),
                              Padding(padding: EdgeInsets.only(left: 10.0)),
                              Text("NGO"),
                              Radio(
                                value: "NGO",
                                groupValue: _site,
                                onChanged: (value) {
                                  setState(() {
                                    myreg = true;
                                    _site = value;
                                  });
                                },
                              ),
                            ],
                          ),
                          myreg
                              ? Padding(
                                  padding: EdgeInsets.only(
                                      left: 20.0, right: 10.0, top: 25.0),
                                  child: MultiSelectDialogField(
                                    autovalidateMode: AutovalidateMode.always,
                                    items: _childval
                                        .map((e) =>
                                            MultiSelectItem<String>(e, e))
                                        .toList(),
                                    title: Text("Category"),
                                    //  selectedColor: Colors.blue,
                                    decoration: BoxDecoration(
                                      //color: Colors.blue.withOpacity(0.1),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      border: Border.all(
                                        color: Colors.blue,
                                        width: 0.5,
                                      ),
                                    ),
                                    // buttonIcon: Icon(
                                    //   Icons.pets,
                                    //   color: Colors.blue,
                                    // ),
                                    buttonText: Text(
                                      "Select Category",
                                      style: TextStyle(
                                        color: Colors.blue[800],
                                        fontSize: 16,
                                      ),
                                    ),
                                    onConfirm: (results) {
                                      _value = results;
                                    },
                                  ))
                              : new Container(),
                          myreg
                              ? Padding(
                                  padding: EdgeInsets.only(
                                      left: 25.0, right: 25.0, top: 5.0),
                                  child: new Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      new Flexible(
                                        child: new TextFormField(
                                          onChanged: (value) {
                                            if ((value.isEmpty)) {
                                              isRegValid = true;
                                            } else {
                                              isRegValid = false;
                                            }
                                            setState(() {});
                                          },
                                          controller: mycontrollerReg,
                                          decoration: InputDecoration(
                                              hintText: "Enter NGO Name",
                                              errorText:
                                                  isRegValid ? '' : null),
                                          enabled: !_status,
                                          autofocus: !_status,
                                        ),
                                      ),
                                    ],
                                  ))
                              : new Container(),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      new Text(
                                        'Name',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 2.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Flexible(
                                    child: new TextFormField(
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return 'Please enter some text';
                                        }
                                        return null;
                                      },
                                      controller: myControllerName,
                                      decoration: const InputDecoration(
                                        hintText: "Enter Your Name",
                                      ),
                                      enabled: !_status,
                                      autofocus: !_status,
                                    ),
                                  ),
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      new Text(
                                        'Email ID',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 2.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Flexible(
                                    child: new TextField(
                                      keyboardType: TextInputType.emailAddress,
                                      controller: myControllerEmail,
                                      decoration: const InputDecoration(
                                          hintText: "Enter Email ID"),
                                      enabled: !_status,
                                    ),
                                  ),
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      new Text(
                                        'Mobile',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 2.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Flexible(
                                    child: new TextField(
                                      keyboardType: TextInputType.number,
                                      controller: myControllerMob,
                                      onChanged: (value) {
                                        if ((value.isEmpty)) {
                                          isNameValid = true;
                                        } else {
                                          isNameValid = false;
                                        }
                                        setState(() {});
                                      },
                                      decoration: InputDecoration(
                                          hintText: "Enter Mobile Number",
                                          errorText: isNameValid
                                              ? 'Enter Mobile'
                                              : null),
                                      enabled: !_status,
                                    ),
                                  ),
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      new Text(
                                        'Emergency Home Contact No',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 2.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Flexible(
                                    child: new TextField(
                                      keyboardType: TextInputType.number,
                                      controller: myControllerEmgHome,
                                      onChanged: (value) {
                                        if ((value.isEmpty)) {
                                          isEmgHomeValid = true;
                                        } else {
                                          isEmgHomeValid = false;
                                        }
                                        setState(() {});
                                      },
                                      decoration: InputDecoration(
                                          hintText:
                                              "Enter Emergency Home Contact No",
                                          errorText: isEmgHomeValid
                                              ? 'Home Contact'
                                              : null),
                                      enabled: !_status,
                                    ),
                                  ),
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      new Text(
                                        'Emergency Friend Contact No',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 2.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Flexible(
                                    child: new TextField(
                                      keyboardType: TextInputType.number,
                                      controller: myControllerEmgFrnd,
                                      onChanged: (value) {
                                        if ((value.isEmpty)) {
                                          isEmgFrndValid = true;
                                        } else {
                                          isEmgFrndValid = false;
                                        }
                                        setState(() {});
                                      },
                                      decoration: InputDecoration(
                                          hintText:
                                              "Enter Emergency Friend Contact No",
                                          errorText: isEmgFrndValid
                                              ? 'Friend Contact'
                                              : null),
                                      enabled: !_status,
                                    ),
                                  ),
                                ],
                              )),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 0.0),
                          ),
                          !_status ? _getActionButtons() : new Container(),
                        ],
                      ),
                    ),
                  ),
                  new Container(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Visibility(
                          visible: _status,
                          child: new ElevatedButton(
                            child: new Text("Continue"),
                            onPressed: () async {
                              final prefs =
                                  await SharedPreferences.getInstance();
                              //prefs.setString("userid", _user.uid);
                              prefs.setString("username", _user.displayName);
                              prefs.setString("useremail", _user.email);
                              prefs.setString(
                                  "usermobile", myControllerMob.text);
                              prefs.setString(
                                  "userEmgHome", myControllerEmgHome.text);
                              prefs.setString(
                                  "userEmgFrnd", myControllerEmgFrnd.text);
                              prefs.setString("userphotourl", _user.photoURL);
                              prefs.setString("usertype", _site);
                              prefs.setString("ngoname", mycontrollerReg.text);
                              prefs.setStringList("cat", _value);

                              /* final fs = FirebaseFirestore.instance;
                              await fs.collection("Registration").add({
                                'Name': _user.displayName,
                                'Mobile': myControllerMob.text,
                                'Email': _user.email,
                                'Photo': _user.photoURL,
                                "User": _site,
                                "EmgHome": myControllerEmgHome.text,
                                "EmgFriend": myControllerEmgFrnd.text
                              }); */
                              Users users = new Users(
                                  name: _user.displayName,
                                  mobile: myControllerMob.text,
                                  email: _user.email,
                                  photourl: _user.photoURL,
                                  type: _site,
                                  cat: _value.toString(),
                                  ngoname: mycontrollerReg.text);

                              var res = await APIServices.postUsers(users);
                              if (res != 200) {
                                showdg(context, "Error", "Error saving data");
                                return;
                              }

                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.purple,
                                textStyle: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold)),
                          ))),
                ],
              ),
            ],
          ),
        ));
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myFocusNode.dispose();
    super.dispose();
  }

  Widget _getActionButtons() {
    return Padding(
      padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 15.0),
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Container(
                  child: new ElevatedButton(
                child: new Text("Save"),
                onPressed: () async {
                  setState(() {
                    if (isNameValid ||
                        myControllerMob.text.length < 10 ||
                        myControllerMob.text.length > 10) {
                      isNameValid = true;
                      return;
                    }

                    if (isEmgHomeValid ||
                        myControllerEmgHome.text.length < 10 ||
                        myControllerEmgHome.text.length > 10) {
                      isEmgHomeValid = true;
                      return;
                    }
                    if (isEmgFrndValid ||
                        myControllerEmgFrnd.text.length < 10 ||
                        myControllerEmgFrnd.text.length > 10) {
                      isEmgFrndValid = true;
                      return;
                    }
                    if (myreg == true && mycontrollerReg.text.length == 0) {
                      isRegValid = true;
                      return;
                    }
                    _status = true;
                  });

                  // If the form is valid, display a Snackbar.
                },
              )),
            ),
            flex: 2,
          ),
        ],
      ),
    );
  }

  Widget _getEditIcon() {
    return new GestureDetector(
      child: new CircleAvatar(
        backgroundColor: Colors.red,
        radius: 14.0,
        child: new Icon(
          Icons.edit,
          color: Colors.white,
          size: 16.0,
        ),
      ),
      onTap: () {
        setState(() {
          _status = false;
        });
      },
    );
  }
}
