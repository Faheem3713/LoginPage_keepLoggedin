import 'package:flutter/material.dart';
import 'package:loger/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:ui';

class MyCard extends StatefulWidget {
  const MyCard({Key? key}) : super(key: key);

  @override
  _MyCardState createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  String email = "";

  Future getEmail() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      email = preferences.getString('email')!;
    });
  }

  @override
  void initState() {
    super.initState();
    getEmail();
  }

  Future logOut(BuildContext context) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove('email');

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => Login(),
      ),
      result: (_) => false,
    );
  }

  @deprecated
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.teal,
          body: Column(
            children: [
              Container(
                height: 150,
              ),
              CircleAvatar(
                backgroundImage: AssetImage('images/me.jpg'),
                radius: 50,
              ),
              Text(
                'Faheem Khasim',
                style: TextStyle(
                    fontSize: 27, fontFamily: 'Pacifico', color: Colors.white),
              ),
              Text(
                'FLUTTER DEVELOPER',
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.white70,
                    fontFamily: 'Sans',
                    letterSpacing: 2,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 29,
                width: 210,
                child: Divider(
                  color: Colors.teal[300],
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: Row(
                  children: [
                    Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 10)),
                    Icon(
                      Icons.home,
                      color: Colors.teal[800],
                    ),
                    SizedBox(
                      width: 14,
                    ),
                    Text(
                      'Mattool,Kannur',
                      style: TextStyle(
                          letterSpacing: 2,
                          color: Colors.teal[800],
                          fontWeight: FontWeight.bold,
                          fontFamily: 'sans',
                          fontSize: 16),
                    ),
                  ],
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: Row(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    ),
                    Icon(
                      Icons.phone_android_rounded,
                      color: Colors.teal[800],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '+91 9895 713 713',
                      style: TextStyle(
                          letterSpacing: 2,
                          color: Colors.teal[800],
                          fontWeight: FontWeight.bold,
                          fontFamily: 'sans',
                          fontSize: 16),
                    )
                  ],
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: Row(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    ),
                    Icon(
                      Icons.email,
                      color: Colors.teal[800],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'faheem3713@gmail.com',
                      style: TextStyle(
                          letterSpacing: 2,
                          color: Colors.teal[800],
                          fontWeight: FontWeight.bold,
                          fontFamily: 'sans',
                          fontSize: 16),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: RaisedButton(
                  color: Colors.white,
                  child: Text(
                    'Logout',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                  onPressed: () {
                    logOut(context);
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
