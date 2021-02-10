import 'package:flutter/material.dart';
import 'package:flutter_chess/satranc/view/satrancmain.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Chess',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AnaSayfa(),
    );
  }
}
class AnaSayfa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          child: Text("Satranç Oyna"),
          onPressed: ()=>Get.to(SatrancMain(),fullscreenDialog: true),
        ),
      ),
    );
  }
}


