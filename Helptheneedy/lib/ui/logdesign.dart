import 'package:flutter/material.dart';
import 'package:flutter_application_2/ui/profile.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class TestCheck extends StatefulWidget {
  @override
  _TestCheckState createState() => _TestCheckState();
}

class _TestCheckState extends State<TestCheck> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.teal[200]),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.width,
              width: MediaQuery.of(context).size.width,
              child: Card(
                elevation: 10,
                margin: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Container(
                      width: 400,
                      height: 50,
                      margin: const EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 80.0),
                      child: SignInButton(Buttons.GoogleDark, onPressed: () {}),
                    ),
                    Divider(
                      height: 25,
                    ),
                    Container(
                        width: 400,
                        height: 50,
                        margin: const EdgeInsets.only(
                            left: 15.0, right: 15.0, top: 10.0),
                        child:
                            SignInButton(Buttons.Facebook, onPressed: () {})),
                  ],
                ),
              ),
            ),
          ],
        )
      ]),
    );
  }
}
