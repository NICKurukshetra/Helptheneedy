import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class Contactus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class ContactusPage extends StatefulWidget {
  @override
  _ContactusPageState createState() => _ContactusPageState();
}

class _ContactusPageState extends State {
  TextEditingController controller = TextEditingController();
  FlutterWebviewPlugin flutterWebviewPlugin = FlutterWebviewPlugin();
  var url = 'https://kurukshetra.gov.in/contact-us/#wpcf7-f1593-p1524-o1';
  //var _launchURL;

  @override
  void initState() {
    super.initState();
    flutterWebviewPlugin.onStateChanged.listen((WebViewStateChanged wvs) {});
  }

  searchURL() {
    setState(() {
      url = 'https://kurukshetra.gov.in/contact-us/#wpcf7-f1593-p1524-o1';
      flutterWebviewPlugin.reloadUrl(url);
      controller.text = url;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact Us"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 5),
            height: 600,
            color: Colors.red,
            child: WebviewScaffold(
              url: url,
              withZoom: true,
              hidden: true,
              // initialChild: Container(
              //   child:Center(child: Text("Loading"),)
              // ),
            ),
          ),
          Container(
            color: Colors.amber,
            //child: RaisedButton(child: Text("ATM"), onPressed: searchURL)
          ),
        ],
      ),
    );
  }
}
