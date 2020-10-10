import 'package:flutter/material.dart';
import 'package:pymbo/src/ui/setting/setting_header.dart';
import 'package:pymbo/src/ui/setting/setting_options.dart';

class SettingsScreen extends StatefulWidget {
  final String userPhoto;
  final String displayname;
  final String email;

  const SettingsScreen({Key key, this.userPhoto, this.displayname, this.email})
      : super(key: key);
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0XFFF1FAEE),
        body: Column(
          children: [
            SettingHeader(
              userPhoto: widget.userPhoto,
              displayname: widget.displayname,
              email: widget.email,
            ),
            SettingOptions()
          ],
        ));
  }


}
