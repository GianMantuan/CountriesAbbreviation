import 'package:flutter/material.dart';
import 'package:sigla_pais_app/view/countries_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Countries Abbreviations',
      home: CountriesScreen(),
    );
  }
}