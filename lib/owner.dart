import 'package:flutter/material.dart';

class Owner extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("About You"),
          backgroundColor: Colors.black,
        ),

        body: new Container(
            color: Colors.black,
            child: new Column(
              children: <Widget>[
                new Container(
                  margin: EdgeInsets.only(top: 20,bottom: 10,left: 100,right: 100),
                    width: 250.0,
                    height: 190.0,
                    decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                            fit: BoxFit.fill,
                            image:  ExactAssetImage('images/mrbean.jpg')
                        )
                    )),
                new Text("Mr.Bean", textScaleFactor: 1.5,style: TextStyle(color: Colors.white),),
                Padding(
                  padding: EdgeInsets.only(right: 20,left: 20,top: 15),
                  child: Text("Mr. Bean is a British sitcom created by Rowan Atkinson and Richard Curtis, produced by Tiger Aspect and starring Atkinson as the title character. The sitcom consisted of 15 episodes that were co-written by Atkinson alongside Curtis and Robin Driscoll; for the pilot, it was co-written by Ben Elton. The series was originally broadcast on ITV, beginning with the pilot on 1 January 1990[1] and ending with The Best Bits of Mr. Beanon 15 December 1995.",style: TextStyle(color: Colors.grey),textAlign: TextAlign.justify,softWrap: true,),
                ),
                  ],
            ),
        )
    );
  }
}
