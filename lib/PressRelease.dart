import 'package:flutter/material.dart';

class PressRelease extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[50],
        appBar: AppBar(
          title: Text("Press Release"),
        ),
        body: Stack(children: [
          Padding(padding: EdgeInsets.all(50)),
          Card(
            elevation: 5,
            child: Image.asset(
              'assets/PR1.jpeg',
              //fit: BoxFit.cover,
              //alignment: Alignment.center,
            ),
          ),
        ]));
  }
}
