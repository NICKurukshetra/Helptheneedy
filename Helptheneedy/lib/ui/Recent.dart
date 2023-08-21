import 'package:flutter/material.dart';

class Recent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[50],
        appBar: AppBar(
          title: Text("Recent Posts"),
        ),
        body: Stack(children: [
          Padding(padding: EdgeInsets.all(50)),
          Card(
            elevation: 5,
            child: Image.asset(
              'assets/Accident.jpg',
              //fit: BoxFit.cover,
              //alignment: Alignment.center,
            ),
          ),
        ]));
  }
}
