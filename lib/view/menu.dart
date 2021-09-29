import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sigla_pais_app/view/about.dart';
import 'package:sigla_pais_app/view/countries_screen.dart';
import 'package:sigla_pais_app/view/toast.dart';

class Menu extends StatelessWidget with ToastMessage {
  Menu({ Key? key }) : super(key: key);

  final TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: [
            Container(
              alignment: Alignment.center,
              color: Colors.orange,
              height: 50.0,
              child: const Text("Menu", style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w400                
                )
              )
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.search),
              title: const Text("Search"),
              onTap: () {
                Navigator.pop(context);
                showDialog(
                  context: context,
                  builder: (BuildContext context) => 
                    SimpleDialog(
                      title: const Text("Search for a country name"),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: TextField(
                            controller: search,
                          )
                        ),
                        Row(
                          children: [
                            TextButton(
                              child: const Text(
                                "Cancel", 
                                style: TextStyle(color: Colors.black)
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                                showToast("Search cancelled");
                              },
                            ),
                            TextButton(
                              child: const Text("Find", 
                                style: TextStyle(
                                  color: Colors.orange
                                )
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (BuildContext context) => 
                                    CountriesScreen(country: search.text)
                                ));
                                showToast("Results for the country ${search.text}");
                              }

                            )
                          ],
                          mainAxisAlignment: MainAxisAlignment.end,
                        )
                      ],
                    )
                );
              }
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.question),
              title: const Text("About"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, 
                  MaterialPageRoute(builder: (BuildContext context) => 
                    const Ajuda()
                  )
                );
              },
            ),
          ],
        )
      )
    );
  }
}