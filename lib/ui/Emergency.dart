import 'package:flutter/material.dart';

import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:url_launcher/url_launcher.dart';
import './Emergency1.dart';

String emgHome;
String emgFrnd;
var lat;
var lng;
void main() {
  runApp(MaterialApp(
    home: Emergency(),
  ));
}

class Emergency extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Emergency> {
  @override
  void initState() {
    checkuser(context);
    location();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Emergency'),
        ),
        body: Card(
            clipBehavior: Clip.antiAlias,
            margin: EdgeInsets.all(10),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                //mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  /*Padding(
                    padding: EdgeInsets.all(10),
                    child: IconButton(
                      icon: Icon(
                        //Icons.add_alert_sharp,
                        (MdiIcons.alarmLight),
                        size: 80.0,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Emergency1()));
                      },
                    ),
                  ),*/
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Container(
                      width: 180,
                      height: 180,
                      child: MaterialButton(
                        color: Colors.accents[15],
                        shape: CircleBorder(
                            side: BorderSide(
                                width: 5,
                                color: Colors.white,
                                style: BorderStyle.solid)),
                        child: Text(
                          "Help!",
                          style: TextStyle(fontSize: 40.0),
                        ),
                        textColor: Colors.white,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Emergency1()));
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "In case of Emergency Press Help Button",
                      style: TextStyle(fontSize: 19.0, color: Colors.red[900]),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //Padding(padding: EdgeInsets.only(left: 5.0)),
                        ElevatedButton(
                        
                            onPressed: () {
                              sms(emgHome,
                                  'I am Safe my Location link https://map.google.com/maps/?q=$lat,$lng');
                              sms(emgFrnd,
                                  'I am Safe my Location link https://map.google.com/maps/?q=$lat,$lng');
                            },
                            child: const Text('Safe',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white)),
                            ),
                        ElevatedButton(
                         
                            onPressed: () {
                              sms(emgHome,
                                  'Kindly keep on watch my Location link https://map.google.com/maps/?q=$lat,$lng');
                              sms(emgFrnd,
                                  'Kindly keep on watch my Location link https://map.google.com/maps/?q=$lat,$lng');
                            },
                            child: const Text('Watch',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black)),
                            ),
                        ElevatedButton(
                          
                            onPressed: () {
                              sms(emgHome,
                                  'I am unsafe my Location link https://map.google.com/maps/?q=$lat,$lng');
                              sms(emgFrnd,
                                  'I am unsafe my Location link https://map.google.com/maps/?q=$lat,$lng');
                            },
                            child: const Text('Unsafe',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white)),
                            ),
                      ],
                    ),
                  ),
                ])));
  }

  Future<void> sms(String mob, String msg) async {
    String address = "+91" + mob;

    var whatsappUrl = "whatsapp://send?phone=$address&text=$msg";
    await launch(whatsappUrl);
  }

  location() async {
    var p = await Geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    setState(() {
      lat = p.latitude;
      lng = p.longitude;
    });
  }
}

void checkuser(BuildContext context) async {
  final prefs = await SharedPreferences.getInstance();
  emgHome = prefs.getString("userEmgHome");
  emgFrnd = prefs.getString("userEmgFrnd");
}
