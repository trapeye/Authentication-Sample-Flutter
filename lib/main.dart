import 'package:authentication_sample/Injection_Container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Authentication/presentation/pages/LoginScreen.dart';
import 'core/Navigation1/routes.dart';
import 'core/Provider/ProviderMulti.dart';

void main() async {
  await init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: ProviderMulti.multiProviderListMain,
      child: MaterialApp(
        title: 'Authentication sample',
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        home: LoginScreen(),
        onGenerateRoute: Routes.onGenerateRoute,
      ),
    );
  }
}
