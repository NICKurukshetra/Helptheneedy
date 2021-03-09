import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
// ignore: unused_import

String _id;

class ViewRequest extends StatefulWidget {
  ViewRequest(String id) {
    _id = id;
  }

  @override
  _State createState() => _State();
}

class _State extends State<ViewRequest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('View Request'),
        ),
        body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('data')
                .doc(_id) //ID OF DOCUMENT
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return new CircularProgressIndicator();
              }
              var document = snapshot.data;
              return Padding(
                padding: EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Type text Here",
                      style: TextStyle(fontSize: 20.0),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      //mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 0.0, top: 5.0),
                        ),
                        CircleAvatar(
                          radius: 30.0,
                          backgroundImage: NetworkImage(document["imageurl"]),
                          backgroundColor: Colors.transparent,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 6.0, top: 50.0),
                        ),
                      ],
                    ),
                    Container(
                      child: Row(
                        children: [
                          Padding(padding: EdgeInsets.only(left: 5.0)),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              RaisedButton(
                                //color: Colors.brown,
                                onPressed: () {},
                                //=> _selectDate(context),
                                child: Text(
                                  'Types of Help',
                                  style: TextStyle(
                                      //color: Colors.white,
                                      //fontWeight: FontWeight.bold,
                                      ),
                                ),
                                padding: EdgeInsets.only(
                                    left: 10, right: 10, bottom: 5.0, top: 5.0),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 15.0),
                              ),
                              Text(
                                  'List of NGO From data Base'), //currentDate.toString()),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Padding(padding: EdgeInsets.only(left: 5.0)),
                          new RaisedButton(
                              padding: EdgeInsets.only(left: 36, right: 36),
                              child: const Text('Place'),
                              onPressed: () {}),
                          Padding(padding: EdgeInsets.only(left: 5.0)),
                        ],
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 10.0)),
                    Container(
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          //Padding(padding: EdgeInsets.only(left: 0.0)),
                          MaterialButton(
                            onPressed: () {},
                            color: Colors.green[100],
                            textColor: Colors.black,
                            child: Text("Accept"),
                            padding: EdgeInsets.all(25),
                            minWidth: 50,
                            shape: CircleBorder(),
                          ),
                          MaterialButton(
                            onPressed: () {},
                            color: Colors.red[100],
                            textColor: Colors.black,
                            child: Text("Deny"),
                            padding: EdgeInsets.all(25),
                            minWidth: 50,
                            shape: CircleBorder(),
                          ),
                          MaterialButton(
                            onPressed: () {},
                            color: Colors.yellow[100],
                            textColor: Colors.black,
                            child: Text("Hold"),
                            padding: EdgeInsets.all(25),
                            minWidth: 50,
                            shape: CircleBorder(),
                          ),
                          MaterialButton(
                            onPressed: () {},
                            color: Colors.pink[100],
                            textColor: Colors.black,
                            child: Text("Action"),
                            padding: EdgeInsets.all(25),
                            minWidth: 50,
                            shape: CircleBorder(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }));
  }
}
