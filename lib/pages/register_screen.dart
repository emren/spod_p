import '../blocs/register_bloc/bloc.dart';
import '../models/user_repository.dart';
import '../widgets/register_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget {
  final UserRepository _userRepository;

  RegisterScreen({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Spod App'), backgroundColor: Colors.indigo,),
      body: Center(
        child: BlocProvider<RegisterBloc>(
          builder: (context) => RegisterBloc(userRepository: _userRepository),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/rainbow.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: RegisterForm(),
          ),
          //child: RegisterForm(),
        ),
      ),
    );
  }
}