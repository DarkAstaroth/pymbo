import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pymbo/src/bloc/register_bloc/bloc.dart';
import 'package:pymbo/src/bloc/authentication_bloc/bloc.dart';
import 'package:pymbo/src/ui/register/register_button.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  // Dos variables
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  RegisterBloc _registerBloc;

  bool get isPopulated =>
      _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty;

  bool isRegisterButtonEnabled(RegisterState state) {
    return state.isFormValid && isPopulated && !state.isSubmitting;
  }

  @override
  void initState() {
    super.initState();
    _registerBloc = BlocProvider.of<RegisterBloc>(context);
    _emailController.addListener(_onEmailChanged);
    _passwordController.addListener(_onPasswordChanged);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterBloc, RegisterState>(
        listener: (context, state) {
      // Si estado es submitting
      if (state.isSubmitting) {
        Scaffold.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Registering'),
                CircularProgressIndicator()
              ],
            ),
          ));
      }
      // Si estado es success
      if (state.isSuccess) {
        BlocProvider.of<AuthenticationBloc>(context).add(LoggedIn());
        Navigator.of(context).pop();
      }
      // Si estado es failure
      if (state.isFailure) {
        Scaffold.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Registration Failure'),
                Icon(Icons.error)
              ],
            ),
            backgroundColor: Colors.red,
          ));
      }
    }, child: BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.all(20),
          child: Form(
            child: ListView(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Column(
                    children: <Widget>[
                      Text('Crear una cuenta',
                          style: TextStyle(
                            fontFamily: 'GilroyB',
                            fontSize: 30,
                            color: Color(0xFF1D3557)
                          ),
                        ),
                        Text('Completa todos los campos',
                        style: TextStyle(
                          fontFamily: 'GilroyL'
                        ))
                    ],
                  ),
                ),
                // Un textForm para email
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(20),
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
                              color: Color(0xFF1D3557), fontFamily: 'GilroyB'),
                          suffixIcon:
                              Icon(Icons.email, color: Color(0xFF1D3557)),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        autocorrect: false,
                        autovalidate: true,
                        validator: (_) {
                          return !state.isEmailValid ? 'Invalid Email' : null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      // Un textForm para password
                      TextFormField(
                        style: TextStyle(
                            fontFamily: 'GilroyL'
                          ),
                        controller: _passwordController,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFF1D3557), width: 2.0)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          labelText: 'Constraseña',
                          labelStyle: TextStyle(
                              color: Color(0xFF1D3557), fontFamily: 'GilroyB'),
                          suffixIcon:
                              Icon(Icons.lock, color: Color(0xFF1D3557)),
                        ),
                        obscureText: true,
                        autocorrect: false,
                        autovalidate: true,
                        validator: (_) {
                          return !state.isPasswordValid
                              ? 'Invalid Password'
                              : null;
                        },
                      ),
                    ],
                  ),
                ),
                // Un button
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 20),
                  child: RegisterButton(
                    onPressed: isRegisterButtonEnabled(state)
                        ? _onFormSubmitted
                        : null,
                  ),
                )
              ],
            ),
          ),
        );
      },
    ));
  }

  void _onEmailChanged() {
    _registerBloc.add(EmailChanged(email: _emailController.text));
  }

  void _onPasswordChanged() {
    _registerBloc.add(PasswordChanged(password: _passwordController.text));
  }

  void _onFormSubmitted() {
    _registerBloc.add(Submitted(
        email: _emailController.text, password: _passwordController.text));
  }
}
