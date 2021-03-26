import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

String _id;

class NgoAction extends StatefulWidget {
  NgoAction(String id) {
    _id = id;
  }
  @override
  _NgoActionState createState() => _NgoActionState();
}

class _NgoActionState extends State<NgoAction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("NGO Action"),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('data')
              .doc(_id)
              .collection("NGOAction")
              .snapshots(),
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
                    title: Text("NGO Name :" + ds["NGO"]),
                    subtitle: Text("Action : " + ds["NGOAction"]),
                  ));
                },
              );
            }
          },
        ));
  }
}
