import 'package:flutter/material.dart';
import 'package:messenger_app/src/blocs/auth_bloc.dart';
import 'package:messenger_app/src/components/dialog/loading_dialog.dart';
import 'package:messenger_app/src/components/theme/theme.dart';
import 'package:messenger_app/src/resouces/home_page.dart';

class MessengerInher extends InheritedWidget{
  final AuthBloc bloc;
  final Widget child;

  MessengerInher(this.bloc, this.child):super(child: child);

  static MessengerInher ? of(BuildContext context){
    return context.dependOnInheritedWidgetOfExactType(aspect: MessengerInher);
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return false;
  }

}

class MessengerApp extends StatelessWidget {
  const MessengerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       theme: lightThemeData(context),
      darkTheme: darkThemeData(context),
      // by default themeMode is themeMode.system
      themeMode: ThemeMode.system,
      home: HomePage(),
    );
  }
}
