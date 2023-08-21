import 'package:flutter/material.dart';

class Disclaimer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Disclaimer'),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(5.0),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0))),
              child: InkWell(
                onTap: () => {},
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch, // add this
                  children: <Widget>[
                    Container(
                      height: 30,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50),
                          //bottomRight: Radius.circular(50),
                          //bottomLeft: Radius.circular(50),
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'About HelpTheNeedy',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 8, right: 8),
                      child: Column(
                        children: [
                          Center(
                            child: Text(
                              'Disclaimer \n'
                              'Thank you for giving us the opportunity to serve you ! We just want to clarify that our platform intends to  connect those people who want to help with those who need assistance, but the liability of any results of any help it provides shall be of the user solely. Ultimately, its your discretion regarding the decision on what advice to follow and use. We do not guarantee the accuracy or comprehensiveness of our application advice or information, or any results that may be derived from the usage thereon. We strongly recommend that you seek professional advice wherever necessary before making any decisions',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  height: 1.5),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
