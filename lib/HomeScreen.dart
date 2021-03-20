import 'package:authentication_sample/Authentication/presentation/manager/AuthenticationProvider.dart';
import 'package:authentication_sample/Authentication/presentation/pages/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Authentication/presentation/widgets/ButtonLogin.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/HomeScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 90.0),
        child: Center(
          child: ButtonLogin(
            onPressed: () {
              Provider.of<AuthenticationProvider>(context, listen: false)
                  .logOut;
              Navigator.pushReplacementNamed(context, LoginScreen.routeName);
            },
            name: 'Sign Out',
          ),
        ),
      ),
    );
  }
}
