import 'dart:developer';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/Apiservices.dart';
import 'package:flutter_application_2/models/NgoAction.dart';
import 'ViewNgoAction.dart';
import 'main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
//import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
// ignore: unused_import

bool NGO = false;
String _ngoname;
String _id;
String _remarks;
String _imgurl;
String _category;
String _sex;
String _age;
String _lat, _long, _status, _dated;

class ViewRequest extends StatefulWidget {
  final String id;
  final String remarks;
  final String imgurl;
  final String category;
  final sex;
  final String age;
  final String lat, long, status, dated;
  ViewRequest(this.id, this.remarks, this.age, this.category, this.dated,
      this.imgurl, this.lat, this.long, this.sex, this.status) {
    _id = id;
    _remarks = remarks;
    _imgurl = imgurl;
    _category = category;
    _sex = sex;
    _age = age;
    _lat = lat;
    _long = long;
    _status = status;
    _dated = dated;
  }

  @override
  _State createState() => _State();
}

class _State extends State<ViewRequest> {
  @override
  Future<void> initState() {
    setuser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('View Request'),
        ),
        body: Column(children: [
          SingleChildScrollView(
              child: Card(
            margin: EdgeInsets.all(20),
            elevation: 10,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  children: [
                    Card(
                      margin: EdgeInsets.all(20),
                      child: CircleAvatar(
                        maxRadius: 90.0,
                        backgroundImage: NetworkImage(_imgurl),
                      ),
                      elevation: 5.0,
                      shape: CircleBorder(),
                    ),
                    Text(
                      _category,
                      style: TextStyle(
                          fontSize: 20, color: Colors.deepOrange[700]),
                    ),
                    Divider(
                      color: Colors.black,
                      height: 10,
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Center(
                          child: Text(
                            _remarks,
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        )),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(padding: EdgeInsets.only(left: 5.0)),
                          ElevatedButton.icon(
                              onPressed: () {
                                navigateTo(_lat, _long);
                              },
                              icon: Icon(Icons.gps_fixed_outlined),
                              label: const Text('Track Geo Location',
                                  style: TextStyle(fontSize: 12)))
                        ],
                      ),
                    ),
                    Visibility(
                      visible: NGO,
                      child: Container(
                        margin: EdgeInsets.all(10),
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            //Padding(padding: EdgeInsets.only(left: 0.0)),
                            RaisedButton(
                                color: Color(0xff024A8E),
                                onPressed: () async {
                                  Ngo users = new Ngo(
                                    id: _id,
                                    ngo: _ngoname,
                                    action: 'Short Listed',
                                  );

                                  var res = await APIServices.postNGoData(users)
                                      .whenComplete(() => null);

                                  if (res != 200) {
                                    showdg(
                                        context, "Error", "Error saving data");
                                    return;
                                  }
                                  if (res == 200) {
                                    showdg(context, "Success",
                                        "Needy Short Listed");
                                  }
                                },
                                child: const Text('Short Listed',
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.white)),
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(10.0))),
                            Padding(padding: EdgeInsets.only(left: 5.0)),

                            RaisedButton(
                                color: Color(0xff024A8E),
                                onPressed: () async {
                                  Ngo users = new Ngo(
                                    id: _id,
                                    ngo: _ngoname,
                                    action: 'Ignore',
                                  );

                                  var res =
                                      await APIServices.postNGoData(users);
                                  if (res == 0) {
                                    showdg(
                                        context, "Error", "Error saving data");
                                    return;
                                  }
                                  if (res == 1) {
                                    showdg(context, "Success", "Needy Ignored");
                                  }
                                },
                                child: const Text('Ignore',
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.white)),
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(10.0))),
                            Padding(padding: EdgeInsets.only(left: 5.0)),

                            RaisedButton(
                                color: Color(0xff024A8E),
                                onPressed: () async {
                                  Ngo users = new Ngo(
                                    id: _id,
                                    ngo: _ngoname,
                                    action: 'Hold',
                                  );

                                  var res =
                                      await APIServices.postNGoData(users);
                                  if (res == 0) {
                                    showdg(
                                        context, "Error", "Error saving data");
                                    return;
                                  }
                                  if (res == 1) {
                                    showdg(context, "Success", "Needy on Hold");
                                  }
                                },
                                child: const Text('Hold',
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.white)),
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(10.0))),
                            Padding(padding: EdgeInsets.only(left: 5.0)),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          )),
          ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NgoAction(_id)),
                );
              },
              icon: Icon(Icons.list_alt_rounded),
              label: Text("View NGO Action"))
        ]));
  }

  void setuser() async {
    final prefs = await SharedPreferences.getInstance();
    String uid = prefs.getString("usertype");
    if (uid != null) {
      if (uid == "NGO") {
        setState(() {
          NGO = true;
          _ngoname = prefs.getString("ngoname");
        });
      } else {
        setState(() {
          NGO = false;
        });
      }
    }
  }
}

void navigateTo(String lat, String lng) async {
  var uri = Uri.parse("google.navigation:q=$lat,$lng&mode=d");
  if (await canLaunch(uri.toString())) {
    await launch(uri.toString());
  } else {
    throw 'Could not launch ${uri.toString()}';
  }
}
