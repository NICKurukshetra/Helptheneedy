import 'package:flutter/material.dart';

class PressRelease extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[50],
        appBar: AppBar(
          title: Text("Press Release"),
        ),
        body: ListView(
          padding: EdgeInsets.only(top: 10, left: 10, right: 10),
          children: [
            Column(children: [
              Card(
                elevation: 10,
                child: Image.asset(
                  'assets/PR1.jpeg',
                  //fit: BoxFit.cover,
                  //alignment: Alignment.center,
                ),
              ),
              Card(
                elevation: 10,
                child: Image.asset(
                  'assets/PR2.jpeg',
                  //fit: BoxFit.cover,
                  //alignment: Alignment.center,
                ),
              ),
            ])
          ],
        ));
  }
}
