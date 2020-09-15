import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pymbo/src/bloc/authentication_bloc/bloc.dart';

class SettingsScreen extends StatefulWidget {
  final String photo;

  const SettingsScreen({Key key, this.photo}) : super(key: key);
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0XFFF1FAEE),
        body: Container(
          width: double.infinity,
          height: 200,
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                child: Image(
                  image: AssetImage('assets/img/illimani.png'),
                  fit: BoxFit.cover,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  alignment: Alignment.center,
                  width: 80,
                  height: 80,
                  child: CircularProfileAvatar(
                    '',
                    child: FlutterLogo(),
                    radius: 80,
                    borderColor: Color(0XFF1D3557),
                    borderWidth: 3,
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
