import 'package:flutter/material.dart';
import 'package:flutter_chess/satranc/controller/satranccontroller.dart';
import 'package:get/get.dart';


class PiyonKarSiyaUlasir {
  SatrancController satrancController = Get.find();

  String beyazSecimleriGoster(SatrancTaslari s) {
    Get.defaultDialog(
        barrierDismissible: false,
        title: "Seçim Yapın",
        content: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {
                s.tas = "v";
                s.i = Image.asset("assets/satranc/bv.png");
                Get.back();
                satrancController.update(['taslar']);
                satrancController.harekettenSonraKontrolEt();
              },
              child: Container(
                  width: 40,
                  height: 40,
                  child: Image.asset("assets/satranc/bv.png")),
            ),
            InkWell(
              onTap: () {
                s.tas = "k";
                s.i = Image.asset("assets/satranc/bk.png");
                Get.back();
                satrancController.update(['taslar']);
                satrancController.harekettenSonraKontrolEt();
              },
              child: Container(
                  width: 40,
                  height: 40,
                  child: Image.asset("assets/satranc/bk.png")),
            ),
            InkWell(
              onTap: () {
                s.tas = "f";
                s.i = Image.asset("assets/satranc/bf.png");
                Get.back();
                satrancController.update(['taslar']);
                satrancController.harekettenSonraKontrolEt();
              },
              child: Container(
                  width: 40,
                  height: 40,
                  child: Image.asset("assets/satranc/bf.png")),
            ),
            InkWell(
              onTap: () {
                s.tas = "a";
                s.i = Image.asset("assets/satranc/ba.png");
                Get.back();
                satrancController.update(['taslar']);
                satrancController.harekettenSonraKontrolEt();
              },
              child: Container(
                  width: 40,
                  height: 40,
                  child: Image.asset("assets/satranc/ba.png")),
            ),
          ],
        ));
  }

  String siyahSecimleriGoster(SatrancTaslari s) {
    Get.defaultDialog(
        barrierDismissible: false,
        title: "Seçim Yapın",
        content: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {
                s.tas = "v";
                s.i = Image.asset("assets/satranc/sv.png");
                Get.back();
                satrancController.update(['taslar']);
                satrancController.harekettenSonraKontrolEt();
              },
              child: Container(
                  width: 40,
                  height: 40,
                  child: Image.asset("assets/satranc/sv.png")),
            ),
            InkWell(
              onTap: () {
                s.tas = "k";
                s.i = Image.asset("assets/satranc/sk.png");
                Get.back();
                satrancController.update(['taslar']);
                satrancController.harekettenSonraKontrolEt();
              },
              child: Container(
                  width: 40,
                  height: 40,
                  child: Image.asset("assets/satranc/sk.png")),
            ),
            InkWell(
              onTap: () {
                s.tas = "f";
                s.i = Image.asset("assets/satranc/sf.png");
                Get.back();
                satrancController.update(['taslar']);
                satrancController.harekettenSonraKontrolEt();
              },
              child: Container(
                  width: 40,
                  height: 40,
                  child: Image.asset("assets/satranc/sf.png")),
            ),
            InkWell(
              onTap: () {
                s.tas = "a";
                s.i = Image.asset("assets/satranc/sa.png");
                Get.back();
                satrancController.update(['taslar']);
                satrancController.harekettenSonraKontrolEt();
              },
              child: Container(
                  width: 40,
                  height: 40,
                  child: Image.asset("assets/satranc/sa.png")),
            ),
          ],
        ));
  }
}
