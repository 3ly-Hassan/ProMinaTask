import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightTheme(context) {
  return ThemeData(
    primaryColor: const Color.fromARGB(255, 77, 182, 224),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      toolbarHeight: 0,
      backgroundColor: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: Colors.transparent),
    ),
    textTheme: TextTheme(
      headline4: Theme.of(context).textTheme.headline4!.copyWith(
          color: Colors.black, fontWeight: FontWeight.w500, fontSize: 30),
      headline5: Theme.of(context).textTheme.headline4!.copyWith(
          color: Colors.black, fontWeight: FontWeight.w500, fontSize: 24),
      bodyText1: Theme.of(context).textTheme.bodyText1!.copyWith(
          color: Theme.of(context).primaryColor,
          fontSize: 18,
          fontWeight: FontWeight.w400),
      caption: Theme.of(context).textTheme.caption!.copyWith(
          color: Theme.of(context).primaryColor, fontWeight: FontWeight.w400),
    ),
    inputDecorationTheme: InputDecorationTheme(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
        ),
        focusedBorder: UnderlineInputBorder(
            borderSide:
                BorderSide(color: Theme.of(context).primaryColor, width: 2))),
  );
}
