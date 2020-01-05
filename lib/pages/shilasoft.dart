import '../themes/themes.dart';
import 'package:flutter/material.dart';

class ShilaSoft extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              'assets/ayi_oyuncak.jpeg',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Align(
              alignment: Alignment(-0.8, -0.2),
              child: Column(
                children: <Widget>[
                  Padding(padding: EdgeInsets.all(50),),
                  Container(
                    width: 100,
                    height: 100,
                    //color: Colors.red,
                    child: Image.asset('assets/logo.png', fit: BoxFit.fill, ),
                  ),
                  Padding(padding: EdgeInsets.all(10.0),),
                  Text('ShilaSoft Yazılım', style: spodButtonStyle,),
                  //Text('ebru@shilasoft.com'),
                  //Text('emre@shilasoft.com'),
                  //Text('shila@shilasoft.com'),
                  Padding(padding: EdgeInsets.all(5.0),),
                  Text('shilasoft@yahoo.com', style: spodButtonStyle,),
//                    Padding(padding: EdgeInsets.all(5.0),),
//                    Text('info@shilasoft.com', style: spodButtonStyle,),
                  Padding(padding: EdgeInsets.all(5.0),),
                  Text('www.shilasoft.com', style: spodButtonStyle,),
                ],
              ),
            ),
          ),
//          Positioned(
//            top: 200,
//            left: 70,
//            child: Container(
//              child: Align(
//                alignment: Alignment(-.2,.3),
//                child: Column(
//                  children: <Widget>[
//                    Padding(padding: EdgeInsets.all(50),),
//                    Container(
//                      width: 100,
//                      height: 100,
//                      //color: Colors.red,
//                      child: Image.asset('assets/logo.png', fit: BoxFit.fill, ),
//                    ),
//                    Padding(padding: EdgeInsets.all(10.0),),
//                    Text('ShilaSoft Yazılım', style: spodButtonStyle,),
//                    //Text('ebru@shilasoft.com'),
//                    //Text('emre@shilasoft.com'),
//                    //Text('shila@shilasoft.com'),
//                    Padding(padding: EdgeInsets.all(5.0),),
//                    Text('shilasoft@yahoo.com', style: spodButtonStyle,),
////                    Padding(padding: EdgeInsets.all(5.0),),
////                    Text('info@shilasoft.com', style: spodButtonStyle,),
//                    Padding(padding: EdgeInsets.all(5.0),),
//                    Text('www.shilasoft.com', style: spodButtonStyle,),
//                  ],
//                ),
//              ),
//
//            ),
//          ),

        ],

      ),

      floatingActionButton: FloatingActionButton(
        child: Text('Geri dön', style: floatingButtonStyle,textAlign: TextAlign.center,),
        onPressed: () => Navigator.pop(context),
        backgroundColor: Colors.red,
      ),

    );
  }
}