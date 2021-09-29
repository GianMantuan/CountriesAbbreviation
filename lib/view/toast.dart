import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

mixin ToastMessage {
  void showToast(String message, {Toast? toastLength, ToastGravity? gravity}) {
    Fluttertoast.showToast(
      msg: message, 
      toastLength: toastLength ?? Toast.LENGTH_LONG, 
      gravity: gravity ?? ToastGravity.BOTTOM, 
      backgroundColor: Colors.orangeAccent[200], 
      textColor: Colors.black, 
    );
  }
}