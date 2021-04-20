import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/AppStateNotifier.dart';
import 'package:provider/provider.dart';
import 'loginscreen.dart';
import 'main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateNotifier>(builder: (context, appState, child) {
      return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Splash(),
          themeMode: appState.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          darkTheme: ThemeData(
            backgroundColor: Colors.grey[300],
            brightness: Brightness.dark,
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith(
                        (states) => Colors.grey))),
          ),
          /* darkTheme: ThemeData(
            primaryColor: Colors.black,
            backgroundColor: Colors.black,
            indicatorColor: Color(0xff0E1D36),
            buttonColor: Color(0xff3B3B3B),
          ), */
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.grey[300],
            // Define the default brightness and colors.

            iconTheme: IconThemeData(color: Colors.teal),

            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith(
                        (states) => Colors.teal))),
            primaryColor: Colors.teal[400],
            accentColor: Colors.grey,
            accentColorBrightness: Brightness.dark,
            applyElevationOverlayColor: true,

            // Define the default font family.
            fontFamily: 'Arial',

            // Define the default TextTheme. Use this to specify the default
            // text styling for headlines, titles, bodies of text, and more.
            textTheme: TextTheme(
              headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
              headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
              bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
            ),
          ));
    });
  }
}

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  bool _initialized = false;
  bool _error = false;

  // Define an async function to initialize FlutterFire
  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
    Timer(Duration(seconds: 5), () => checkuser(context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            //color: Color.fromARGB(230, 30, 38, 80),
            color: Colors.teal[300],
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  // color: Colors.transparent,
                  child: Image.asset(
                    "assets/mlogo1.png",
                    width: 150,
                  ),
                ),
                Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      "HelpTheNeedy",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    )),
                Container(
                    margin: const EdgeInsets.only(top: 40.0, bottom: 25.0),
                    //  color: Colors.transparent,
                    child: new CircularProgressIndicator(
                      backgroundColor: Colors.pinkAccent,
                    )),
                Text(
                  "Please wait..Loading....",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Image.asset(
                      "assets/niclogo.png",
                      width: 150,
                    )),
                Padding(padding: EdgeInsets.only(top: 10)),
                Text(
                  "Designed & Developed by NIC Kurukshetra",
                  style: TextStyle(color: Colors.white),
                )
              ],
            ))));
  }

  void checkuser(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    String uid = prefs.getString("username");
    if (uid != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Loginpage()),
      );
    }
  }
}
