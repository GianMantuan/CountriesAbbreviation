import 'package:flutter/material.dart';
import 'package:sigla_pais_app/service/country_request.dart';

class CountriesData extends StatefulWidget {
  final String country;
  const CountriesData({ Key? key, this.country = "" }) : super(key: key);

  @override
  _PaisesDadosState createState() => _PaisesDadosState();
}

class _PaisesDadosState extends State<CountriesData> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder(
          future: CountryRequest.exec(), 
          builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
            if (snapshot.hasData) {
              List countries =  snapshot.data as List<dynamic>;
              return _listCountries(_filterCountries(widget.country, countries, context));
            } else {
              return Container(
                alignment: Alignment.center,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Loading . . .", style: TextStyle(fontSize: 16.0))
                )
              );
            }
          }
        )
      ],
    );
  }

  Widget _listCountries(List countries) {
    return Flexible(
      child: ListView.builder(
        itemCount: countries.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(
                "${countries[index]["name"]}",
                style: const TextStyle(
                  color: Colors.orangeAccent, 
                  fontWeight: FontWeight.bold, 
                  fontSize: 20.0
                ),
              ),
              subtitle: Text(
                "${countries[index]["code"] ?? "--"}",
                style: const TextStyle(
                  color: Colors.grey, 
                  fontWeight: FontWeight.bold, 
                  fontSize: 16.0
                )
              ),
            ),
          );
        }
      )
    );
  }

  List _filterCountries(String country, List countries, BuildContext context) {
    List filter = [];
    String formattedCountry = "";

    if(country != "") {
      String firstLetter = country.substring(0,1);
      formattedCountry = country.replaceFirst(firstLetter, firstLetter.toUpperCase());
    }

    for (var co in countries) {
      if(co["name"] == formattedCountry) {
        filter.add(co);
      }
    }

    return filter.isEmpty ? countries : filter;
  }
}