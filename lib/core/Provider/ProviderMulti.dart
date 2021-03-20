import 'package:authentication_sample/Authentication/presentation/manager/AuthenticationProvider.dart';
import 'package:authentication_sample/Injection_Container.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class ProviderMulti {
  static List<SingleChildWidget> multiProviderListMain = [
    ChangeNotifierProvider<AuthenticationProvider>(
      create: (context) => sl<AuthenticationProvider>(),
    ),
  ];
}
