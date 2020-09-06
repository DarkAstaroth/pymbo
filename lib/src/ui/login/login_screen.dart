//imports: 
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pymbo/src/bloc/login_bloc/bloc.dart';
import 'package:pymbo/src/repository/user_repository.dart';
import 'package:pymbo/src/ui/login/login_form.dart';

class LoginScreen extends StatelessWidget {
  final UserRepository _userRepository;

  LoginScreen({Key key, @required UserRepository userRepository})
    : assert(userRepository != null),
    _userRepository = userRepository,
    super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1FAEE),
      appBar: AppBar(
        title: Text(
          'Bienvenido',
          style: TextStyle(
            color: Color(0xFF1D3557)
          ),
          ),
        elevation: 0,
        backgroundColor: Color(0xFFF1FAEE),
        ),
      body: BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(userRepository: _userRepository),
        child: LoginForm(userRepository: _userRepository),
      ),
    );
  }
}