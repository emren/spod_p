import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:spod_app/pages/aidat.dart';
import 'package:spod_app/pages/danisma_hatti.dart';
import 'package:spod_app/pages/haberler.dart';
import 'package:spod_app/pages/iletisim.dart';
import 'package:spod_app/pages/magaza.dart';
import 'package:spod_app/pages/yayinlar.dart';
import 'package:spod_app/themes/themes.dart';

import '../pages/puan.dart';
import '../pages/trans_terapi.dart';
import '../pages/shilasoft.dart';
import 'package:flutter/material.dart';

class SpodDrawer2 extends StatelessWidget {

  //final Musteri musteri;

  //AyiDrawer(this.musteri);
  SpodDrawer2();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.indigo,
        child: ListView(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: DrawerHeader(
                child: Image.asset(
                  'assets/spod-logo.jpg',
                ),
              ),
            ),

            Expanded(
              flex: 8,
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: Icon(FontAwesomeIcons.headset),
                    title: Text('Danisma Hatti', style: spodButtonStyle,),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () => {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DanismaHatti()))
                    },
                  ),
                  ListTile(
                    leading: Icon(FontAwesomeIcons.transgender),
                    title: Text('Trans Terapi grubu', style: spodButtonStyle,),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () => {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => TransTerapi()))
                    },
                  ),
                  ListTile(
                    leading: Icon(FontAwesomeIcons.phoneAlt),
                    title: Text('Bizle iletisime gecin', style: spodButtonStyle,),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () => {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Iletisim()))
                    },
                  ),
                  ListTile(
                    leading: Icon(FontAwesomeIcons.glasses),
                    title: Text('Haberler', style: spodButtonStyle,),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () => {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Haberler()))
                    },
                  ),
                  ListTile(
                    leading: Icon(FontAwesomeIcons.leanpub),
                    title: Text('Yayinlar', style: spodButtonStyle,),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () => {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Yayinlar()))
                    },
                  ),
                  ListTile(
                    leading: Icon(FontAwesomeIcons.store),
                    title: Text('Magaza', style: spodButtonStyle,),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () => {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Magaza()))
                    },
                  ),
                  ListTile(
                    leading: Icon(FontAwesomeIcons.handHoldingHeart),
                    title: Text('Aidat', style: spodButtonStyle,),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () => {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Aidat()))
                    },
                  ),
                  ListTile(
                    //leading: Icon(Icons.pets),
                    leading: Icon(FontAwesomeIcons.dog),
                    title: Text('Hakkımızda', style: spodButtonStyle,),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () => {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ShilaSoft()))
                    },
                  ),
                ],
              ),
            ),


          ],
        ),
      ),
    );
  }
}
