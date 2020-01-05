import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'anasayfa2.dart';




class MessageHandler extends StatefulWidget {

  final String name;
  MessageHandler({Key key, @required this.name}) : super(key: key);

  @override
  _MessageHandlerState createState() => _MessageHandlerState();
}

class _MessageHandlerState extends State<MessageHandler> {


  final Firestore _db = Firestore.instance;
  final FirebaseMessaging _fcm = FirebaseMessaging();
  StreamSubscription iosSubscription;


  @override
  void initState() {
    super.initState();
    //IOS stuff
    if (Platform.isIOS) {
      iosSubscription = _fcm.onIosSettingsRegistered.listen((data) {
        print(data);
        _saveDeviceToken();
      });
      _fcm.requestNotificationPermissions(IosNotificationSettings());
    } else {
      _saveDeviceToken();
    }
    //Configure Messaging
    _subscribeToTopic();
    _fcm.configure(
        onMessage: (Map<String, dynamic> message) async {
          print('onMessage: $message');
          showDialog(
            context: context,
            builder: (context) =>
                AlertDialog(
                  backgroundColor: Colors.pinkAccent,
                  content: ListTile(
                    title: Text(message['notification']['title'], style: TextStyle(color: Colors.white),),
                    subtitle: Text(message['notification']['body'], style: TextStyle(color: Colors.white),),
                  ),
                  actions: <Widget>[
                    FlatButton(
                      color: Colors.amber,
                      child: Text('Ok'),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
          );
        },
        onLaunch: (Map<String, dynamic> message) async {
          print('onLaunch: $message');

        },
        onResume: (Map<String, dynamic> message) async {
          print('onResume: $message');

        }
    );
  }

  @override
  void dispose() {
    if(iosSubscription != null) iosSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnaSayfa2(name: widget.name,);
    //messagehandlera pass edilen variableyi almak icin widget.name kullaniliyor
  }

  _saveDeviceToken() async {
    String uid = 'Ebru';
    //FirebaseUser user = await _auth.currentUser();
    String fcmToken = await _fcm.getToken();

    //save the token
    if(fcmToken != null){
      var tokens = _db
          .collection('users')
          .document(uid)
          .collection('tokens')
          .document(fcmToken);
      await tokens.setData({
        'token': fcmToken,
        'createdAt': FieldValue.serverTimestamp(),//optional
        'platform': Platform.operatingSystem //optional
      });
    }
  }

  _subscribeToTopic() async{
    _fcm.subscribeToTopic('spod');
  }
}

