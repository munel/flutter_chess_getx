import 'dart:math';

import 'package:flutter_chess/satranc/controller/gideceklerdenElemeYap.dart';
import 'package:flutter_chess/satranc/controller/satranccontroller.dart';
import 'package:flutter_chess/satranc/controller/taslaringidebilecegiyerler.dart';



bool rockKontrolleri(String renk,List<Point> kontrolEdilecekNoktalar, List<SatrancTaslari> taslar){
  List<SatrancTaslari> kontrolEdilecekTaslar = [];
  String r = renk == 's' ? 'b' : 's';

  taslar.forEach((element) {
    if(element.renk==r){
      kontrolEdilecekTaslar.add(element);
    }
  });

  List<Point> tehditEdilenYerler = [];

  kontrolEdilecekTaslar.forEach((element) {
    tehditEdilenYerler.addAll(gidebilecegiYerler(element, taslar));
  });

  bool tehditAltindfa = false;

  kontrolEdilecekNoktalar.forEach((element) {
    if(tehditEdilenYerler.contains(element)){
      tehditAltindfa = true;
    }
  });

  return tehditAltindfa;


}


List<Point> gidebilecegiYerler(SatrancTaslari s, List<SatrancTaslari> taslar) {
  List<Point> gidilecekYerler;
  GideceklerdenElemeYap gideceklerdenElemeYap = GideceklerdenElemeYap();
  TaslarinGidebilecegiYerler taslarinGidebilecegiYerler = TaslarinGidebilecegiYerler();
  if (s.tas == "p") {
    gidilecekYerler = taslarinGidebilecegiYerler
        .piyonunGidebilecegiYerler(s,taslar);
    gidilecekYerler = gideceklerdenElemeYap.aradakiTaslariEle(gidilecekYerler,taslar);
    gidilecekYerler = gideceklerdenElemeYap.kendiTaslarimiEle(gidilecekYerler,taslar,s.renk);

  }
  else if(s.tas=='a'){
    gidilecekYerler = taslarinGidebilecegiYerler
        .atinGidebilecegiYerler(s);
    gidilecekYerler = gideceklerdenElemeYap.kendiTaslarimiEle(gidilecekYerler,taslar,s.renk);

  }
  else if(s.tas == 'k'){
    gidilecekYerler = taslarinGidebilecegiYerler
        .kaleninGidebilecegiYerler(s);

    gidilecekYerler = gideceklerdenElemeYap.aradakiTaslariEle(gidilecekYerler,taslar);
    gidilecekYerler = gideceklerdenElemeYap.kendiTaslarimiEle(gidilecekYerler,taslar,s.renk);


  }
  else if(s.tas == 'f'){
    gidilecekYerler = taslarinGidebilecegiYerler
        .filinGidebilecegiYerler(s);
    gidilecekYerler = gideceklerdenElemeYap.aradakiTaslariEle(gidilecekYerler,taslar);
    gidilecekYerler = gideceklerdenElemeYap.kendiTaslarimiEle(gidilecekYerler,taslar,s.renk);

  }
  else if(s.tas == 'ş'){
    gidilecekYerler = taslarinGidebilecegiYerler
        .sahinGidebilecegiYerler(s,false,false);
    gidilecekYerler = gideceklerdenElemeYap.aradakiTaslariEle(gidilecekYerler,taslar);
    gidilecekYerler = gideceklerdenElemeYap.kendiTaslarimiEle(gidilecekYerler,taslar,s.renk);

  }
  else if(s.tas == 'v'){
    gidilecekYerler = taslarinGidebilecegiYerler
        .vezirinGidebilecegiYerler(s);
    gidilecekYerler = gideceklerdenElemeYap.aradakiTaslariEle(gidilecekYerler,taslar);
    gidilecekYerler = gideceklerdenElemeYap.kendiTaslarimiEle(gidilecekYerler,taslar,s.renk);

  }
  return gidilecekYerler;
}


