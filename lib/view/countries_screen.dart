import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sigla_pais_app/view/menu.dart';
import 'package:sigla_pais_app/view/countries_data.dart';

class CountriesScreen extends StatelessWidget {
  final String country;

  const CountriesScreen({ Key? key, this.country = ""}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Countries Abbreviations'),
        actions: [
          IconButton(
            icon: const Icon(CupertinoIcons.refresh), 
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (BuildContext context) => const CountriesScreen(country: "")
              ));
            }
          )
        ],
        backgroundColor: Colors.orange,
      ),
      body: CountriesData(country: country),
      drawer: Menu(),
    );
  }
}