import 'package:application1/pages/Fpassword.dart';
import 'package:application1/pages/Home.dart';
import 'package:application1/pages/signup.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  void initState() {
    super.initState();
  }

  final _formkey = GlobalKey<FormState>();
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();
  @override
  void dispose() {
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    super.dispose();
  }
  var email, password;

  Widget buildEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 60,
          child: TextFormField(
            controller: _emailcontroller,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            autofocus: true,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.email,
                  color: Color(0xff145DA0),
                ),
                hintText: 'Email',
                hintStyle: TextStyle(
                  color: Colors.black38,
                )),
          ),
        )
      ],
    );
  }

  Widget buildPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 60,
          child: TextFormField(
            controller: _passwordcontroller,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            obscureText: true,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.lock,
                  color: Color(0xff145DA0),
                ),
                hintText: 'Password',
                hintStyle: TextStyle(
                  color: Colors.black38,
                )),
          ),
        )
      ],
    );
  }

  Widget buildForgetPassBtn(context) {
    return Container(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return Fpassword();
          }));
        },
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
              EdgeInsets.symmetric(horizontal: 120, vertical: 10)),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(27))),
        ),
        child: Text(
          'Forget Password',
          style: TextStyle(

            decoration: TextDecoration.underline,
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget buildLoginBtn(context) {
    return Container(
      alignment: Alignment.center,
      child: ElevatedButton(
        onPressed: () async {
          try {
            if (_formkey.currentState!.validate()) {
              UserCredential userCredential = await FirebaseAuth.instance
                  .signInWithEmailAndPassword(
                      email: _emailcontroller.text,
                      password: _passwordcontroller.text);
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return Home();
              }));
            }
          } on FirebaseAuthException catch (e) {
            if (e.code == 'user-not-found') {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('No user found for this email')),
              );
            } else if (e.code == 'wrong-password') {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Wrong Password')),
              );
            }
          }
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white),
          padding: MaterialStateProperty.all(
              EdgeInsets.symmetric(horizontal: 50, vertical: 10)),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(27))),
        ),
        child: Text(
          'Login',
          style: TextStyle(
            color: Colors.blue[900],
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
  Widget buildJoinUsBtn(context) {
  return  Row(
      mainAxisAlignment: MainAxisAlignment.center,  children: [
      Text("Don’t have an account ?? ",
          style: TextStyle (
            color: Colors.white,
              fontSize: 16,
          )),
      GestureDetector(
        onTap: (){
          Navigator.pushNamed(context, "/signup");
          },
          child: Text(
            " Sign-up",
            style:TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.bold),
          )),  ],);
  }
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
                      Color(0x6668BB),
                      Color(0x9968BB),
                      Color(0xcc68BBE3),
                      Color(0xff68BBE3),
                    ])),
                child: Form(
                  key: _formkey,
                  child: SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    padding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 100),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 170),
                        Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        buildEmail(),
                        SizedBox(height: 10),
                        buildPassword(),
                        SizedBox(height: 20),
                        buildLoginBtn(context),
                        SizedBox(height: 15),
                        buildJoinUsBtn(context),
                        buildForgetPassBtn(context),
                      ],
                    ),
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
