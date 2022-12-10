import 'package:flutter/material.dart';
import 'package:shrimps/view/login/login.dart';
import 'package:shrimps/viewmodel/user_service.dart';

import '../model/User.dart';
import '../view/home/home.dart';
import '../view/profile/profile.dart';
import '../viewmodel/shrimp_service.dart';

class DrawerWidget extends StatefulWidget {
  int user;
  // final UserModel user;

  DrawerWidget({Key? key, required this.user}) : super(key: key);
  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserModel>(
        future: UserService().fetchDataUser(widget.user),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return Drawer(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    _drawerHeader(
                        snapshot.data!.username, snapshot.data!.email),
                    _drawerItem(
                        icon: Icons.home,
                        text: 'Home',
                        onTap: () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Home(user: widget.user)))),
                    _drawerItem(
                        icon: Icons.person,
                        text: 'Profile',
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Profile(
                                      user: widget.user,
                                    )))),
                    _drawerItem(
                        icon: Icons.power_settings_new,
                        text: 'Log Out',
                        onTap: () => Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => Login()))),
                  ],
                ),
              );
            }
          }
        });
  }
}

Widget _drawerHeader(String name, email) {
  return UserAccountsDrawerHeader(
    decoration: BoxDecoration(
      color: Color(0xffFFA630),
    ),
    currentAccountPicture: ClipOval(
      child: Image(
          image: AssetImage("assets/images/Profile/mahfud.jpeg"),
          fit: BoxFit.cover),
    ),
    accountName: Text('$name'),
    accountEmail: Text('$email'),
  );
}

Widget _drawerItem(
    {IconData? icon, required String text, GestureTapCallback? onTap}) {
  return ListTile(
    title: Row(
      children: <Widget>[
        Icon(icon),
        Padding(
          padding: EdgeInsets.only(left: 25.0),
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
    onTap: onTap,
  );
}
