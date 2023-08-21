import 'package:flutter/material.dart';
import 'package:flutter_application_2/ui/ChildEducation.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Needy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GridView.count(
            primary: false,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            crossAxisCount: 3,
            children: <Widget>[
              MyCard(
                title: "Shelter Home",
                micon: MdiIcons.homeAlertOutline,
                age: "1",
                gender: "1",
              ),
              MyCard(
                title: "Accident",
                micon: MdiIcons.car,
                age: "1",
                gender: "1",
              ),
              MyCard(
                title: 'Child Labour',
                micon: MdiIcons.humanBabyChangingTable,
                age: "2",
                gender: "1",
                routepage: null,
              ),
              MyCard(
                title: "Child Education (Dropouts)",
                micon: MdiIcons.library,
                age: "2",
                gender: "1",
              ),
              //Injured Animal

              MyCard(
                title: "Missing Child",
                micon: MdiIcons.accountChildCircle,
                age: "2",
                gender: "1",
              ),
              MyCard(
                title: "Domestic Violence",
                micon: MdiIcons.humanFemaleFemale,
                age: "1",
                gender: "1",
              ),
              MyCard(
                title: "Runaway Child",
                micon: MdiIcons.runFast,
                age: "2",
                gender: "1",
              ),
              MyCard(
                title: "Elderly Care \n (at Home)",
                micon: MdiIcons.humanCane,
              ),
              MyCard(
                title: "Elderly Care \n (Old Age Home)",
                micon: MdiIcons.humanHandsdown,
              ),

              MyCard(
                title: "Injured Animal",
                micon: MdiIcons.dogService,
                age: "0",
                gender: "0",
              ),

              MyCard(
                title: "De Addiction",
                micon: MdiIcons.bottleWineOutline,
                age: "1",
                gender: "1",
              ),

              MyCard(
                title: "Dead Animal Pickup",
                micon: MdiIcons.cow,
                age: "0",
                gender: "0",
              ),
              MyCard(
                title: "Donate (Clothes,Food)",
                micon: MdiIcons.tshirtCrew,
                age: "0",
                gender: "0",
              ),
              MyCard(
                title: "Blood",
                micon: MdiIcons.waterAlertOutline,
                age: "1",
                gender: "1",
              ),
            ],
          ),
        ],
      ),
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
  final IconData micon;

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
                  Icon(
                    micon,
                    size: 40,
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
