import 'package:chat_app/app/app.locator.dart';
import 'package:chat_app/app/app.router.dart';
//import 'package:chat_app/views/DashBoard.dart';
//import 'package:chat_app/views/theme.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

void main() async {
  await setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        //theme: MyTheme.lightTheme,
        //darkTheme: MyTheme.darkTheme,
        debugShowCheckedModeBanner: false,
        title: 'Chat App',
        navigatorKey: StackedService.navigatorKey,
        onGenerateRoute: StackedRouter().onGenerateRoute);
  }
}
