import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

var url = 'https://www.google.com/maps/search/near+me/';

class Nearby extends StatefulWidget {
  @override
  _NearbyState createState() => _NearbyState();
}

class _NearbyState extends State<Nearby> {
  TextEditingController controller = TextEditingController();
  //TextEditingController controller1 = TextEditingController();
  FlutterWebviewPlugin flutterWebviewPlugin = FlutterWebviewPlugin();
  @override
  void initState() {
    super.initState();
    flutterWebviewPlugin.onStateChanged.listen((WebViewStateChanged wvs) {});
  }

  searchURLDHARAMSHALA() {
    setState(() {
      url = 'https://www.google.com/maps/search/dharamshala+near+me/';
      flutterWebviewPlugin.reloadUrl(url);
      controller.text = url;
    });
  }

  searchURLHospital() {
    setState(() {
      url = 'https://www.google.com/maps/search/hospital+near+me/';
      flutterWebviewPlugin.reloadUrl(url);
      controller.text = url;
    });
  }

  searchURLPetrol() {
    setState(() {
      url = "https://www.google.com/maps/search/petrol+pump+near+me/";
      flutterWebviewPlugin.reloadUrl(url);
      controller.text = url;
    });
  }

  searchURLRailwaystn() {
    setState(() {
      url = "https://www.google.com/maps/search/railway+station+near+me/";
      flutterWebviewPlugin.reloadUrl(url);
      controller.text = url;
    });
  }

  searchURLforeignexchange() {
    setState(() {
      url = "https://www.google.com/maps/search/foreign+exchange+near+me/";
      flutterWebviewPlugin.reloadUrl(url);
      controller.text = url;
    });
  }

  searchURLAtm() {
    setState(() {
      url = "https://www.google.com/maps/search/atm+near+me/";
      flutterWebviewPlugin.reloadUrl(url);
      controller.text = url;
    });
  }

  searchURLRESTAURANTS() {
    setState(() {
      url = "https://www.google.com/maps/search/restaurants+near+me/";
      flutterWebviewPlugin.reloadUrl(url);
      controller.text = url;
    });
  }

  searchURLPolice() {
    setState(() {
      url = "https://www.google.com/maps/search/police+station+near+me/";
      flutterWebviewPlugin.reloadUrl(url);
      controller.text = url;
    });
  }

  searchURLPostOffice() {
    setState(() {
      url = 'https://www.google.com/maps/search/post+office+near+me/';
      flutterWebviewPlugin.reloadUrl(url);
      controller.text = url;
    });
  }

  searchURLRepairing() {
    setState(() {
      url = 'https://www.google.com/maps/search/repair+shop+near+me/';
      flutterWebviewPlugin.reloadUrl(url);
      controller.text = url;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Near by me"),
        ),
        body: SingleChildScrollView(
            child: Column(children: <Widget>[
          Container(
            //padding: EdgeInsets.only(top: 5),
            height: MediaQuery.of(context).size.width * 0.75,
            //color: Colors.red,
            child: WebviewScaffold(
              url: url,
              withZoom: true,
              hidden: true,
            ),
          ),
          Divider(
            color: Colors.blue,
          ),
          Container(
            child: GridView.count(
                shrinkWrap: true,
                primary: true,
                padding: EdgeInsets.fromLTRB(5, 5, 10, 10),
                crossAxisCount: 4,
                children: <Widget>[
                  RaisedButton(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Icon(
                        Icons.home_filled,
                        color: Colors.blue,
                      ),
                      onPressed: searchURLDHARAMSHALA),
                  RaisedButton(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Icon(
                        Icons.medical_services,
                        color: Colors.blue,
                      ),
                      onPressed: searchURLHospital),
                  RaisedButton(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Icon(
                        Icons.local_gas_station,
                        color: Colors.blue,
                      ),
                      onPressed: searchURLPetrol),
                  RaisedButton(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Icon(
                        Icons.local_police,
                        color: Colors.blue,
                      ),
                      onPressed: searchURLPolice),
                  RaisedButton(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Icon(
                        Icons.railway_alert,
                        color: Colors.blue,
                      ),
                      onPressed: searchURLRailwaystn),
                  RaisedButton(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Icon(
                        Icons.attach_money_outlined,
                        color: Colors.blue,
                      ),
                      onPressed: searchURLforeignexchange),
                  RaisedButton(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Icon(
                        Icons.atm_outlined,
                        color: Colors.blue,
                      ),
                      onPressed: searchURLAtm),
                  RaisedButton(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Icon(
                        Icons.car_repair,
                        color: Colors.blue,
                      ),
                      onPressed: searchURLRepairing),
                  RaisedButton(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Icon(
                        Icons.restaurant,
                        color: Colors.blue,
                      ),
                      onPressed: searchURLRESTAURANTS),
                  RaisedButton(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Icon(
                        Icons.local_post_office_rounded,
                        color: Colors.blue,
                      ),
                      onPressed: searchURLPostOffice),
                ]),
          )
        ])));
  }
}
