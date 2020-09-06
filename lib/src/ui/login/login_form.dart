import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pymbo/src/bloc/login_bloc/bloc.dart';
import 'package:pymbo/src/bloc/authentication_bloc/bloc.dart';
import 'package:pymbo/src/repository/user_repository.dart';
import 'package:pymbo/src/ui/login/create_account_button.dart';
import 'package:pymbo/src/ui/login/google_login_button.dart';
import 'package:pymbo/src/ui/login/login_button.dart';

class LoginForm extends StatefulWidget {
  final UserRepository _userRepository;

  LoginForm({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginBloc _loginBloc;

  UserRepository get _userRepository => widget._userRepository;

  bool get isPopulated =>
      _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty;

  bool isLoginButtonEnabled(LoginState state) {
    return state.isFormValid && isPopulated && !state.isSubmitting;
  }

  @override
  void initState() {
    super.initState();
    _loginBloc = BlocProvider.of<LoginBloc>(context);
    _emailController.addListener(_onEmailChanged);
    _passwordController.addListener(_onPasswordChanged);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(listener: (context, state) {
      // tres casos, tres if:
      if (state.isFailure) {
        Scaffold.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(
              content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Fallo de inicio de sesión'),
                  Icon(Icons.error)
                ],
              ),
              backgroundColor: Colors.red,
            ),
          );
      }
      if (state.isSubmitting) {
        Scaffold.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Iniciando sesión...'),
                CircularProgressIndicator(),
              ],
            ),
          ));
      }
      if (state.isSuccess) {
        BlocProvider.of<AuthenticationBloc>(context).add(LoggedIn());
      }
    }, child: BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.all(20.0),
          child: Form(
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: 120,
                          padding: EdgeInsets.all(20),
                          child: Image(image: AssetImage('assets/img/user.png')),
                        ),
                        Text('Bienvenido',
                          style: TextStyle(
                            fontFamily: 'GilroyB',
                            fontSize: 30,
                            color: Color(0xFF1D3557)
                          ),
                        ),
                        Text('Inicia Sesion para continuar',
                        style: TextStyle(
                          fontFamily: 'GilroyL'
                        ))
                      ],
                    ),
                  )
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    boxShadow: [
                      new BoxShadow(
                        color: Colors.grey[300],
                        blurRadius: 10.0,
                      ),
                    ],
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 30),
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          style: TextStyle(
                            fontFamily: 'GilroyL'
                          ),
                          controller: _emailController,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xFF1D3557), width: 2.0)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                            labelText: 'Correo',
                            labelStyle: TextStyle(
                              color: Color(0xFF1D3557),
                              fontFamily: 'GilroyB'
                              ),
                            suffixIcon:
                                Icon(Icons.email, color: Color(0xFF1D3557)),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          autovalidate: true,
                          autocorrect: false,
                          validator: (_) {
                            return !state.isEmailValid
                                ? 'Email Invalido'
                                : null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: _passwordController,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xFF1D3557), width: 2.0)),
                            hoverColor: Color(0xFF1D3557),
                            fillColor: Color(0xFF1D3557),
                            focusColor: Color(0xFF1D3557),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                            labelText: 'Contraseña',
                            labelStyle: TextStyle(
                              color: Color(0xFF1D3557),
                              fontFamily: 'GilroyB'
                              ),
                            suffixIcon:
                                Icon(Icons.lock, color: Color(0xFF1D3557)),
                          ),
                          obscureText: true,
                          autovalidate: true,
                          autocorrect: false,
                          validator: (_) {
                            return !state.isPasswordValid
                                ? 'Contraseña Invalida'
                                : null;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      // Tres botones:
                      // LoginButton
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50.0, vertical: 5),
                        child: LoginButton(
                          onPressed: isLoginButtonEnabled(state)
                              ? _onFormSubmitted
                              : null,
                        ),
                      ),
                      // GoogleLoginButton
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 5),
                        child: GoogleLoginButton(),
                      ),
                      // CreateAccountButton
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: CreateAccountButton(
                          userRepository: _userRepository,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    ));
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onEmailChanged() {
    _loginBloc.add(EmailChanged(email: _emailController.text));
  }

  void _onPasswordChanged() {
    _loginBloc.add(PasswordChanged(password: _passwordController.text));
  }

  void _onFormSubmitted() {
    _loginBloc.add(LoginWithCredentialsPressed(
        email: _emailController.text, password: _passwordController.text));
  }
}
