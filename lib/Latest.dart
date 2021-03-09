import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/ViewRequest.dart';
import 'package:path/path.dart';

String _id;

class Latest extends StatefulWidget {
  @override
  _LatestState createState() => _LatestState();
}

class _LatestState extends State<Latest> {
  final fs = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: new StreamBuilder<QuerySnapshot>(
      stream: fs.collection("data").snapshots(),
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
                      tileColor: Colors.white10,
                      leading: CircleAvatar(
                        radius: 30.0,
                        backgroundImage: NetworkImage(
                            (ds["imageurl"]) != null ? ds["imageurl"] : ""),
                        backgroundColor: Colors.transparent,
                      ),
                      title: Text("Category :" + ds["Category"]),
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
    ));
  }
}
