import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/Apiservices.dart';
import 'package:flutter_application_2/models/Data.dart';
import 'package:flutter_application_2/ui/ViewRequest.dart';
import 'package:shared_preferences/shared_preferences.dart';

String _value;

List<String> _childval = [];

class Latest extends StatefulWidget {
  @override
  _LatestState createState() => _LatestState();
}

class _LatestState extends State<Latest> {
  var needy = <NeedyData>[];

  @override
  void initState() {
    super.initState();
    getCat();
    _getNeedys();
  }

  Future<void> getCat() async {
    final prefs = await SharedPreferences.getInstance();
    var v = prefs.getString("usertype");
    if (v == "NGO") {
      _childval.clear();
      
     var l= prefs.getStringList("cat");
      setState(() {
        _childval = (prefs.getStringList("cat"));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Row(
        children: [
          Expanded(
              child: Padding(
                  padding:
                      EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
                  child: InputDecorator(
                    decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        labelText: "Select Category",
                        errorStyle:
                            TextStyle(color: Colors.redAccent, fontSize: 12.0),
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
                              _LatestState().build(context);
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
          child: FutureBuilder<List<NeedyData>>(
        future: _value == ("ALL") || _value == null
            ? _getNeedys()
            : _getCatNeedys(_value),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? snapshot.data.length != 0
                  ? ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return Card(
                            elevation: 8,
                            child: ListTile(
                                enableFeedback: true,
                                leading: CircleAvatar(
                                  radius: 20.0,
                                  child: snapshot.data[index].mediatype == 'I'
                                      ? ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          child: Image.network(
                                            snapshot.data[index].imgurl,
                                          ))
                                      : Icon((Icons.play_circle_fill_rounded)),
                                  backgroundColor: Colors.white38,
                                ),
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      snapshot.data[index].category,
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.teal),
                                    ),
                                    Text(
                                      "Date : " +
                                          snapshot.data[index].dated.toString(),
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.teal),
                                    ),
                                  ],
                                ),
                                subtitle: Wrap(children: <Widget>[
                                  Text(
                                    "Remarks: " + snapshot.data[index].remarks,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 3,
                                  )
                                ]),
                                onTap: () {
                                  if (snapshot.data[index].id != null) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ViewRequest(
                                              snapshot.data[index].id
                                                  .toString(),
                                              snapshot.data[index].remarks,
                                              snapshot.data[index].age,
                                              snapshot.data[index].category,
                                              snapshot.data[index].dated
                                                  .toString(),
                                              snapshot.data[index].imgurl,
                                              snapshot.data[index].lat,
                                              snapshot.data[index].longit,
                                              snapshot.data[index].sex,
                                              snapshot.data[index].status,
                                              snapshot.data[index].mediatype),
                                        ));
                                  }
                                }));
                      })
                  : Center(child: Text("No Record"))
              : Center(child: CircularProgressIndicator());
        },
      )),
    ]));
  }
}

List<NeedyData> parseData(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<NeedyData>((json) => NeedyData.fromJson(json)).toList();
}

Future<List<NeedyData>> _getNeedys() async {
  try {
    {
      final response = await APIServices.fetchNeedyData();
      //Iterable list = json.decode(response.body);
      //needy = list.map((model) => NeedyData.fromJson(model)).toList();
      return compute(parseData, response.body);
    }
  } catch (e) {}
}

Future<List<NeedyData>> _getCatNeedys(String cat) async {
  try {
    {
      final response = await APIServices.fetchNeedyDataCat(cat);
      //Iterable list = json.decode(response.body);
      //needy = list.map((model) => NeedyData.fromJson(model)).toList();
      return compute(parseData, response.body);
    }
  } catch (e) {}
}
