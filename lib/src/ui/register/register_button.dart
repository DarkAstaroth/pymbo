import 'package:flutter/material.dart';

class RegisterButton extends StatelessWidget {
  final VoidCallback _onPressed;

  RegisterButton({Key key, VoidCallback onPressed})
    : _onPressed = onPressed,
    super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      height: 45,
          child: RaisedButton(
            color: Color(0xFFE93946),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0)
        ),
        onPressed: _onPressed,
        child: Text('Registrarse',style: TextStyle(
          color: Colors.white
        ),),
      ),
    );
  }
}