import '../blocs/counter_bloc/bloc.dart';
import '../services/rezervasyon_servis.dart';
import '../themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Iletisim extends StatelessWidget {

//  final Musteri musteri;
//
//  Rezervasyon(this.musteri);
  final RezervasyonServis servis = RezervasyonServis();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.indigo,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/spod-logo.jpg'),
            SizedBox(
              height: 50,
            ),
            ListTile(
              onTap: (){
                print('ara');
                servis.call('05335594404');
                BlocProvider.of<CounterBloc>(context)
                    .add(CounterEvent.increment);
              },
              title: Text('Spod derneği arayın', style: rezervasyonStyle,),
              leading: Icon(Icons.call, size: 30,color: Colors.blueGrey,),
              trailing: Icon(Icons.arrow_forward_ios, size:  30, color: Colors.blueGrey,),
            ),
            ListTile(
              onTap: (){
                print('sms');
                servis.sendSms('05335594404');
                BlocProvider.of<CounterBloc>(context)
                    .add(CounterEvent.increment);
              },
              title: Text('Spod derneğe sms atın', style: rezervasyonStyle,),
              leading: Icon(Icons.sms, size: 30,color: Colors.blueGrey,),
              trailing: Icon(Icons.arrow_forward_ios, size:  30, color: Colors.blueGrey,),
            ),
            ListTile(
              onTap: (){
                print('email');
                servis.sendEmail('emzam2012@gmail.com');
                BlocProvider.of<CounterBloc>(context)
                    .add(CounterEvent.increment);
              },
              title: Text('Spod derneğe email atın', style: rezervasyonStyle,),
              leading: Icon(Icons.email, size: 30,color: Colors.blueGrey,),
              trailing: Icon(Icons.arrow_forward_ios, size:  30, color: Colors.blueGrey,),
            ),
            ListTile(
              onTap: (){
                print('web');
                servis.openWeb('www.spod.org.tr/TR/Anasayfa');
              },
              title: Text('Spod websitesine gidin', style: rezervasyonStyle,),
              leading: Icon(Icons.web, size: 30,color: Colors.blueGrey,),
              trailing: Icon(Icons.arrow_forward_ios, size:  30, color: Colors.blueGrey,),
            ),
          ],
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
