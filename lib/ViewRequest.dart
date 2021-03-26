import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/ViewNgoAction.dart';
import 'package:flutter_application_2/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
//import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
// ignore: unused_import

String _id;
bool NGO = false;
String _ngoname;

class ViewRequest extends StatefulWidget {
  ViewRequest(String id) {
    _id = id;
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
          StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('data')
                  .doc(_id) //ID OF DOCUMENT
                  .snapshots(),
              // ignore: missing_return
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return new CircularProgressIndicator();
                } else {
                  var document = snapshot.data;
                  return SingleChildScrollView(
                      child: Card(
                    color: Colors.cyan[100],
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
                                backgroundImage:
                                    NetworkImage(document["imageurl"]),
                              ),
                              elevation: 5.0,
                              shape: CircleBorder(),
                            ),
                            Text(
                              document["Category"],
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
                                    document["Remarks"],
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                )),
                            Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(padding: EdgeInsets.only(left: 5.0)),
                                  RaisedButton(
                                      color: Color(0xff024A8E),
                                      onPressed: () {
                                        navigateTo(document["latitude"],
                                            document["longitude"]);
                                      },
                                      child: const Text('Track Live Location',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.white)),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              new BorderRadius.circular(10.0))),
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
                                          final fs = FirebaseFirestore.instance;
                                          var ngodate = await fs
                                              .collection('data')
                                              .doc(_id)
                                              .collection("NGOAction");
                                          ngodate
                                              .where('NGO', isEqualTo: _ngoname)
                                              .where('NGOAction',
                                                  isEqualTo: 'Short Listed');
                                          ngodate.get().then((value) async => {
                                                if (value.size > 0)
                                                  {
                                                    showdg(context, "Alert",
                                                        "Already Short Listed by You")
                                                  }
                                                else
                                                  {
                                                    await fs
                                                        .collection('data')
                                                        .doc(_id)
                                                        .collection("NGOAction")
                                                        .add(({
                                                          'NGO': _ngoname,
                                                          'NGOAction':
                                                              'Short Listed'
                                                        })),
                                                    showdg(context, "Alert",
                                                        "Short Listed by You")
                                                  }
                                              });
                                        },
                                        child: const Text('Short Listed',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.white)),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                new BorderRadius.circular(
                                                    10.0))),
                                    Padding(
                                        padding: EdgeInsets.only(left: 5.0)),

                                    RaisedButton(
                                        color: Color(0xff024A8E),
                                        onPressed: () async {
                                          final fs = FirebaseFirestore.instance;
                                          var ngodate = await fs
                                              .collection('data')
                                              .doc(_id)
                                              .collection("NGOAction");
                                          ngodate.where('NGO',
                                              isEqualTo: _ngoname);
                                          ngodate.where('NGOAction',
                                              isEqualTo: 'Ignore');
                                          ngodate.get().then((value) async => {
                                                if (value.size > 0)
                                                  {
                                                    showdg(context, "Alert",
                                                        "Already Ignored by You")
                                                  }
                                                else
                                                  {
                                                    await fs
                                                        .collection('data')
                                                        .doc(_id)
                                                        .collection("NGOAction")
                                                        .add(({
                                                          'NGO': _ngoname,
                                                          'NGOAction': 'Ignore'
                                                        })),
                                                    showdg(context, "Alert",
                                                        "Ignored by You")
                                                  }
                                              });
                                        },
                                        child: const Text('Ignore',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.white)),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                new BorderRadius.circular(
                                                    10.0))),
                                    Padding(
                                        padding: EdgeInsets.only(left: 5.0)),

                                    RaisedButton(
                                        color: Color(0xff024A8E),
                                        onPressed: () async {
                                          final fs = FirebaseFirestore.instance;
                                          var ngodate = await fs
                                              .collection('data')
                                              .doc(_id)
                                              .collection("NGOAction");
                                          ngodate
                                              .where('NGO', isEqualTo: _ngoname)
                                              .where('NGOAction',
                                                  isEqualTo: 'Hold');
                                          ngodate.get().then((value) async => {
                                                if (value.size > 0)
                                                  {
                                                    showdg(context, "Alert",
                                                        "Already Hold by You")
                                                  }
                                                else
                                                  {
                                                    await fs
                                                        .collection('data')
                                                        .doc(_id)
                                                        .collection("NGOAction")
                                                        .add(({
                                                          'NGO': _ngoname,
                                                          'NGOAction': 'Hold'
                                                        })),
                                                    showdg(context, "Alert",
                                                        "Hold by You")
                                                  }
                                              });
                                        },
                                        child: const Text('Hold',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.white)),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                new BorderRadius.circular(
                                                    10.0))),
                                    Padding(
                                        padding: EdgeInsets.only(left: 5.0)),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ));
                }
              }),
          ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NgoAction(_id)),
                );
              },
              icon: Icon(Icons.access_time_outlined),
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

void navigateTo(double lat, double lng) async {
  var uri = Uri.parse("google.navigation:q=$lat,$lng&mode=d");
  if (await canLaunch(uri.toString())) {
    await launch(uri.toString());
  } else {
    throw 'Could not launch ${uri.toString()}';
  }
}
