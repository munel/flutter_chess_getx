import 'dart:math';

import 'package:flutter_chess/satranc/controller/satranccontroller.dart';


class TaslarinGidebilecegiYerler {
  List<Point> piyonunGidebilecegiYerler(
      SatrancTaslari s, List<SatrancTaslari> taslar) {
    List<Point> yerler = [];
    List<Point> points = [];

    if (s.renk == "s") {
      points.add(s.p);
      Point p1 = Point(s.p.x, s.p.y + 1);
      bool ondeTasVar = false;

      taslar.forEach((element) {
        if(p1==element.p){
          ondeTasVar = true;
        }
      });
      if(!ondeTasVar){
        points.add(p1);
      }


      if (s.p.y == 2) {
        Point p2 = Point(s.p.x, s.p.y + 2);
        bool ondeTasVar = false;

        taslar.forEach((element) {
          if(p2==element.p){
            ondeTasVar = true;
          }
        });
        if(!ondeTasVar){
          points.add(p2);
        }

      }

      Point p3 = Point(s.p.x + 1, s.p.y + 1);

      taslar.forEach((element) {
        if (element.p == p3 && element.renk == 'b') {
          points.add(p3);
        }
      });

      Point p4 = Point(s.p.x - 1, s.p.y + 1);
      taslar.forEach((element) {
        if (element.p == p4 && element.renk == 'b') {
          points.add(p4);
        }
      });
    } else {
      points.add(s.p);
      Point p1 = Point(s.p.x, s.p.y - 1);
      bool ondeTasVar = false;

      taslar.forEach((element) {
        if(p1==element.p){
          ondeTasVar = true;
        }
      });
      if(!ondeTasVar){
        points.add(p1);
      }
      if (s.p.y == 7) {
        Point p2 = Point(s.p.x, s.p.y - 2);
        bool ondeTasVar = false;

        taslar.forEach((element) {
          if(p2==element.p){
            ondeTasVar = true;
          }
        });
        if(!ondeTasVar){
          points.add(p2);
        }
      }
      Point p3 = Point(s.p.x - 1, s.p.y - 1);
      taslar.forEach((element) {
        if (element.p == p3 && element.renk == 's') {
          points.add(p3);
        }
      });
      Point p4 = Point(s.p.x + 1, s.p.y - 1);
      taslar.forEach((element) {
        if (element.p == p4 && element.renk == 's') {
          points.add(p4);
        }
      });
    }

    points.forEach((element) {
      if (element.x > 0 && element.x < 9 && element.y > 0 && element.y < 9) {
        yerler.add(element);
      }
    });

    List<Point> sonListe = [];



    return yerler;
  }

  List<Point> atinGidebilecegiYerler(SatrancTaslari s) {
    List<Point> yerler = [];
    Point p = s.p;
    List<Point> points = [
      p,
      Point(p.x - 1, p.y + 2),
      Point(p.x - 1, p.y - 2),
      Point(p.x + 1, p.y + 2),
      Point(p.x + 1, p.y - 2),
      Point(p.x - 2, p.y - 1),
      Point(p.x + 2, p.y - 1),
      Point(p.x - 2, p.y + 1),
      Point(p.x + 2, p.y + 1)
    ];
    points.forEach((element) {
      if (element.x > 0 && element.x < 9 && element.y > 0 && element.y < 9) {
        yerler.add(element);
      }
    });
    return yerler;
  }

  List<Point> kaleninGidebilecegiYerler(SatrancTaslari s) {
    List<Point> yerler = [];
    Point p = s.p;
    List<Point> points = [
      p,
      Point(p.x, p.y + 1),
      Point(p.x, p.y + 2),
      Point(p.x, p.y + 3),
      Point(p.x, p.y + 4),
      Point(p.x, p.y + 5),
      Point(p.x, p.y + 6),
      Point(p.x, p.y + 7),
      Point(p.x, p.y - 1),
      Point(p.x, p.y - 2),
      Point(p.x, p.y - 3),
      Point(p.x, p.y - 4),
      Point(p.x, p.y - 5),
      Point(p.x, p.y - 6),
      Point(p.x, p.y - 7),
      Point(p.x + 1, p.y),
      Point(p.x + 2, p.y),
      Point(p.x + 3, p.y),
      Point(p.x + 4, p.y),
      Point(p.x + 5, p.y),
      Point(p.x + 6, p.y),
      Point(p.x + 7, p.y),
      Point(p.x - 1, p.y),
      Point(p.x - 2, p.y),
      Point(p.x - 3, p.y),
      Point(p.x - 4, p.y),
      Point(p.x - 5, p.y),
      Point(p.x - 6, p.y),
      Point(p.x - 7, p.y),
    ];
    points.forEach((element) {
      if (element.x > 0 && element.x < 9 && element.y > 0 && element.y < 9) {
        yerler.add(element);
      }
    });
    return yerler;
  }

