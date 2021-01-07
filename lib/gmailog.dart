import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Gmailog extends StatefulWidget {
  @override
  _GmailogState createState() => _GmailogState();
}

class _GmailogState extends State<Gmailog> {
  @override
  Widget build(BuildContext context) {

    GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
    final FirebaseAuth _auth = FirebaseAuth.instance;
    FirebaseUser _user;
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Logged in'),
        backgroundColor: Colors.blueAccent,
      ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SvgPicture.asset("images/welcome.svg",
                 height: size.height * 0.45,
                ),
//                Image.network(googleSignIn.currentUser.photoUrl,
//                  height: 50,
//                  width: 50
//                ),
//                Text(googleSignIn.currentUser.displayName),

               MaterialButton( child: Text("Logout"),
                  elevation: 0,
                  minWidth: 320,
                  height: 50,

                  color: Colors.deepPurple,
                  textColor: Colors.white,
                  onPressed: (){
                    googleSignIn.signOut();
                    Navigator.push(context,MaterialPageRoute(builder: (context) => MyHomePage()));
                  },
                ),
              ],
            )
          )
    );
  }
}
