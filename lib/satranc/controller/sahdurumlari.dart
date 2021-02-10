import 'dart:math';

import 'package:flutter_chess/satranc/controller/gideceklerdenElemeYap.dart';
import 'package:flutter_chess/satranc/controller/satranccontroller.dart';
import 'package:flutter_chess/satranc/controller/taslaringidebilecegiyerler.dart';


class SahDurumlari {
  TaslarinGidebilecegiYerler taslarinGidebilecegiYerler = TaslarinGidebilecegiYerler();
  GideceklerdenElemeYap gideceklerdenElemeYap = GideceklerdenElemeYap();
  List<Point> gidilecekYerler = [];
  List<Point> tumGidilecekYerler = [];



  bool sahCekildiMi(String renk, List<SatrancTaslari> taslar) {
    tumGidilecekYerler = [];
    gidilecekYerler = [];
    Point sahinYeri;
    taslar.forEach((element) {
      if(element.renk==renk && element.tas=='ş'){
        sahinYeri = element.p;
      }
      if(element.renk!=renk){
        tumGidilecekYerler.addAll(gidebilecegiYerler(element, taslar));
      }
    });
    if(tumGidilecekYerler.contains(sahinYeri)){
      return true;
    }
    return false;
  }


  bool acmazdaMi(String renk, List<SatrancTaslari> taslar) {
    tumGidilecekYerler = [];
    gidilecekYerler = [];
    Point sahinYeri;
    taslar.forEach((element) {
      if(element.renk==renk && element.tas=='ş'){
        sahinYeri = element.p;
      }
      if(element.renk!=renk){
        tumGidilecekYerler.addAll(gidebilecegiYerler(element, taslar));
      }
    });

    if(tumGidilecekYerler.contains(sahinYeri)){
      return true;
    }
    return false;
  }

  bool matMiKontrolEt(String renk,List<SatrancTaslari> taslar){
    List<SatrancTaslari> benimTaslarim = [];
    bool durum = false;
    taslar.forEach((element) {
      if(element.renk==renk){
        benimTaslarim.add(element);
      }
    });
    for(var i = 0; i<benimTaslarim.length; i++){
      durum = sahteGidisYapKontrol(renk,benimTaslarim[i],taslar);
      if(durum==false){
        return false;
      }
    }

    return true;
  }


  bool sahteGidisYapKontrol(String renk, SatrancTaslari oynayacakTas, List<SatrancTaslari> taslar){
    String r = renk == 's' ? 'b' : 's';
    List<SatrancTaslari> dummyList = List.from(taslar);
    List<Point> tasinGidebilecegiYerler = gidebilecegiYerler(oynayacakTas, taslar);
    if(tasinGidebilecegiYerler.length>1){
      for(var i = 0; i<tasinGidebilecegiYerler.length-1;i++){
        Point mevcutYer = oynayacakTas.p;
        Point gidecekYer = tasinGidebilecegiYerler[i+1];
        SatrancTaslari s;
        dummyList.forEach((element) {
          if(element.p==gidecekYer){
            s = element;
          }
        });
        if(s==null){
          oynayacakTas.p = gidecekYer;
          if(!sahCekildiMi(renk, taslar)){
            oynayacakTas.p = mevcutYer;
            return false;
          }
          else{
            oynayacakTas.p = mevcutYer;
          }

        }
        else{
          dummyList.remove(s);
          oynayacakTas.p = gidecekYer;
          if(!sahCekildiMi(renk, dummyList)){
            oynayacakTas.p = mevcutYer;
            return false;
          }
          else{
            dummyList.add(s);
            oynayacakTas.p = mevcutYer;
          }

        }
      }
    }
    return null;

  }

  List<Point> gidebilecegiYerler(SatrancTaslari s, List<SatrancTaslari> taslar) {
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
}
