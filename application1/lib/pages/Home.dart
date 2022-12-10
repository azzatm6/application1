import 'package:application1/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}
Widget buildLogoutBtn(context){
  return Container(
    alignment: Alignment.center,
    child:
    ElevatedButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context){
          return Login();
        }));
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.white),

        padding: MaterialStateProperty.all(
            EdgeInsets.symmetric(horizontal: 50, vertical: 10)),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25))),
      ),

      child: Text(
        'Logout',
        style: TextStyle(
          color: Colors.blue[900],
          fontSize: 30,
          fontWeight: FontWeight.bold,

        ),
      ),
    ),
  );

}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.lightBlue,

      body: AnnotatedRegion<SystemUiOverlayStyle>(

        value: SystemUiOverlayStyle.light,

        child: GestureDetector(
          child: Stack(

            children: <Widget>[

              Image.asset('assets/images/logo.png'),


              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0x6668BBE3),
                          Color(0x9968BBE3),
                          Color(0xcc68BBE3),
                          Color(0xff68BBE3),
                        ]
                    )
                ),
                child: SingleChildScrollView(

                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 120
                  ),

                  child: Column(

                    children: <Widget>[
                      SizedBox(height: 160),
                      Text(
                        'Welcome to our Home Page',

                        style: TextStyle(

                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 200),
                      buildLogoutBtn(context),

                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );

  }
}

