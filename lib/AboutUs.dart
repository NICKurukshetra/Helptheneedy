import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
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
                      margin: EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Center(
                            child: Text(
                              '        With a little official help, we step up to help needy. We, District Administration Kurukshetra & NIC, Kurukshetra by forming a group of Government Organizations (Red Cross, Bal Samitis, DSWO, DWO etc), NGOs and volunteers tried to develop/setup a system that may be used to help the Needy. It is real fact that whenever most of us see some one in grave situation wants to help him, but due to shortage of time or not known to us to whom we should inform, mostly we prefer to skip from the site."It doesn'
                              't  matter, whatever may be the personality of a person, situation may arise when help may be needed by any. Donating groceries may help needy. Here by Needy we mean to someone (person or animal) who needs immediate attention/care. in most situation, it is important to send the information about needy to the agencies working in this field. Volunteering  time and skills can help the needy. The application creates awareness among the people for helping the needy can get more and more individuals join the drive. We pledge towards helping the needy because even the smallest efforts count. Lets join hands and use technology to save the needy.',
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
