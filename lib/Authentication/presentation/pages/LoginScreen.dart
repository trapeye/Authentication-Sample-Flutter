import 'package:authentication_sample/Authentication/presentation/manager/AuthenticationProvider.dart';
import 'package:authentication_sample/Authentication/presentation/widgets/ButtonLogin.dart';
import 'package:authentication_sample/Authentication/presentation/widgets/TextFieldLogin.dart';
import 'package:authentication_sample/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = '/LoginScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 3,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 4.0, vertical: 15.0),
                child: Consumer<AuthenticationProvider>(
                  builder: (context, data, child) {
                    return Column(
                      children: [
                        TextFieldLogin.userName(
                          onChanged: data.changeUserName,
                          validation: data.isUserNameValid,
                          errorText: data.errorTextUserName,
                          textEditingController: data.controllerUserName,
                        ),
                        TextFieldLogin.password(
                          onChanged: data.changePassword,
                          validation: data.isPasswordValid,
                          errorText: data.errorTextPassword,
                          textEditingController: data.controllerPassword,
                        ),
                      ],
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: ButtonLogin(
                  onPressed: () async {
                    bool canLogin = await Provider.of<AuthenticationProvider>(
                      context,
                      listen: false,
                    ).login;
                    if (canLogin) {
                      Navigator.pushReplacementNamed(
                          context, HomeScreen.routeName);
                    } else {}
                  },
                  name: 'Log in',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
