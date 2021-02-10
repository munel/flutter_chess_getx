import 'dart:math';

import 'package:flutter_chess/satranc/controller/satranccontroller.dart';


class GideceklerdenElemeYap {

  List<Point> aradakiTaslariEle(
      List<Point> gidilebilenler, List<SatrancTaslari> taslar) {

    List<Point> yeniListe = [];

    gidilebilenler.forEach((element) {
      List<Point> pList = araTaslariBul(gidilebilenler[0], element);

      if(!aradaTasVar(pList, taslar)){
        yeniListe.add(element);
      }
    });
    return yeniListe;
  }

  List<Point> kendiTaslarimiEle(List<Point> elenmisListe, List<SatrancTaslari> taslar, String renk) {
    List<Point> yeniListe = [];
    for(var i = 0;i<elenmisListe.length;i++){
      bool kendiTasimmi = false;
      taslar.forEach((element) {
        if(elenmisListe[i]==element.p && element.renk==renk){
          kendiTasimmi = true;
        }
      });
      if(!kendiTasimmi){
        yeniListe.add(elenmisListe[i]);
      }

    }
    yeniListe.insert(0, elenmisListe[0]);
    return yeniListe;

  }



  bool aradaTasVar(List<Point> pList, List<SatrancTaslari> taslar) {
    bool aradaTasVar = false;
    for (var i = 0; i < pList.length; i++) {
      taslar.forEach((element) {
        if (pList[i] == element.p) {
          aradaTasVar = true;
        }
      });
    }
    return aradaTasVar;
  }

  List<Point> araTaslariBul(Point p1, Point p2) {
    List<Point> pList = [];
    if (p1.x == p2.x) {
      if (p1.y < p2.y) {
        int i = p1.y + 1;
        for (i; i < p2.y; i++) {
          Point p = Point(p1.x, i);
          pList.add(p);
        }
        return pList;
      }
      if (p1.y > p2.y) {
        int i = p1.y - 1;
        for (i; i > p2.y; i--) {
          Point p = Point(p1.x, i);
          pList.add(p);
        }
        return pList;
      }
    } else if (p1.y == p2.y) {
      if (p1.x < p2.x) {
        int i = p1.x + 1;
        for (i; i < p2.x; i++) {
          Point p = Point(i, p1.y);
          pList.add(p);
        }
        return pList;
      }
      if (p1.x > p2.x) {
        int i = p1.x - 1;
        for (i; i > p2.x; i--) {
          Point p = Point(i, p1.y);
          pList.add(p);
        }
        return pList;
      }
    } else if (p1.x - p1.y == p2.x - p2.y) {
      if (p1.x < p2.x) {
        int i = p1.x + 1;
        int y = p1.y + 1;
        for (i; i < p2.x; i++) {
          Point p = Point(i, y);

          pList.add(p);
          y++;
        }
        return pList;
      }
      if (p1.x > p2.x) {
        int i = p1.x - 1;
        int y = p1.y - 1;
        for (i; i > p2.x; i--) {
          Point p = Point(i, y);
          pList.add(p);
          y--;
        }
        return pList;
      }
    } else {
      if (p1.x > p2.x) {
        int i = p1.x - 1;
        int y = p1.y + 1;
        for (i; i > p2.x; i--) {
          Point p = Point(i, y);
          pList.add(p);
          y++;
        }
        return pList;
      }
      if (p1.x < p2.x) {
        int i = p1.x + 1;
        int y = p1.y - 1;
        for (i; i < p2.x; i++) {
          Point p = Point(i, y);
          pList.add(p);
          y--;
        }
        return pList;
      }
    }
    return pList;
  }


}
