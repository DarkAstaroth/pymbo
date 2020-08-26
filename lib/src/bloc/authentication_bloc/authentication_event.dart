import 'package:equatable/equatable.dart';
import 'package:pymbo/src/bloc/authentication_bloc/bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

//tres eventos:

//App Started
//Logged In
//Logged Out

class AppStarted extends AuthenticationEvent {}
class LoggedIn extends AuthenticationEvent {}
class LoggedOut extends AuthenticationEvent {}
