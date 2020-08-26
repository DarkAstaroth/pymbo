import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:pymbo/src/bloc/authentication_bloc/authentication_event.dart';
import 'package:pymbo/src/bloc/authentication_bloc/authentication_state.dart';
import 'package:pymbo/src/repository/user_repository.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository _userRepository;
  AuthenticationBloc({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  AuthenticationState get initialState => Uninitialized();

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {
    if (event is AppStarted) {
      yield* _mapAppEventToState();
    }
    if (event is LoggedIn) {
      yield* _mapLoggedInToState();
    }
    if (event is LoggedOut) {}
  }

  Stream<AuthenticationState> _mapAppEventToState() async* {
    try {
      final isSignedIn = await _userRepository.isSignedIn();
      if (isSignedIn) {
        final user = await _userRepository.getUser();
        yield Authenticated(user);
      } else {
        yield UnAuthenticated();
      }
    } catch (_) {
      yield UnAuthenticated();
    }
  }

  Stream<AuthenticationState> _mapLoggedInToState() async* {
    yield Authenticated(await _userRepository.getUser());
  }

  Stream<AuthenticationState> _mapLoggedOutToState() async* {
    yield UnAuthenticated();
    _userRepository.signOut();
  }
}
