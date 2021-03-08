import 'package:flutter/material.dart';
import 'ChildLabor.dart';
import './InjuredAnimal.dart';
import './ShelterHome.dart';
import './Blood.dart';
import './Accident.dart';

class Needy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: Stack(
        children: [
          GridView.count(
            primary: false,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children: <Widget>[
              Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                  ),
                  elevation: 5,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ChildLabor()),
                      );
                    },
                    child: Padding(
                        padding: EdgeInsets.all(5),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Icon(
                              Icons.ac_unit_sharp,
                              color: Colors.blue,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 120),
                              child: Text(
                                "Child Labour",
                                style: TextStyle(color: Colors.blueGrey[600]),
                              ),
                            )
                          ],
                        )),
                  )),
              //Injured Animal
              Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                  ),
                  elevation: 5,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => InjuredAnimal()),
                      );
                    },
                    child: Padding(
                        padding: EdgeInsets.all(5),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Icon(
                              Icons.ac_unit_sharp,
                              color: Colors.blue,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 120),
                              child: Text(
                                "Injured Animal Care",
                                style: TextStyle(color: Colors.blueGrey[600]),
                              ),
                            )
                          ],
                        )),
                  )),
              Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                  ),
                  elevation: 5,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ShelterHome()),
                      );
                    },
                    child: Padding(
                        padding: EdgeInsets.all(5),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Icon(Icons.home, color: Colors.blue),
                            Padding(
                              padding: EdgeInsets.only(top: 120),
                              child: Text(
                                "Shelter Home",
                                style: TextStyle(color: Colors.blueGrey[600]),
                              ),
                            )
                          ],
                        )),
                  )),
              Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                  ),
                  elevation: 5,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Blood()),
                      );
                    },
                    child: Padding(
                        padding: EdgeInsets.all(5),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Icon(Icons.app_blocking_rounded,
                                color: Colors.blue),
                            Padding(
                              padding: EdgeInsets.only(top: 120),
                              child: Text(
                                "Blood",
                                style: TextStyle(color: Colors.blueGrey[600]),
                              ),
                            )
                          ],
                        )),
                  )),
              Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                  ),
                  elevation: 5,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Accident()),
                      );
                    },
                    child: Padding(
                        padding: EdgeInsets.all(5),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Icon(Icons.accessible_rounded, color: Colors.blue),
                            Padding(
                              padding: EdgeInsets.only(top: 120),
                              child: Text(
                                "Accident",
                                style: TextStyle(color: Colors.blueGrey[600]),
                              ),
                            )
                          ],
                        )),
                  )),

              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15.0),
                  ),
                ),
                elevation: 5,
                child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Icon(Icons.accessibility_sharp, color: Colors.blue),
                        Padding(
                          padding: EdgeInsets.only(top: 120),
                          child: Text("Rehabilation Center",
                              style: TextStyle(color: Colors.blueGrey[600])),
                        )
                      ],
                    )),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15.0),
                  ),
                ),
                elevation: 5,
                child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Icon(Icons.cast_for_education, color: Colors.blue),
                        Padding(
                          padding: EdgeInsets.only(top: 120),
                          child: Text("Child Education",
                              style: TextStyle(color: Colors.blueGrey[600])),
                        )
                      ],
                    )),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15.0),
                  ),
                ),
                elevation: 5,
                child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Icon(Icons.euro_outlined, color: Colors.blue),
                        Padding(
                          padding: EdgeInsets.only(top: 120),
                          child: Text("Donation",
                              style: TextStyle(color: Colors.blueGrey[600])),
                        )
                      ],
                    )),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15.0),
                  ),
                ),
                elevation: 5,
                child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Icon(Icons.rice_bowl_rounded, color: Colors.blue),
                        Padding(
                          padding: EdgeInsets.only(top: 120),
                          child: Text("Deceased Animal Pickup",
                              style: TextStyle(color: Colors.blueGrey[600])),
                        )
                      ],
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
