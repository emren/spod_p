import '../blocs/counter_bloc/bloc.dart';
import '../themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Puan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBloc, int>(
      //bloc: BlocProvider.of<CounterBloc>(context),
        builder: (context, count) {
          return Scaffold(
            body: Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    'assets/beer_background.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 100,
                  left: 20,
                  child: Container(
                    width: 250,
                    height: 250,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(200),
                    ),
                    //child: Center(child: musteri.getIsLogged ? Text(musteri.getRezervasyonPuan.toString(), style: puanStyle,) : Text('0', style: puanStyle,),),
                    child: Center(child: Text('$count', style: puanStyle,)),
                  ),
                ),
              ],
            ),
            floatingActionButton: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.0),
                  child: FloatingActionButton(
                    heroTag: 'add',
                    child: Icon(Icons.add),
                    onPressed: () => BlocProvider.of<CounterBloc>(context)
                        .add(CounterEvent.increment),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.0),
                  child: FloatingActionButton(
                    heroTag: 'remove',
                    child: Icon(Icons.remove),
                    onPressed: () => BlocProvider.of<CounterBloc>(context)
                        .add(CounterEvent.decrement),
                  ),
                ),
                FloatingActionButton(
                  heroTag: 'geri',
                  child: Text(
                    'Geri dön',
                    style: floatingButtonStyle,
                    textAlign: TextAlign.center,
                  ),
                  onPressed: () => Navigator.pop(context),
                  backgroundColor: Colors.red,
                ),
              ],
            ),
          );
        });
  }
}
