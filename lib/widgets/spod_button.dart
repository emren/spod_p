import '../themes/themes.dart';
import 'package:flutter/material.dart';

class SpodButton extends StatelessWidget {

  final String etiket;
  final MaterialPageRoute route;


  SpodButton(this.etiket, this.route);

  @override
  Widget build(BuildContext context) {
    String _etiket;
    MaterialPageRoute _route;
    _etiket = etiket;
    _route = route;

    return SizedBox(
      width: 250,
      height: 40,

      child: RaisedButton(
        elevation: 10,
        color: Colors.black26,
        onPressed: () {
          print(_etiket);
          Navigator.push(context, _route );
        },
        child: Text(

          _etiket, style: spodButtonStyle,
        ),
      ),
    );
  }
}
