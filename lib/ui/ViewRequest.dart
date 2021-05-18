import 'dart:ui';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/Apiservices.dart';
import 'package:flutter_application_2/models/NgoAction.dart';
import 'package:video_player/video_player.dart';
import 'ViewNgoAction.dart';
import '../main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import 'video_items.dart';

//import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
// ignore: unused_import
enum UrlType { IMAGE, VIDEO, UNKNOWN }
bool NGO = false;
String _ngoname;
int _id;
String _remarks;
String _imgurl;
String _category;
String _sex;
String _age;
String _lat, _long, _status, _dated, _mtype;

class ViewRequest extends StatefulWidget {
  final String id;
  final String remarks;
  final String imgurl;
  final String category;
  final sex;
  final String age;
  final String lat, long, status, dated, mtype;
  ViewRequest(this.id, this.remarks, this.age, this.category, this.dated,
      this.imgurl, this.lat, this.long, this.sex, this.status, this.mtype) {
    _id = int.parse(id);
    _remarks = remarks;
    _imgurl = imgurl;
    _category = category;
    _sex = sex;
    _age = age;
    _lat = lat;
    _long = long;
    _status = status;
    _mtype = mtype;
    _dated = dated;
  }

  @override
  _State createState() => _State();
}

class _State extends State<ViewRequest> {
  VideoPlayerController controller; // used to controller videos
  ChewieController _chewieController;
  @override
  Future<void> initState() {
    setuser();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  Future<void> futureController() async {
    controller = VideoPlayerController.network(_imgurl);
    await controller.initialize();
    _chewieController = ChewieController(
      videoPlayerController: controller,
      autoPlay: true,
      looping: true,
      // Try playing around with some of these other options:

      // showControls: false,
      // materialProgressColors: ChewieProgressColors(
      //   playedColor: Colors.red,
      //   handleColor: Colors.blue,
      //   backgroundColor: Colors.grey,
      //   bufferedColor: Colors.lightGreen,
      // ),
      // placeholder: Container(
      //   color: Colors.grey,
      // ),
      // autoInitialize: true,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('View Request'),
        ),
        body: ListView(children: [
          Card(
            margin: EdgeInsets.all(20),
            elevation: 10,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Card(
                      margin: EdgeInsets.all(20),
                      child: _mtype == 'V'
                          ? Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.teal)),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width - 100,
                                height: MediaQuery.of(context).size.width - 200,
                                child: VideoItems(
                                  videoPlayerController:
                                      VideoPlayerController.network(_imgurl),
                                  looping: false,
                                  autoplay: false,
                                ),
                              ),
                            )
                          : CircleAvatar(
                              maxRadius: 90.0,
                              backgroundImage: NetworkImage(_imgurl),
                            ),
                      elevation: 0.0,
                      // shape: CircleBorder(),
                    ),
                    Text(
                      _category,
                      style: TextStyle(
                          fontSize: 20, color: Colors.deepOrange[700]),
                    ),
                    Divider(
                      color: Colors.black,
                      height: 3,
                    ),
                    Visibility(
                        visible: (_age.isNotEmpty) ? true : false,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Age : " + _age),
                            Text("  Gender : " + _sex)
                          ],
                        )),
                    Divider(
                      color: Colors.black,
                      height: 3,
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
                              icon: Icon(Icons.my_location_rounded),
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
                                  if (res != 200) {
                                    showdg(
                                        context, "Error", "Error saving data");
                                    return;
                                  }
                                  if (res == 200) {
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
                                  if (res != 200) {
                                    showdg(
                                        context, "Error", "Error saving data");
                                    return;
                                  }
                                  if (res == 200) {
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
          ),
          Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: ElevatedButton.icon(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NgoAction(_id.toString())),
                    );
                  },
                  icon: Icon(Icons.list_alt_rounded),
                  label: Text("View NGO Action")))
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
