import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback _onPressed;

  LoginButton({Key key, VoidCallback onPressed})
    : _onPressed = onPressed,
    super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      height: 45,
          child: RaisedButton(
        color: Color(0xFFE63946),
        elevation: 0,
        onPressed: _onPressed,
        child: Text('Iniciar sesion',style: TextStyle(
          color: Colors.white
        ),),
      ),
    );
  }
}