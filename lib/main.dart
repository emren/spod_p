import 'package:spod_app/pages/anasayfa2.dart';
import 'package:spod_app/pages/messagehandler.dart';

import './pages/anasayfa.dart';
import './pages/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './blocs/authentication_bloc/bloc.dart';
import './models/user_repository.dart';
import './pages/splash_screen.dart';
import './blocs/simple_bloc_delegate.dart';
import 'blocs/counter_bloc/counter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  BlocSupervisor.delegate = SimpleBlocDelegate();
  final UserRepository userRepository = UserRepository();
  runApp(
    BlocProvider(
      builder: (context) =>
      AuthenticationBloc(userRepository: userRepository)..add(AppStarted()),
      child: BlocProvider(
          builder: (context) => CounterBloc(),
          child: App(userRepository: userRepository)),
    ),
  );
}

class App extends StatelessWidget {
  final UserRepository _userRepository;

  App({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is Unauthenticated) {
            return LoginScreen(userRepository: _userRepository);
          }
          if (state is Authenticated) {
            //return AnaSayfa2(name: state.displayName);
            return MessageHandler(name: state.displayName);
          }
          return SplashScreen();
        },
      ),
    );
  }
}
