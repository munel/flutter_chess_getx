import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

void toastShow(String mesaj) {

  Fluttertoast.showToast(
      msg: mesaj,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Get.theme.primaryColor,
      textColor: Colors.white,
      fontSize: 16.0);
}

void toastShowKisa(String mesaj) {

  Fluttertoast.showToast(
      msg: mesaj,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Get.theme.primaryColor,
      textColor: Colors.white,
      fontSize: 16.0);
}

String adiKisalt(String metin){
  if(metin==null){
    return null;
  }
  if(metin.length<12){
    return metin;
  }
  else{
    String newMetin = metin.substring(0,11) + ".";
    return newMetin;
  }
}