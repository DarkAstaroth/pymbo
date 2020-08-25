import 'package:equatable/equatable.dart';
import 'package:pymbo/src/bloc/authentication_bloc/bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();
  @override
  List<Object> get props => [];
}

// Tres estados:
class Uninitialized extends AuthenticationState {
  @override
  String toString() => 'No inicializado';
}

class Authenticated extends AuthenticationState {
  final String displayName;
  const Authenticated(this.displayName);

  @override
  List<Object> get props => [displayName];
  @override
  String toString() => 'Autenticado -displayName:$displayName';
}

class UnAuthenticated extends AuthenticationState{
  @override
  String toString() => 'No autenticado';
}