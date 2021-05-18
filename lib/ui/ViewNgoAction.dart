import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/Apiservices.dart';
import 'package:flutter_application_2/models/NgoAction.dart';

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
        body: FutureBuilder<List<Ngo>>(
          future: _getNeedys(_id),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            } else {
              return snapshot.data.length != 0
                  ? ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
//                  DocumentSnapshot ds = snapshot.data.[index];

                        return Card(
                            child: ListTile(
                          tileColor: Colors.white10,
                          title: Text("NGO : " + snapshot.data[index].ngo),
                          subtitle: Text("Action : " +
                              snapshot.data[index].action +
                              'Dated ' +
                              snapshot.data[index].dated),
                        ));
                      },
                    )
                  : Center(child: Text("No Record"));
            }
          },
        ));
  }
}

List<Ngo> parseData(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Ngo>((json) => Ngo.fromJson(json)).toList();
}

Future<List<Ngo>> _getNeedys(String id) async {
  try {
    {
      final response = await APIServices.fetchNGoData(id);
      //Iterable list = json.decode(response.body);
      //needy = list.map((model) => NeedyData.fromJson(model)).toList();
      return compute(parseData, response.body);
    }
  } catch (e) {}
}
