import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class Associates extends StatelessWidget {
  @override
  // ignore: override_on_non_overriding_member
  void launchemergency({
    @required int phone,
    @required String message,
  }) async {
    String url() {
      return "https://wa.me/$phone::/?text=${Uri.parse(message)}";
    }

    if (await canLaunch(url())) {
      await launch(url());
    } else {
      throw 'Could not launch ${url()}';
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Card(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            Divider(
              color: Colors.grey,
            ),
            ExpansionTile(
              leading: Icon(
                Icons.home,
                size: 50,
              ),
              title: Text("Shelter Home"),
              children: <Widget>[
                Divider(
                  color: Colors.grey,
                ),
                ListTile(
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.call,
                          color: Colors.blue[900],
                        ),
                        onPressed: () => launch("tel://9355332211"),
                      ),
                    ],
                  ),
                  title: Text("Shree Sanatan Vidyapeeth Trust"),
                  //subtitle: Text("Donate Blood"),
                ),
                Divider(
                  color: Colors.grey,
                ),
                ListTile(
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.call,
                          color: Colors.blue[900],
                        ),
                        onPressed: () => launch("tel://9812089840"),
                      ),
                    ],
                  ),
                  title: Text("Midway House"),
                  // subtitle: Text("Donate Cloths, Footwear, Bag etc"),
                ),
                Divider(
                  color: Colors.grey,
                ),
                ListTile(
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.call,
                          color: Colors.blue[900],
                        ),
                        onPressed: () => launch("tel://9416730940"),
                      ),
                    ],
                  ),
                  title: Text("Prarna Vridha Ashram"),
                  //    subtitle: Text("For Children"),
                ),
                Divider(
                  color: Colors.grey,
                ),
                ListTile(
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.call,
                          color: Colors.blue[900],
                        ),
                        onPressed: () => launch("tel://8818000024"),
                      ),
                    ],
                  ),
                  title: Text("Haryana Navyugkala Sangam Vridha Ashram"),
                  //subtitle: Text("Human Rights"),
                  onTap: () {},
                  /* onTap: () {
                        Navigator.pop(context);
                      },*/
                ),
                Divider(
                  color: Colors.grey,
                ),
                ListTile(
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.call,
                          color: Colors.blue[900],
                        ),
                        onPressed: () => launch("tel://9416734007"),
                      ),
                    ],
                  ),
                  title: Text("Baba Bansi Wala Vridha Ashram"),
                  //subtitle: Text("Human Rights"),
                  onTap: () {},
                  /* onTap: () {
                        Navigator.pop(context);
                      },*/
                ),
                Divider(
                  color: Colors.grey,
                ),
                ListTile(
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.call,
                          color: Colors.blue[900],
                        ),
                        onPressed: () => launch("tel://9896042142"),
                      ),
                    ],
                  ),
                  title: Text(
                      "Dainik Vridha Dekhbhal kendra mook avam badhir school "),
                  //subtitle: Text("Human Rights"),
                  onTap: () {},
                  /* onTap: () {
                        Navigator.pop(context);
                      },*/
                ),
              ],
            ),
            Divider(
              color: Colors.grey,
            ),
            ExpansionTile(
              leading: Icon(
                MdiIcons.humanChild,
                size: 50,
              ),
              title: Text("Labour/Missing Child"),
              children: <Widget>[
                Divider(
                  color: Colors.grey,
                ),
                ListTile(
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.call,
                          color: Colors.blue[900],
                        ),
                        onPressed: () => launch("tel://8053130007"),
                      ),
                    ],
                  ),
                  title: Text("Jiwan Me Vishwas Bal Ashram, Ladwa"),
                  //subtitle: Text("Donate Blood"),
                ),
                Divider(
                  color: Colors.grey,
                ),
                ListTile(
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.call,
                          color: Colors.blue[900],
                        ),
                        onPressed: () => launch("tel://8168322245"),
                      ),
                    ],
                  ),
                  title: Text("Udayan Care, Kurykshetra"),
                  // subtitle: Text("Donate Cloths, Footwear, Bag etc"),
                ),
                Divider(
                  color: Colors.grey,
                ),
                ListTile(
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.call,
                          color: Colors.blue[900],
                        ),
                        onPressed: () => launch("tel://9518185606"),
                      ),
                    ],
                  ),
                  title: Text("Vishwas Baal Ashram Shahabad"),
                  //    subtitle: Text("For Children"),
                ),
                Divider(
                  color: Colors.grey,
                ),
                ListTile(
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.call,
                          color: Colors.blue[900],
                        ),
                        onPressed: () => launch("tel://7988881471"),
                      ),
                    ],
                  ),
                  title: Text("Open Shelter  Home, Kurukshetra"),
                  //subtitle: Text("Human Rights"),
                  onTap: () {},
                  /* onTap: () {
                        Navigator.pop(context);
                      },*/
                ),
                Divider(
                  color: Colors.grey,
                ),
                ListTile(
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.call,
                          color: Colors.blue[900],
                        ),
                        onPressed: () => launch("tel://9416700220"),
                      ),
                    ],
                  ),
                  title: Text("Vatsalya Vatika, Truest"),
                  //subtitle: Text("Human Rights"),
                  onTap: () {},
                  /* onTap: () {
                        Navigator.pop(context);
                      },*/
                ),
              ],
            ),
            Divider(
              color: Colors.grey,
            ),
            ExpansionTile(
              leading: Icon(
                Icons.water_damage,
                size: 50,
              ),
              title: Text("Blood Banks"),
              children: <Widget>[
                Divider(
                  color: Colors.grey,
                ),
                ListTile(
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.call,
                          color: Colors.blue[900],
                        ),
                        onPressed: () => launch("tel://01744220335"),
                      ),
                    ],
                  ),
                  title: Text("Red Cross Kurukshetra"),
                  //subtitle: Text("Donate Blood"),
                ),
              ],
            ),
            Divider(
              color: Colors.grey,
            ),
            ExpansionTile(
              leading: Icon(
                Icons.local_hospital_outlined,
                size: 55,
              ),
              title: Text("Accident Help Centers"),
              children: <Widget>[
                Divider(
                  color: Colors.grey,
                ),
                ListTile(
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.call,
                          color: Colors.blue[900],
                        ),
                        onPressed: () => launch("tel://"),
                      ),
                    ],
                  ),
                  title: Text(""),
                  //subtitle: Text("Donate Blood"),
                ),
              ],
            ),
            Divider(
              color: Colors.grey,
            ),
            ExpansionTile(
              leading: Icon(
                MdiIcons.bottleWineOutline,
                size: 50,
              ),
              title: Text("De Addiction Centers"),
              children: <Widget>[
                Divider(
                  color: Colors.grey,
                ),
                ListTile(
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.call,
                          color: Colors.blue[900],
                        ),
                        onPressed: () => launch("tel://"),
                      ),
                    ],
                  ),
                  title: Text(""),
                  //subtitle: Text("Donate Blood"),
                ),
              ],
            ),
            Divider(
              color: Colors.grey,
            ),
            ExpansionTile(
              leading: Icon(
                MdiIcons.library,
                size: 50,
              ),
              title: Text("Child Educations"),
              children: <Widget>[
                Divider(
                  color: Colors.grey,
                ),
                ListTile(
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.call,
                          color: Colors.blue[900],
                        ),
                        onPressed: () => launch("tel://"),
                      ),
                    ],
                  ),
                  title: Text(""),
                  //subtitle: Text("Donate Blood"),
                ),
              ],
            ),
            Divider(
              color: Colors.grey,
            ),
            ExpansionTile(
              leading: Icon(
                MdiIcons.tshirtCrew,
                size: 50,
              ),
              title: Text("Donation"),
              children: <Widget>[
                Divider(
                  color: Colors.grey,
                ),
                ListTile(
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.call,
                          color: Colors.blue[900],
                        ),
                        onPressed: () => launch("tel://"),
                      ),
                    ],
                  ),
                  title: Text(""),
                  //subtitle: Text("Donate Blood"),
                ),
              ],
            ),
            Divider(
              color: Colors.grey,
            ),
            ExpansionTile(
              leading: Icon(
                (MdiIcons.dogSide),
                //Icons.ac_unit_sharp,

                size: 50,
              ),
              title: Text("Deceased Animal Care Centers"),
              children: <Widget>[
                Divider(
                  color: Colors.grey,
                ),
                ListTile(
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.call,
                          color: Colors.blue[900],
                        ),
                        onPressed: () => launch("tel://"),
                      ),
                    ],
                  ),
                  title: Text(""),
                  //subtitle: Text("Donate Blood"),
                ),
              ],
            ),
            Divider(
              color: Colors.grey,
            ),
          ],
        ),
      )
    ]));
  }
}