  List<Point> filinGidebilecegiYerler(SatrancTaslari s) {
    List<Point> yerler = [];
    Point p = s.p;
    List<Point> points = [
      p,
      Point(p.x + 1, p.y + 1),
      Point(p.x + 2, p.y + 2),
      Point(p.x + 3, p.y + 3),
      Point(p.x + 4, p.y + 4),
      Point(p.x + 5, p.y + 5),
      Point(p.x + 6, p.y + 6),
      Point(p.x + 7, p.y + 7),
      Point(p.x - 1, p.y - 1),
      Point(p.x - 2, p.y - 2),
      Point(p.x - 3, p.y - 3),
      Point(p.x - 4, p.y - 4),
      Point(p.x - 5, p.y - 5),
      Point(p.x - 6, p.y - 6),
      Point(p.x - 7, p.y - 7),
      Point(p.x + 1, p.y - 1),
      Point(p.x + 2, p.y - 2),
      Point(p.x + 3, p.y - 3),
      Point(p.x + 4, p.y - 4),
      Point(p.x + 5, p.y - 5),
      Point(p.x + 6, p.y - 6),
      Point(p.x + 7, p.y - 7),
      Point(p.x - 1, p.y + 1),
      Point(p.x - 2, p.y + 2),
      Point(p.x - 3, p.y + 3),
      Point(p.x - 4, p.y + 4),
      Point(p.x - 5, p.y + 5),
      Point(p.x - 6, p.y + 6),
      Point(p.x - 7, p.y + 7),
    ];
    points.forEach((element) {
      if (element.x > 0 && element.x < 9 && element.y > 0 && element.y < 9) {
        yerler.add(element);
      }
    });
    return yerler;
  }

  List<Point> sahinGidebilecegiYerler(SatrancTaslari s, bool kisarock, bool uzunrock) {
    List<Point> yerler = [];
    Point p = s.p;
    List<Point> points = [
      p,
      Point(p.x - 1, p.y),
      Point(p.x + 1, p.y),
      Point(p.x, p.y + 1),
      Point(p.x, p.y - 1),
      Point(p.x - 1, p.y - 1),
      Point(p.x + 1, p.y + 1),
      Point(p.x - 1, p.y + 1),
      Point(p.x + 1, p.y - 1),
    ];
    
    if(s.renk=='b'){
      if(kisarock){
        points.add(Point(7,8));

      }
      if(uzunrock){
        points.add(Point(3,8));
      }

    }

    if(s.renk=='s'){
      if(kisarock){
        points.add(Point(7,1));

      }
      if(uzunrock){
        points.add(Point(3,1));
      }

    }
    
    points.forEach((element) {
      if (element.x > 0 && element.x < 9 && element.y > 0 && element.y < 9) {
        yerler.add(element);
      }
    });
    return yerler;
  }

  List<Point> vezirinGidebilecegiYerler(SatrancTaslari s) {
    List<Point> yerler = [];
    Point p = s.p;
    List<Point> points = [
      p,
      Point(p.x + 1, p.y + 1),
      Point(p.x + 2, p.y + 2),
      Point(p.x + 3, p.y + 3),
      Point(p.x + 4, p.y + 4),
      Point(p.x + 5, p.y + 5),
      Point(p.x + 6, p.y + 6),
      Point(p.x + 7, p.y + 7),
      Point(p.x - 1, p.y - 1),
      Point(p.x - 2, p.y - 2),
      Point(p.x - 3, p.y - 3),
      Point(p.x - 4, p.y - 4),
      Point(p.x - 5, p.y - 5),
      Point(p.x - 6, p.y - 6),
      Point(p.x - 7, p.y - 7),
      Point(p.x + 1, p.y - 1),
      Point(p.x + 2, p.y - 2),
      Point(p.x + 3, p.y - 3),
      Point(p.x + 4, p.y - 4),
      Point(p.x + 5, p.y - 5),
      Point(p.x + 6, p.y - 6),
      Point(p.x + 7, p.y - 7),
      Point(p.x - 1, p.y + 1),
      Point(p.x - 2, p.y + 2),
      Point(p.x - 3, p.y + 3),
      Point(p.x - 4, p.y - 4),
      Point(p.x - 5, p.y - 5),
      Point(p.x - 6, p.y - 6),
      Point(p.x - 7, p.y + 7),
      Point(p.x, p.y + 1),
      Point(p.x, p.y + 2),
      Point(p.x, p.y + 3),
      Point(p.x, p.y + 4),
      Point(p.x, p.y + 5),
      Point(p.x, p.y + 6),
      Point(p.x, p.y + 7),
      Point(p.x, p.y - 1),
      Point(p.x, p.y - 2),
      Point(p.x, p.y - 3),
      Point(p.x, p.y - 4),
      Point(p.x, p.y - 5),
      Point(p.x, p.y - 6),
      Point(p.x, p.y - 7),
      Point(p.x + 1, p.y),
      Point(p.x + 2, p.y),
      Point(p.x + 3, p.y),
      Point(p.x + 4, p.y),
      Point(p.x + 5, p.y),
      Point(p.x + 6, p.y),
      Point(p.x + 7, p.y),
      Point(p.x - 1, p.y),
      Point(p.x - 2, p.y),
      Point(p.x - 3, p.y),
      Point(p.x - 4, p.y),
      Point(p.x - 5, p.y),
      Point(p.x - 6, p.y),
      Point(p.x - 7, p.y),
    ];
    points.forEach((element) {
      if (element.x > 0 && element.x < 9 && element.y > 0 && element.y < 9) {
        yerler.add(element);
      }
    });
    return yerler;
  }

  bool aradaTasVarmi(Point p1, Point p2) {
    if (p1.x == p2.x) {
      if (p1.y < p2.y) {}
    }
  }
}
