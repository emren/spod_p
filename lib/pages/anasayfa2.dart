import 'package:spod_app/pages/danisma_hatti.dart';
import 'package:spod_app/pages/iletisim.dart';
import 'package:spod_app/pages/yayinlar.dart';
import 'package:spod_app/widgets/spod_drawer2.dart';

import '../blocs/authentication_bloc/authentication_bloc.dart';
import '../blocs/authentication_bloc/bloc.dart';
import '../blocs/counter_bloc/bloc.dart';
import '../pages/puan.dart';
import '../pages/trans_terapi.dart';
import '../pages/shilasoft.dart';
import '../themes/themes.dart';
import '../widgets/spod_button.dart';
import '../widgets/spod_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'aidat.dart';
import 'haberler.dart';
import 'magaza.dart';

class AnaSayfa2 extends StatelessWidget {
  final String name;

  AnaSayfa2({Key key, @required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text(
          'Spod App',
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              BlocProvider.of<AuthenticationBloc>(context).add(
                LoggedOut(),
              );
            },
          )
        ],
      ),
      body: Stack(children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          //color: Colors.green,
          child: Image.asset(
            'assets/background2.jpg',
            fit: BoxFit.cover,
          ),
        ),

        SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: FittedBox(
            fit: BoxFit.fitHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Center(
                    child: Text(
                      nameChecker(name),
                      //'Hoşgeldin $name',
                      style: spodButtonStyle,
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height/8,
                  width: MediaQuery.of(context).size.width /2,
                  //color: Colors.white,
                  child: Image.asset(
                    'assets/spod-logo.jpg',
                    fit: BoxFit.fill,
                  ),
                ),
                Text(
                  'Sosyal Politikalar Cinsiyet Kimliği ve Cinsel Yönelim Çalışmaları Derneği',
                  style: TextStyle(color: Colors.amber, fontSize: 10),
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SpodButton('Danışma Hattı',
                        MaterialPageRoute(builder: (context) => DanismaHatti())),
                    SizedBox(
                      height: 10,
                    ),
                    SpodButton('Trans Terapi grubu',
                        MaterialPageRoute(builder: (context) => TransTerapi())),
                    SizedBox(
                      height: 10,
                    ),
                    SpodButton('Bizle iletişime geçin',
                        MaterialPageRoute(builder: (context) => Iletisim())),
                    SizedBox(
                      height: 10,
                    ),
                    SpodButton('Haberler',
                        MaterialPageRoute(builder: (context) => Haberler())),
                    SizedBox(
                      height: 10,
                    ),
                    SpodButton('Yayınlar',
                        MaterialPageRoute(builder: (context) => Yayinlar())),
                    SizedBox(
                      height: 10,
                    ),
                    SpodButton('Mağaza',
                        MaterialPageRoute(builder: (context) => Magaza())),
                    SizedBox(
                      height: 10,
                    ),
                    SpodButton(
                        'Aidat', MaterialPageRoute(builder: (context) => Aidat())),
                    SizedBox(
                      height: 10,
                    ),
                    //AyiButton('Çıkış',MaterialPageRoute(builder: (context) => Rezervasyon())),
                    SizedBox(
                      width: 150,
                      height: 40,
                      child: RaisedButton(
                        elevation: 10,
                        color: Colors.black26,
                        onPressed: () {
                          BlocProvider.of<AuthenticationBloc>(context).add(
                            LoggedOut(),
                          );
                        },
                        child: Text(
                          'Çıkış',
                          style: spodButtonStyle,
                        ),
                      ),
                    ),
                  ],
                ),
                Material(
                  elevation: 10,
                  child: InkWell(
                    onTap: () => Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => ShilaSoft())),
                    child: Image.asset(
                      'assets/logo.png',
                      width: 50,
                      height: 50,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ]),
      drawer: SpodDrawer(),
    );
  }
}

String nameChecker(String name) {
  if (name != null) {
    return 'Hoşgeldin ' + name;
  } else
    return 'Hoşgeldin';
}
