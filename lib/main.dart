import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pymbo/src/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:pymbo/src/bloc/authentication_bloc/bloc.dart';
import 'package:pymbo/src/bloc/simple_blod_delegate.dart';
import 'package:pymbo/src/repository/user_repository.dart';
import 'package:pymbo/src/ui/home_screen.dart';
import 'package:pymbo/src/ui/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  BlocSupervisor.delegate = SimpleBlocDelegate();

  final UserRepository userRepository = UserRepository();
  
  runApp(BlocProvider(
    create: (context) =>
        AuthenticationBloc(userRepository: userRepository)..add(AppStarted()),
    child: MyApp(userRepository: userRepository),
  ));
}

class MyApp extends StatelessWidget {
  final UserRepository _userRepository;

  MyApp({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'pymbo app',
        home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
          if (state is Uninitialized) {
            return SplashScreen();
          }
          if (state is Authenticated) {
            return HomeScreen();
          }
          if (state is UnAuthenticated) {
            return Container(
              color: Colors.orange,
              child: Text('data'),
            );
          }
          return Container(
            color: Colors.red,
          );
        }));
  }
}
