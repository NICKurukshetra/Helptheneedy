import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/Ngo.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../models/Apiservices.dart';

Bool vis;

class Associates extends StatefulWidget {
  final bool val;
  Associates(this.val);

  @override
  State<Associates> createState() => _AssociatesState();
}

class _AssociatesState extends State<Associates> {
  @override
  // ignore: override_on_non_overriding_member

  List<String> catStringFromJson(String str) =>
      List<String>.from(json.decode(str).map((x) => x));

  String catStringToJson(List<String> data) =>
      json.encode(List<dynamic>.from(data.map((x) => x)));

  void initState() {
    // TODO: implement initState

    super.initState();
  }

  Future<List<String>> getdata() async {
    var futuredata = await APIServices.fetchNGOCat();

    return catStringFromJson(futuredata);
  }

  Future<List<NgoList>> getNGO(String cat) async {
    var futuredata = await APIServices.fetchNGOlist(cat);

    return ngoListFromJson(futuredata);
  }

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
        appBar: widget.val == true ? AppBar(title: Text("List of NGO")) : null,
        body: Card(
          child: FutureBuilder<List<String>>(
              future: getdata(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      // Important: Remove any padding from the ListView.
                      //shrinkWrap: true,
                      itemCount: snapshot.data.length,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        return Column(children: <Widget>[
                          ExpansionTile(
                            leading: Icon(
                              Icons.add_circle_outline,
                              size: 30,
                            ),
                            title: Text(snapshot.data[index]),
                            children: <Widget>[
                              Divider(
                                color: Colors.grey,
                              ),
                              FutureBuilder<List<NgoList>>(
                                  future: getNGO(snapshot.data[index]),
                                  builder: (context, snapshot1) {
                                    if (snapshot1.hasData) {
                                      return ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: snapshot1.data.length,
                                          itemBuilder: (context, index) {
                                            return ListTile(
                                              trailing: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: <Widget>[
                                                  IconButton(
                                                    icon: Icon(
                                                      Icons.call,
                                                      color: Colors.blue[900],
                                                    ),
                                                    onPressed: () =>
                                                        launchUrlString(
                                                            "tel://" +
                                                                snapshot1
                                                                    .data[index]
                                                                    .tel),
                                                  ),
                                                ],
                                              ),

                                              subtitle: snapshot1
                                                          .data[index].fbaccount
                                                          .toString()
                                                          .length >
                                                      5
                                                  ? Row(
                                                      children: [
                                                        IconButton(
                                                            onPressed: () =>
                                                                launchUrlString(
                                                                    snapshot1
                                                                        .data[
                                                                            index]
                                                                        .fbaccount),
                                                            icon: Icon(
                                                              Icons.link,
                                                              color: Colors
                                                                  .blue[900],
                                                            ))
                                                      ],
                                                    )
                                                  : null,

                                              title: Text(
                                                  snapshot1.data[index].ngo),
                                              //subtitle: Text("Donate Blood"),
                                            );
                                          });
                                    } else {
                                      return CircularProgressIndicator();
                                    }
                                  })
                            ],
                          ),
                        ]);
                      });
                } else {
                  return CircularProgressIndicator();
                }
              }),
        ));
  }
}
