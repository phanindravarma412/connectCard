import 'package:flutter/material.dart';
import 'personsdata.dart';
import 'package:get_it/get_it.dart';
import 'package:url_launcher/url_launcher.dart';

class CallService {
  void call(String number) {
    launch("tel:$number");
  }

  void email(String email) {
    launch("mailto:<$email>?subject=From exponent 8 app made by Phani");
  }
}

GetIt locator = GetIt();

void set() {
  locator.registerSingleton(CallService());
}

void main() {
  set();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF334982),
          title: Text("EXPONENT 8"),
          centerTitle: true,
        ),
        body: SafeArea(
          child: BuzCard(),
        ),
      ),
    ),
  );
}

PersonsData persondata = PersonsData();

class BuzCard extends StatefulWidget {
  @override
  _BuzCardState createState() => _BuzCardState();
}

class _BuzCardState extends State<BuzCard> {
  final CallService _service = locator<CallService>();
  @override
  Widget build(BuildContext context) {
    return Column(
//      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 30, 0, 15),
          child: CircleAvatar(
            radius: 75,
            backgroundImage:
                AssetImage("images/person${persondata.personNumber}.jpg"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
          child: Text(
            '${persondata.getName()}',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
          child: Text(
            '${persondata.getJobRole()}',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
        FlatButton(
          onPressed: () => _service.call('${persondata.getPhoneNumber()}'),
          child: Card(
            color: Colors.white,
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
            child: ListTile(
              leading: Icon(
                Icons.phone,
                color: Colors.black,
              ),
              title: Text('${persondata.getPhoneNumber()}'),
            ),
          ),
        ),
        FlatButton(
          onPressed: () => _service.email('${persondata.getEmailNumber()}'),
          child: Card(
            color: Colors.white,
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
            child: ListTile(
              leading: Icon(
                Icons.mail,
                color: Colors.black,
              ),
              title: Text('${persondata.getEmailNumber()}'),
            ),
          ),
        ),
        SizedBox(
          height: 143,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            FlatButton(
              shape: CircleBorder(),
              color: Color(0xFF334982),
              onPressed: () {
                setState(() {
                  persondata.previousPerson();
                });
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(6, 8, 10, 8),
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 28,
                  color: Colors.white,
                ),
              ),
            ),
            FlatButton(
              shape: CircleBorder(),
              color: Color(0xFF334982),
              onPressed: () {
                setState(() {
                  persondata.nextPerson();
                });
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 8, 6, 8),
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 28,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
