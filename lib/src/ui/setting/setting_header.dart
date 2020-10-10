import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';

class SettingHeader extends StatelessWidget {

  final String userPhoto;
  final String displayname;
  final String email;

  const SettingHeader({Key key, this.userPhoto, this.displayname, this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: 80,
                          height: 80,
                          child: CircularProfileAvatar(
                            userPhoto,
                            // child: FlutterLogo(),
                            radius: 80,
                            borderColor: Color(0XFF1D3557),
                            borderWidth: 3,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          displayname,
                          style: TextStyle(fontFamily: 'GilroyB'),
                        ),
                        Text(
                          email,
                          style: TextStyle(fontFamily: 'GilroyL'),
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
  }
}