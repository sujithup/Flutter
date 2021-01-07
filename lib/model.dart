import 'package:flutter/material.dart';

class Model extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Model"),
        backgroundColor: Colors.black,
      ),

      body: new Container(
        //padding: EdgeInsets.only(top:500),
      //  color: Colors.black,
        width: double.infinity,
        height: 750,
        //child: Text("JetBot",style: TextStyle(fontSize: 30,color: Color.fromRGBO(245, 233, 249,60),decoration:TextDecoration.none),textAlign: TextAlign.center,),padding: EdgeInsets.only(top: 40),
        decoration: new BoxDecoration(
          color: Colors.black,
          // gradient: RadialGradient(
          // //  colors: [Color.fromRGBO(79, 79, 79, 30), Colors.black],
          //   center: Alignment(0, -0.5),
          //   radius: 0.56,
          //
          // ),
          image: new DecorationImage(
            image: ExactAssetImage('images/jetson.png'),
            alignment: Alignment.topCenter,
            fit: BoxFit.scaleDown,
          ),
        ),
         child: new Column(
            children: <Widget>[
              Padding(
                child:  new Text("NVIDIA Jetson Nano enables the development of millions of new small, low-power AI systems. It opens new worlds of embedded IoT applications, including entry-level Network Video Recorders (NVRs), home robots, and intelligent gateways with full analytics capabilities.",style: TextStyle(color: Colors.grey),textAlign: TextAlign.justify,softWrap: true,
                  ),
                padding: EdgeInsets.only(top: 350,left: 30,right: 30),
              ),
        ],
      ),
      ),
    );
  }
}