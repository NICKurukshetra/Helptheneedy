import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/CatMas.dart';
import 'package:flutter_application_2/ui/ChildEducation.dart';

import '../models/Apiservices.dart';

class Needy extends StatefulWidget {
  @override
  State<Needy> createState() => _NeedyState();
}

List<CatMas> convertedJsonData;

Future<List<CatMas>> getdate() {
  var res = APIServices.fetchCat();
  return res;
}

class _NeedyState extends State<Needy> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<CatMas>>(
          future: getdate(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                primary: false,
                padding: const EdgeInsets.all(20),
                itemCount: snapshot.data.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 4.0),
                itemBuilder: (BuildContext context, int index) {
                  return MyCard(
                    title: snapshot.data[index].category,
                    micon: snapshot.data[index].icon,
                  );
                },
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}

class MyCard extends StatelessWidget {
  MyCard({
    this.title,
    this.micon,
    this.age,
    this.gender,
    this.routepage,
  });
  final String title;
  final String micon;

  final Widget routepage;
  final String age;
  final String gender;

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(5.0),
          ),
        ),
        elevation: 2,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ChildEducation(title)),
            );
          },
          child: Padding(
              padding: EdgeInsets.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    micon,
                    width: 30,
                    color: Colors.teal[500],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 0),
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width / 32),
                    ),
                  )
                ],
              )),
        ));
  }
}
