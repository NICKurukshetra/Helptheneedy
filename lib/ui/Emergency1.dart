import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Emergency1 extends StatefulWidget {
  @override
  _Emergency1State createState() => _Emergency1State();
}

class _Emergency1State extends State<Emergency1> {
  String emghome;
  String emgFrnd;

  @override
  void initState() {
    checkuser(context);

    super.initState();
  }

  @override
  // ignore: override_on_non_overriding_member
  void launchemergency({
    @required int phone,
    @required String message,
  }) async {
    String url() {
      return "https://wa.me/$phone::/?text=${Uri.parse(message)}";
    }

    if (await canLaunch(url())) {
      await launch(url());
    } else {
      throw 'Could not launch ${url()}';
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Emergency Contacts'),
        ),
        body: Stack(children: [
          SingleChildScrollView(),
          Padding(
            padding: EdgeInsets.all(10),
          ),
          Card(
            child: ListView(
              padding: EdgeInsets.all(10),
              children: <Widget>[
                Divider(
                  height: 10.0,
                  color: Colors.black,
                ),
                ListTile(
                  tileColor: Colors.brown,
                  trailing: Icon(
                    Icons.home_outlined,
                    size: 50,
                    color: Colors.white,
                  ),
                  leading: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.call,
                          color: Colors.white54,
                        ),
                        onPressed: () => launch("tel:$emghome"),
                      ),
                    ],
                  ),
                  title:
                      Text("Call Home", style: TextStyle(color: Colors.white)),
                  subtitle:
                      Text("$emghome", style: TextStyle(color: Colors.white)),
                  onTap: () => launch("tel:$emghome"),
                ),
                Divider(
                  height: 10.0,
                  color: Colors.black,
                ),
                ListTile(
                  tileColor: Colors.pink[400],
                  trailing: Icon(
                    Icons.face_retouching_natural,
                    size: 50,
                    color: Colors.white,
                  ),
                  leading: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.call,
                          color: Colors.white,
                        ),
                        onPressed: () => launch("tel:$emgFrnd"),
                      ),
                    ],
                  ),
                  title: Text("Call Friend",
                      style: TextStyle(color: Colors.white)),
                  subtitle:
                      Text("$emgFrnd", style: TextStyle(color: Colors.white)),
                  onTap: () => launch("tel:$emgFrnd"),
                ),
                Divider(
                  height: 10.0,
                  color: Colors.black,
                ),
                Divider(
                  height: 10.0,
                  color: Colors.black,
                ),
                ListTile(
                  tileColor: Colors.red,
                  trailing: Icon(
                    Icons.local_taxi,
                    size: 50,
                    color: Colors.white,
                  ),
                  leading: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.call,
                          color: Colors.white,
                        ),
                        onPressed: () => launch("tel://100"),
                      ),
                    ],
                  ),
                  title: Text("Call Police",
                      style: TextStyle(color: Colors.white)),
                  subtitle: Text("100", style: TextStyle(color: Colors.white)),
                  onTap: () => launch("tel://100"),
                ),
                Divider(
                  height: 10.0,
                  color: Colors.black,
                ),
                ListTile(
                  tileColor: Colors.blue,
                  trailing: Icon(
                    MdiIcons.ambulance,
                    size: 50,
                    color: Colors.white,
                  ),
                  leading: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.call,
                          color: Colors.white,
                        ),
                        onPressed: () => launch("tel://102"),
                      ),
                    ],
                  ),
                  title: Text("Call Ambulance",
                      style: TextStyle(color: Colors.white)),
                  subtitle: Text("102", style: TextStyle(color: Colors.white)),
                  onTap: () => launch("tel://102"),
                ),
                Divider(
                  height: 10.0,
                  color: Colors.black,
                ),
                ListTile(
                  tileColor: Colors.orange,
                  trailing: Icon(
                    MdiIcons.fireTruck,
                    size: 50,
                    color: Colors.white,
                  ),
                  leading: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.call,
                          color: Colors.white,
                        ),
                        onPressed: () => launch("tel://101"),
                      ),
                    ],
                  ),
                  title: Text("Call Fire Brigade",
                      style: TextStyle(color: Colors.white)),
                  subtitle: Text("101", style: TextStyle(color: Colors.white)),
                  onTap: () => launch("tel://101"),
                ),
                Divider(
                  height: 10.0,
                  color: Colors.black,
                ),
                ListTile(
                  tileColor: Colors.green,
                  trailing: Icon(
                    MdiIcons.train,
                    size: 50,
                    color: Colors.white,
                  ),
                  leading: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.call,
                          color: Colors.white,
                        ),
                        onPressed: () => launch("tel://139"),
                      ),
                    ],
                  ),
                  title: Text("Call Railway Enquiry",
                      style: TextStyle(color: Colors.white)),
                  subtitle: Text("139", style: TextStyle(color: Colors.white)),
                  onTap: () => launch("tel://139"),
                ),
                Divider(
                  height: 10.0,
                  color: Colors.black,
                ),
                ListTile(
                  tileColor: Colors.purple[300],
                  trailing: Icon(
                    MdiIcons.faceWoman,
                    size: 50,
                    color: Colors.white,
                  ),
                  leading: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.call,
                          color: Colors.white,
                        ),
                        onPressed: () => launch("tel://1091"),
                      ),
                    ],
                  ),
                  title: Text("Call Women Helpline",
                      style: TextStyle(color: Colors.white)),
                  subtitle: Text("1091", style: TextStyle(color: Colors.white)),
                  onTap: () => launch("tel://1091"),
                ),
                Divider(
                  height: 10.0,
                  color: Colors.black,
                ),
              ],
            ),
          )
        ]));
  }

  void checkuser(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      emghome = prefs.getString("userEmgHome");
      emgFrnd = prefs.getString("userEmgFrnd");
    });
  }
}
