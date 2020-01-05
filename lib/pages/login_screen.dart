import '../blocs/login_bloc/bloc.dart';
import '../models/user_repository.dart';
import '../widgets/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  final UserRepository _userRepository;

  LoginScreen({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Spod App'), backgroundColor: Colors.indigo,),
      body: BlocProvider<LoginBloc>(
        builder: (context) => LoginBloc(userRepository: _userRepository),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/rainbow.jpg"),
          fit: BoxFit.cover,
    ),
    ),
        child: LoginForm(userRepository: _userRepository),
      ),
    ));
  }
}