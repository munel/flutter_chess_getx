import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_chess/satranc/controller/satranccontroller.dart';


void satrancHazirlik(List<SatrancTaslari> taslar){
  taslar.add(SatrancTaslari(
      "s", "k", Point(1, 1), Image.asset("assets/satranc/sk.png")));
  taslar.add(SatrancTaslari(
      "s", "a", Point(2, 1), Image.asset("assets/satranc/sa.png")));
  taslar.add(SatrancTaslari(
      "s", "f", Point(3, 1), Image.asset("assets/satranc/sf.png")));
  taslar.add(SatrancTaslari(
      "s", "v", Point(4, 1), Image.asset("assets/satranc/sv.png")));
  taslar.add(SatrancTaslari(
      "s", "ş", Point(5, 1), Image.asset("assets/satranc/ss.png")));
  taslar.add(SatrancTaslari(
      "s", "f", Point(6, 1), Image.asset("assets/satranc/sf.png")));
  taslar.add(SatrancTaslari(
      "s", "a", Point(7, 1), Image.asset("assets/satranc/sa.png")));
  taslar.add(SatrancTaslari(
      "s", "k", Point(8, 1), Image.asset("assets/satranc/sk.png")));
  taslar.add(SatrancTaslari(
      "s", "p", Point(1, 2), Image.asset("assets/satranc/sp.png")));
  taslar.add(SatrancTaslari(
      "s", "p", Point(2, 2), Image.asset("assets/satranc/sp.png")));
  taslar.add(SatrancTaslari(
      "s", "p", Point(3, 2), Image.asset("assets/satranc/sp.png")));
  taslar.add(SatrancTaslari(
      "s", "p", Point(4, 2), Image.asset("assets/satranc/sp.png")));
  taslar.add(SatrancTaslari(
      "s", "p", Point(5, 2), Image.asset("assets/satranc/sp.png")));
  taslar.add(SatrancTaslari(
      "s", "p", Point(6, 2), Image.asset("assets/satranc/sp.png")));
  taslar.add(SatrancTaslari(
      "s", "p", Point(7, 2), Image.asset("assets/satranc/sp.png")));
  taslar.add(SatrancTaslari(
      "s", "p", Point(8, 2), Image.asset("assets/satranc/sp.png")));

  taslar.add(SatrancTaslari(
      "b", "p", Point(1, 7), Image.asset("assets/satranc/bp.png")));
  taslar.add(SatrancTaslari(
      "b", "p", Point(2, 7), Image.asset("assets/satranc/bp.png")));
  taslar.add(SatrancTaslari(
      "b", "p", Point(3, 7), Image.asset("assets/satranc/bp.png")));
  taslar.add(SatrancTaslari(
      "b", "p", Point(4, 7), Image.asset("assets/satranc/bp.png")));
  taslar.add(SatrancTaslari(
      "b", "p", Point(5, 7), Image.asset("assets/satranc/bp.png")));
  taslar.add(SatrancTaslari(
      "b", "p", Point(6, 7), Image.asset("assets/satranc/bp.png")));
  taslar.add(SatrancTaslari(
      "b", "p", Point(7, 7), Image.asset("assets/satranc/bp.png")));
  taslar.add(SatrancTaslari(
      "b", "p", Point(8, 7), Image.asset("assets/satranc/bp.png")));
  taslar.add(SatrancTaslari(
      "b", "k", Point(1, 8), Image.asset("assets/satranc/bk.png")));
  taslar.add(SatrancTaslari(
      "b", "a", Point(2, 8), Image.asset("assets/satranc/ba.png")));
  taslar.add(SatrancTaslari(
      "b", "f", Point(3, 8), Image.asset("assets/satranc/bf.png")));
  taslar.add(SatrancTaslari(
      "b", "v", Point(4, 8), Image.asset("assets/satranc/bv.png")));
  taslar.add(SatrancTaslari(
      "b", "ş", Point(5, 8), Image.asset("assets/satranc/bs.png")));
  taslar.add(SatrancTaslari(
      "b", "f", Point(6, 8), Image.asset("assets/satranc/bf.png")));
  taslar.add(SatrancTaslari(
      "b", "a", Point(7, 8), Image.asset("assets/satranc/ba.png")));
  taslar.add(SatrancTaslari(
      "b", "k", Point(8, 8), Image.asset("assets/satranc/bk.png")));
}