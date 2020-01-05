import '../blocs/counter_bloc/bloc.dart';
import '../services/rezervasyon_servis.dart';
import '../themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Yayinlar extends StatelessWidget {


  final RezervasyonServis servis = RezervasyonServis();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.indigo,
        child:
            Center(
              child: ListTile(
                onTap: (){
                  print('web');
                  servis.openWeb('www.spod.org.tr/TR/sayfa/3/yayinlar');
                },
                title: Text('Spod yayınlara gözatın', style: rezervasyonStyle,),
                leading: Icon(Icons.web, size: 30,color: Colors.blueGrey,),
                trailing: Icon(Icons.arrow_forward_ios, size:  30, color: Colors.blueGrey,),
              ),
            ),

      ),
      floatingActionButton: FloatingActionButton(
        child: Text('Geri dön', style: floatingButtonStyle,textAlign: TextAlign.center,),
        onPressed: () => Navigator.pop(context),
        backgroundColor: Colors.indigoAccent,
      ),
    );
  }
}
