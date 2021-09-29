import 'package:flutter/material.dart';

class Ajuda extends StatelessWidget {
  const Ajuda({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About"),
        backgroundColor: Colors.orange,
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: const Text("This app has the porpouse for listing the Countries and its abbreviations.")
      ),
    );
  }
}