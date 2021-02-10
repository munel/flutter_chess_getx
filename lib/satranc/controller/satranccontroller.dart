import 'dart:math';

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chess/satranc/controller/gideceklerdenElemeYap.dart';
import 'package:flutter_chess/satranc/controller/piyonkarsiyaulasir.dart';
import 'package:flutter_chess/satranc/controller/rockkontrolleri.dart';
import 'package:flutter_chess/satranc/controller/sahdurumlari.dart';
import 'package:flutter_chess/satranc/controller/satranchazirla.dart';
import 'package:flutter_chess/satranc/controller/taslaringidebilecegiyerler.dart';
import 'package:flutter_chess/yardimcilar.dart';
import 'package:get/get.dart';


class SatrancController extends GetxController {
  List<SatrancTaslari> taslar = [];
  TaslarinGidebilecegiYerler taslarinGidebilecegiYerler =
      TaslarinGidebilecegiYerler();
  GideceklerdenElemeYap gideceklerdenElemeYap = GideceklerdenElemeYap();
  SahDurumlari sahDurumlari = SahDurumlari();
  List<bool> yanacakYerler = List.generate(64, (index) => false);
  Point gidecekTas;
  Point gidecegiYer;
  List<Point> gidilecekYerler = [];
  String renk = "";
  bool beyazUzunRock = true;
  bool beyazKisaRock = true;
  bool siyahUzunRock = true;
  bool siyahKisaRock = true;
  String degisen = "";
  CountDownController beyazGeriSayim = CountDownController();
  CountDownController siyahGeriSayim = CountDownController();
  int sure = 1;
  bool basladimi = false;
  bool sureli = false;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    hazirla();
  }

  void hazirla() {
   satrancHazirlik(taslar);

  }

  void tiklandi(int sayi) {
    Point p = tiklananNoktayiBul(sayi);
    SatrancTaslari s = secilenTas(p);
    if (s == null) {
      gidecegiYer = p;
      if (gidilecekYerler.length != 0) {
        boshareketEt();
      }
    } else if (s.renk == renk) {
      heryeriSondur();
      gidebilecegiYerler(s);
    } else {
      gidecegiYer = p;
      if (gidilecekYerler.length != 0) {
        yiyerekhareketEt();
      }
    }
  }

  void yiyerekhareketEt() {
    if (gidilecekYerler.contains(gidecegiYer)) {
      SatrancTaslari yenecek = secilenTas(gidecegiYer);
      SatrancTaslari s = secilenTas(gidilecekYerler[0]);
      if (!yerkenharekettenOnceKontrolEt(yenecek, s)) {
        taslar.remove(yenecek);

        rockDenetimleri(s);
        piyonKarsiyaUlasirMi(s);

        s.p = gidecegiYer;
        update(['taslar']);
        gidilecekYerler = [];
        heryeriSondur();
        renk = renk == 'b' ? 's' : 'b';
        harekettenSonraKontrolEt();
      } else {
        gidilecekYerler = [];
      }
    }
  }

  void boshareketEt() {
    if (gidilecekYerler.contains(gidecegiYer)) {
      SatrancTaslari s = secilenTas(gidilecekYerler[0]);
      if (!yenemedenHarekettenOnceKontrolEt(s)) {
        rockDenetimleri(s);
        piyonKarsiyaUlasirMi(s);

        if (s.tas == 'ş' && (s.p.x - gidecegiYer.x).abs() == 2) {
          rockYapBakalim(s);
        }
        else{
          s.p = gidecegiYer;
          update(['taslar']);
          gidilecekYerler = [];
          heryeriSondur();
          renk = renk == 'b' ? 's' : 'b';
          harekettenSonraKontrolEt();
        }


      } else {
        gidilecekYerler = [];
      }
    }
  }

  void rockYapBakalim(SatrancTaslari s) {


    if (gidecegiYer == Point(3, 1)) {
      SatrancTaslari k = aradigimTas(Point(1,1));
      k.p = Point(4, 1);
    } else if (gidecegiYer == Point(7, 1)) {
      SatrancTaslari k = aradigimTas(Point(8,1));
      k.p = Point(6, 1);
    } else if (gidecegiYer == Point(3, 8)) {
      SatrancTaslari k = aradigimTas(Point(1,8));
      k.p = Point(4, 8);
    } else if (gidecegiYer == Point(7, 8)) {
      SatrancTaslari k = aradigimTas(Point(8,8));
      k.p = Point(6, 8);
    }
    s.p = gidecegiYer;
    update(['taslar']);
    gidilecekYerler = [];
    heryeriSondur();
    renk = renk == 'b' ? 's' : 'b';
    harekettenSonraKontrolEt();
  }

  bool yenemedenHarekettenOnceKontrolEt(SatrancTaslari s) {
    List<SatrancTaslari> dummyTaslar = List.from(taslar);
    SatrancTaslari g;
    dummyTaslar.forEach((element) {
      if (s.p == element.p) {
        g = element;
      }
    });
    Point mevcut = g.p;
    g.p = gidecegiYer;

    bool durum;
    if (sahDurumlari.acmazdaMi(renk, dummyTaslar)) {
      durum = true;
    } else {
      durum = false;
    }
    g.p = mevcut;

    return durum;
  }

  bool yerkenharekettenOnceKontrolEt(SatrancTaslari yenecek, SatrancTaslari s) {
    List<SatrancTaslari> dummyTaslar = List.from(taslar);
    dummyTaslar.remove(yenecek);
    SatrancTaslari g;
    dummyTaslar.forEach((element) {
      if (s.p == element.p) {
        g = element;
      }
    });
    Point mevcut = g.p;
    g.p = gidecegiYer;

    bool durum;
    if (sahDurumlari.acmazdaMi(renk, dummyTaslar)) {
      durum = true;
    } else {
      durum = false;
    }
    g.p = mevcut;
    return durum;
  }

  void harekettenSonraKontrolEt() {
    if (sahDurumlari.sahCekildiMi(renk, taslar)) {
      if (sahDurumlari.matMiKontrolEt(renk, taslar)) {
        toastShow("ŞAH MAT");
      } else {
        toastShowKisa("ŞAH ÇEKİLDİ");
      }
    }
    if(renk=='s'){
      if(sureli){
        siyahGeriSayim.resume();
        beyazGeriSayim.pause();
      }

    }
    else{
      if(sureli){
        beyazGeriSayim.resume();
        siyahGeriSayim.pause();
      }

    }
  }

  void gidebilecegiYerler(SatrancTaslari s) {
    if (s.tas == "p") {
      gidilecekYerler =
          taslarinGidebilecegiYerler.piyonunGidebilecegiYerler(s, taslar);
      gidilecekYerler =
          gideceklerdenElemeYap.aradakiTaslariEle(gidilecekYerler, taslar);
      gidilecekYerler = gideceklerdenElemeYap.kendiTaslarimiEle(
          gidilecekYerler, taslar, s.renk);
      yerleriYak(gidilecekYerler);
    } else if (s.tas == 'a') {
      gidilecekYerler = taslarinGidebilecegiYerler.atinGidebilecegiYerler(s);
      gidilecekYerler = gideceklerdenElemeYap.kendiTaslarimiEle(
          gidilecekYerler, taslar, s.renk);
      yerleriYak(gidilecekYerler);
    } else if (s.tas == 'k') {
      gidilecekYerler = taslarinGidebilecegiYerler.kaleninGidebilecegiYerler(s);

      gidilecekYerler =
          gideceklerdenElemeYap.aradakiTaslariEle(gidilecekYerler, taslar);
      gidilecekYerler = gideceklerdenElemeYap.kendiTaslarimiEle(
          gidilecekYerler, taslar, s.renk);

      yerleriYak(gidilecekYerler);
    } else if (s.tas == 'f') {
      gidilecekYerler = taslarinGidebilecegiYerler.filinGidebilecegiYerler(s);
      gidilecekYerler =
          gideceklerdenElemeYap.aradakiTaslariEle(gidilecekYerler, taslar);
      gidilecekYerler = gideceklerdenElemeYap.kendiTaslarimiEle(
          gidilecekYerler, taslar, s.renk);
      yerleriYak(gidilecekYerler);
    } else if (s.tas == 'ş') {
      bool kisarock = renk == 'b' ? beyazKisaRock : siyahKisaRock;
      bool uzunrock = renk == 'b' ? beyazUzunRock : siyahUzunRock;

      //beyaz rock için kontrol et
      if (s.renk == 'b') {
        if (rockKontrolleri(
            renk, [Point(3, 8), Point(4, 8), Point(5, 8)], taslar)) {
          uzunrock = false;
        }
        if (rockKontrolleri(
            renk, [Point(5, 8), Point(6, 8), Point(7, 8)], taslar)) {
          kisarock = false;
        }
      }
      //siyah rock için kontrol et
      if (s.renk == 's') {
        if (rockKontrolleri(
            renk, [Point(3, 1), Point(4, 1), Point(5, 1)], taslar)) {
          uzunrock = false;
        }
        if (rockKontrolleri(
            renk, [Point(5, 1), Point(6, 1), Point(7, 1)], taslar)) {
          kisarock = false;
        }
      }

      gidilecekYerler = taslarinGidebilecegiYerler.sahinGidebilecegiYerler(
          s, kisarock, uzunrock);
      gidilecekYerler =
          gideceklerdenElemeYap.aradakiTaslariEle(gidilecekYerler, taslar);
      gidilecekYerler = gideceklerdenElemeYap.kendiTaslarimiEle(
          gidilecekYerler, taslar, s.renk);
      yerleriYak(gidilecekYerler);
    } else if (s.tas == 'v') {
      gidilecekYerler = taslarinGidebilecegiYerler.vezirinGidebilecegiYerler(s);
      gidilecekYerler =
          gideceklerdenElemeYap.aradakiTaslariEle(gidilecekYerler, taslar);
      gidilecekYerler = gideceklerdenElemeYap.kendiTaslarimiEle(
          gidilecekYerler, taslar, s.renk);
      yerleriYak(gidilecekYerler);
    }
  }

  void yerleriYak(List<Point> pList) {
    List<int> yerler = [];
    pList.forEach((element) {
      yerler.add(noktayiSayiyaCevir(element));
    });
    heryeriSondur();
    yerler.forEach((element) {
      yanacakYerler[element] = true;
    });
    update(["yanacak"]);
  }

  void heryeriSondur() {
    for (var i = 0; i < yanacakYerler.length; i++) {
      yanacakYerler[i] = false;
    }
    update(["yanacak"]);
  }

  Point tiklananNoktayiBul(int sayi) {
    int bolum = (sayi ~/ 8) + 1;
    int kalan = (sayi % 8) + 1;
    Point p = Point(kalan, bolum);

    return p;
  }

  int noktayiSayiyaCevir(Point p) {
    int sayi = (p.y - 1) * 8 + (p.x - 1);
    return sayi;
  }

  SatrancTaslari secilenTas(Point p) {
    SatrancTaslari s;
    for (var i = 0; i < taslar.length; i++) {
      if (p == taslar[i].p) {
        s = taslar[i];
        return s;
      }
    }
    return s;
  }

  void rockDenetimleri(SatrancTaslari s) {
    if (s.renk == 'b') {
      if (s.tas == 'ş' || s.p == Point(1, 8)) {
        beyazUzunRock = false;
      }
      if (s.tas == 'ş' || s.p == Point(8, 8)) {
        beyazKisaRock = false;
      }
    }
    if (s.renk == 's') {
      if (s.tas == 'ş' || s.p == Point(1, 1)) {
        siyahUzunRock = false;
      }
      if (s.tas == 'ş' || s.p == Point(8, 1)) {
        siyahKisaRock = false;
      }
    }
  }

  SatrancTaslari aradigimTas(Point p){
    SatrancTaslari s;
    taslar.forEach((element) {
      if(element.p==p){
        s = element;
      }
    });
    return s;
  }

  void piyonKarsiyaUlasirMi(SatrancTaslari s) {
    if (s.renk == 'b' && gidecegiYer.y == 1 && s.tas == 'p') {
      PiyonKarSiyaUlasir piyonKarSiyaUlasir = PiyonKarSiyaUlasir();
      piyonKarSiyaUlasir.beyazSecimleriGoster(s);
      s.p = gidecegiYer;
    } else if (s.renk == 's' && gidecegiYer.y == 8 && s.tas == 'p') {
      PiyonKarSiyaUlasir piyonKarSiyaUlasir = PiyonKarSiyaUlasir();
      piyonKarSiyaUlasir.siyahSecimleriGoster(s);
      s.p = gidecegiYer;

    }
  }

  void oyunaBasla(int i) {
    sureli = true;
    sure = i;
    beyazGeriSayim.restart(duration: sure);
    siyahGeriSayim.restart(duration: sure);
    siyahGeriSayim.pause();
    basladimi = true;
    renk = 'b';
    update(['basla']);


  }

  void oyunaSuresizBasla() {
    sureli = false;
    basladimi = true;
    renk = 'b';
    update(['basla']);
  }

}


class SatrancTaslari {
  String renk;
  String tas;
  Point p;
  Image i;

  SatrancTaslari(this.renk, this.tas, this.p, this.i);
}
