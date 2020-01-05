import '../blocs/counter_bloc/bloc.dart';
import '../services/rezervasyon_servis.dart';
import '../themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransTerapi extends StatelessWidget {

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
            Image.asset('assets/trans-hand.jpg'),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text('Trans bireylere özel terapi grubumuz her ayın ilk çarsambası toplanmaktadır. Katılmak için aşağıdaki linklerden birine başvurabilirsiniz.'
              , style: TextStyle(color: Colors.amber, fontSize: 20),),
            ),

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
              title: Text('Trans terapi grubunu arayın', style: rezervasyonStyle,),
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
              title: Text('Trans terapi grubuna sms atın', style: rezervasyonStyle,),
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
              title: Text('Trans terapi grubuna email atın', style: rezervasyonStyle,),
              leading: Icon(Icons.email, size: 30,color: Colors.blueGrey,),
              trailing: Icon(Icons.arrow_forward_ios, size:  30, color: Colors.blueGrey,),
            ),
//            ListTile(
//              onTap: (){
//                print('web');
//                servis.openWeb('www.ayipub.com.tr');
//              },
//              title: Text('Ayi websitesine gidin', style: rezervasyonStyle,),
//              leading: Icon(Icons.web, size: 30,color: Colors.blueGrey,),
//              trailing: Icon(Icons.arrow_forward_ios, size:  30, color: Colors.blueGrey,),
//            ),
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
