import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_2/main.dart';
import 'package:flutter_application_2/models/Apiservices.dart';
import 'package:flutter_application_2/models/FeedbackModel.dart';

import 'package:shared_preferences/shared_preferences.dart';
//import 'package:url_launcher/url_launcher.dart';
//import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Arun extends StatefulWidget {
  @override
  _ArunState createState() => _ArunState();
}

class _ArunState extends State<Arun> {
  TextEditingController mycontName = TextEditingController();
  TextEditingController mycontMob = TextEditingController();
  TextEditingController mycontEmail = TextEditingController();
  TextEditingController mycontFeedback = TextEditingController();
  bool feedback = false;

  @override
  void initState() {
    checkuser(context);
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(),
        body: SingleChildScrollView(
          child: Form(
              key: _formKey,
              child: new Column(
                children: <Widget>[
                  new ListTile(
                    leading: const Icon(Icons.person),
                    title: new TextFormField(
                      controller: mycontName,
                      decoration: new InputDecoration(
                        hintText: "Your Name",
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter Name';
                        }
                        return null;
                      },
                    ),
                  ),
                  new ListTile(
                    leading: const Icon(Icons.phone),
                    title: new TextFormField(
                      controller: mycontMob,
                      decoration: new InputDecoration(
                        hintText: "Your Mobile Number",
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter Mobile';
                        }
                        return null;
                      },
                    ),
                  ),
                  new ListTile(
                    leading: const Icon(Icons.email),
                    title: new TextFormField(
                      controller: mycontEmail,
                      decoration: new InputDecoration(
                        hintText: "Your Email Id",
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter Email';
                        }
                        return null;
                      },
                    ),
                  ),
                  const Divider(
                    height: 1.0,
                  ),
                  new ListTile(
                    leading: const Icon(Icons.message_outlined),
                    title: new TextFormField(
                      controller: mycontFeedback,
                      keyboardType: TextInputType.multiline,
                      maxLines: 5,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        hintText: 'Enter Feedbak',
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter feedback';
                        }
                        return null;
                      },
                    ),
                  ),
                  const Divider(
                    height: 1.0,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 20, left: 0, right: 0),
                    child: ElevatedButton.icon(
                      onPressed: () async {
                        if (_formKey.currentState.validate() == false) {
                          setState(() {});
                          return;
                        }

                        Feedbackmod users = new Feedbackmod(
                            requestby: mycontName.text,
                            requestMob: mycontMob.text,
                            requestEmail: mycontEmail.text,
                            remarks: mycontFeedback.text);

                        var res = await APIServices.postFeedback(users)
                            .whenComplete(() => null);
                        if (res == 200) {
                          await showdg(
                              context, "Success", "Feedback Submitted");

                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()));
                        }
                      },
                      label: Text('Submit Feedback'),
                      icon: Icon(Icons.save_alt_outlined),
                    ),
                  )
                ],
              )),
        ));
  }

  void checkuser(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    mycontName.text = prefs.getString("username");
    mycontMob.text = prefs.getString("usermobile");
    mycontEmail.text = prefs.getString("useremail");
  }
}
