import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/ViewRequest.dart';
import 'package:path/path.dart';

String _id;
String _value;

var _childval = [
  'ALL',
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

class Latest extends StatefulWidget {
  @override
  _LatestState createState() => _LatestState();
}

class _LatestState extends State<Latest> {
  final fs = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: Column(children: [
          Row(
            children: [
              Expanded(
                  child: Padding(
                      padding: EdgeInsets.only(
                          top: 20, left: 20, right: 20, bottom: 20),
                      child: InputDecorator(
                        decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                            labelText: "Select Category",
                            errorStyle: TextStyle(
                                color: Colors.redAccent, fontSize: 12.0),
                            hintText: 'Please select',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                              autofocus: true,
                              isDense: true,
                              onChanged: (String newValue) {
                                setState(() {
                                  _value = newValue;
                                });
                              },
                              value: _value,
                              items: _childval.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: new Text(value),
                                );
                              }).toList()),
                        ),
                      ))),
            ],
          ),
          Expanded(
              child: StreamBuilder<QuerySnapshot>(
            stream: _value != "ALL"
                ? fs
                    .collection("data")
                    .where('Category', isEqualTo: _value)
                    .snapshots()
                : fs.collection("data").snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return CircularProgressIndicator();
              } else {
                return ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snapshot.data.docs[index];

                    return Card(
                        child: ListTile(
                            enableFeedback: true,
                            leading: CircleAvatar(
                              radius: 40.0,
                              backgroundImage: NetworkImage(
                                  (ds["imageurl"]) != null
                                      ? ds["imageurl"]
                                      : ""),
                              backgroundColor: Colors.transparent,
                            ),
                            title: Text(
                              "Category :" + ds["Category"],
                              style: TextStyle(fontSize: 18),
                            ),
                            subtitle: Text("Remarks: " + ds["Remarks"]),
                            onTap: () {
                              if (ds.reference.id != null) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ViewRequest(ds.reference.id)),
                                );
                              }
                            }));
                  },
                );
              }
            },
          )),
        ]));
  }
}
