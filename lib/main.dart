import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:login_demo/login.dart';
import 'home.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:firebase_database/firebase_database.dart';
import 'dart:async';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    ));

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

class _MyHomePageState extends State<MyHomePage> {

  final FirebaseMessaging _messaging = FirebaseMessaging();

  @override
  void initState(){
    super.initState();

    _messaging.getToken().then((token) {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      print(token);
    });
  }

  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

//  String _password;
//  String _email;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final formKey = new GlobalKey<FormState>();

  GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black54,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(top: 55),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SvgPicture.asset(
                      "images/signup.svg",
                      height: size.height * 0.45,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 30, left: 30, right: 30),
                      child: Column(
                        children: <Widget>[
                          new Container(
                            padding: EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(227, 212, 244, 100),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: <Widget>[
                                Container(
                                    padding: EdgeInsets.all(10.0),
//                                        decoration: BoxDecoration(
//                                            border: Border(bottom: BorderSide(color: Colors.blueAccent)),
//                                          borderRadius: BorderRadius.circular(30),
//                                              ),
                                    child: TextField(
                                        controller: emailController,
                                        decoration: InputDecoration(
                                          hintText: 'Email',
                                          hintStyle: TextStyle(
                                              color: Color.fromRGBO(
                                                  4, 34, 52, 100)),
                                          icon: Icon(
                                            Icons.person,
                                            color: Colors.purple,
                                          ),
                                        ))),
                                Container(
                                  padding: EdgeInsets.all(10.0),
                                  child: TextField(
                                    controller: passwordController,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Password",
                                      hintStyle: TextStyle(
                                          color:
                                              Color.fromRGBO(4, 34, 52, 100)),
                                      icon: Icon(
                                        Icons.lock,
                                        color: Colors.purple,
                                      ),
                                    ),
                                    obscureText: true,
                                  ),
                                ),
                                MaterialButton(
                                  elevation: 0,
                                  minWidth: double.maxFinite,
                                  height: 50,
                                  color: Colors.deepPurple,
                                  onPressed: () async {
                                    try {
                                      final FirebaseUser user =
                                          (await firebaseAuth.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text)).user;
                                    }
                                    catch (e)
                                    {
                                      print(e);
                                    } finally {
                                      if (FirebaseUser != null) {
                                        print("Signed in");
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Home()));
                                      }
                                    }
                                  },
                                  //color: Color.fromRGBO(4, 34, 52, 100),
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                             //   SizedBox(height: 20),
                                MaterialButton(
                                  elevation: 0,
                                  minWidth: double.maxFinite,
                                  height: 50,
                                  onPressed: () async {
                                    try {
                                      final GoogleSignInAccount googleUser = await googleSignIn.signIn();
                                      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
                                      final credential = GoogleAuthProvider.getCredential(
                                        accessToken: googleAuth.accessToken,
                                        idToken: googleAuth.idToken,
                                      );

                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Login()));

                                      // Once signed in, return the UserCredential
                                      return await FirebaseAuth.instance.signInWithCredential(credential);

                                    } catch (err) {
                                      print(err);
                                    }
                                  },
                                  color: Colors.blue,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(
                                        FontAwesomeIcons.google,
                                        color: Colors.white,
                                      ),
                                      SizedBox(width: 10),
                                      Text('Sign-in using Google',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
