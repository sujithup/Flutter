import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:login_demo/model.dart';
import 'main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'owner.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:android_intent/android_intent.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
     SystemChrome.setEnabledSystemUIOverlays ([]);
    // SystemChrome.setEnabledSystemUIOverlays ([SystemUiOverlay.top]);
    //SystemChrome.setSystemUIOverlayStyle(
      //  SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    //SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
    GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
    final FirebaseAuth _auth = FirebaseAuth.instance;
    FirebaseUser _user;
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: new Column(
        children: <Widget>[
          new Container(
            //padding: EdgeInsets.only(top:500),
            width: double.infinity,
            height: 350,
            child: Text( "JetBot",
              style: TextStyle(
                  fontSize: 30,
                  color: Color.fromRGBO(245, 233, 249, 60),
                  decoration: TextDecoration.none),
              textAlign: TextAlign.center,
            ),
            padding: EdgeInsets.only(top: 40,bottom: 30),
             decoration: new BoxDecoration(
              // gradient: RadialGradient(
              //   colors: [Color.fromRGBO(79, 79, 79, 200), Colors.black],
              //   center: Alignment(0.1, 0.1),
              //   radius: 0.56,
              // ),
              image: new DecorationImage(
                image: ExactAssetImage('images/jetson.png'),
                alignment: Alignment.bottomCenter,
                fit: BoxFit.scaleDown,
              ),
            ),
          ),

          new Center(
            child: new Material(
              color: Colors.black,
              child: new Card(
                color: Colors.black,
                child: new ListTile(
                    title: Text(
                      "OWNER",
                      style: TextStyle(
                        color: Color.fromRGBO(245, 233, 249, 30),
                      ),
                    ),
                    subtitle: Text(
                      "The one who owns this device!",
                      style: TextStyle(color: Color.fromRGBO(229, 189, 255, 135)),
                    ),
                    leading: Icon(Icons.account_circle,
                        size: 50, color: Color.fromRGBO(188, 160, 220, 100)),
                    trailing: Icon(Icons.chevron_right,
                        color: Color.fromRGBO(188, 160, 220, 100)),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Owner()),
                      );
                    }),
              ),
            ),
          ),

          new Center(
            child: new Material(
              color: Colors.black,
              child: new Card(
                color: Colors.black,
                child: new ListTile(
                  title: Text(
                    "MODEL",
                    style: TextStyle(
                      color: Color.fromRGBO(245, 233, 249, 30),
                    ),
                  ),
                  subtitle: Text(
                    "Description of your model",
                    style: TextStyle(color: Color.fromRGBO(229, 189, 255, 135)),
                  ),
                  trailing: Icon(Icons.chevron_right,
                      color: Color.fromRGBO(188, 160, 220, 100)),
                  leading: Icon(Icons.android,
                      size: 50, color: Color.fromRGBO(188, 160, 220, 100)),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Model()),
                    );
                  },
                ),
              ),
            ),
          ),

          new Center(
            child: new Material(
              color: Colors.black,
              child: new Card(
                color: Colors.black,
                child: new ListTile(
                  title: Text(
                    "CONNECT",
                    style: TextStyle(
                      color: Color.fromRGBO(245, 233, 249, 30),
                    ),
                  ),
                  subtitle: Text(
                    "Connect to your jetson with bluetooth",
                    style: TextStyle(color: Color.fromRGBO(229, 189, 255, 135)),
                  ),
                  trailing: Icon(Icons.chevron_right,
                      color: Color.fromRGBO(188, 160, 220, 100)),
                  leading: Icon(Icons.bluetooth,
                      size: 50, color: Color.fromRGBO(188, 160, 220, 100)),
                  onTap: () async {
                    AndroidIntent intent = AndroidIntent(
                      action: 'android.settings.BLUETOOTH_SETTINGS',
                    );
                    await intent.launch();
                  },
                ),
              ),
            ),
          ),

          new Center(
            child: new Material(
              color: Colors.black,
              child: new Card(
                color: Colors.black,
                child: new ListTile(
                  title: Text(
                    "LOCATION",
                    style: TextStyle(color: Color.fromRGBO(245, 233, 249, 30)),
                  ),
                  subtitle: Text(
                    "Get the location of the jetson",
                    style: TextStyle(color: Color.fromRGBO(229, 189, 255, 135)),
                  ),
                  trailing: Icon(
                    Icons.chevron_right,
                    color: Color.fromRGBO(188, 160, 220, 100),
                  ),
                  leading: Icon(
                    Icons.location_on,
                    size: 50,
                    color: Color.fromRGBO(188, 160, 220, 100),
                  ),
                  onTap: () => MapsLauncher.launchCoordinates(
                      37.4220041, -122.0862462, 'Google Headquarters are here'),
                ),
              ),
            ),
          ),

          new Container(
            margin: const EdgeInsets.only(top: 15.0),
            child: MaterialButton(
              child: Text("Logout"),
              elevation: 10,
              minWidth: 100,
              height: 50,
              color: Colors.deepPurple,
              textColor: Colors.white,
              onPressed: () {
                googleSignIn.signOut();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyHomePage()));
              },
            ),
          ),
        ],
      ),
    );
  }

}
