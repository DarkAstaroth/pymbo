import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pymbo/src/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:pymbo/src/bloc/authentication_bloc/authentication_state.dart';
import 'package:pymbo/src/ui/setting/setting_header.dart';
import 'package:pymbo/src/ui/setting/setting_options.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        if (state is Authenticated) {
          return Scaffold(
              backgroundColor: Color(0XFFF1FAEE),
              body: Column(
                children: [
                  SettingHeader(
                    userPhoto: state.userPhoto,
                    displayname: state.displayName,
                    email: state.email,
                  ),
                  SettingOptions()
                ],
              ));
        }
        if (state is UnAuthenticated) {}
        return Container();
      },
    );
  }
}
