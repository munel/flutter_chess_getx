import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chess/satranc/controller/satranccontroller.dart';
import 'package:flutter_chess/satranc/view/satrancgovde.dart';
import 'package:flutter_chess/yardimcilar.dart';
import 'package:get/get.dart';


class SatrancMain extends StatefulWidget {
  @override
  _SatrancMainState createState() => _SatrancMainState();
}

class _SatrancMainState extends State<SatrancMain> {
  SatrancController satrancController = Get.put(SatrancController());
  int _sure = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Satranç"),
      ),
      body: Column(
        children: [
          Container(
            width: Get.width,
            child: FittedBox(
              child: SatrancGovde(),
            ),
          ),
          Expanded(
            child: Container(
              height: double.infinity,
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      width: Get.width / 4,
                      child: FittedBox(child: geriSayimBeyazWidget())),
                  GetBuilder<SatrancController>(
                    id: "basla",
                    builder: (_) {
                      return _.basladimi ? Center() :  Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GetBuilder<SatrancController>(
                            id: "suresecim",
                            builder: (_) {
                              return Container(
                                  padding: EdgeInsets.all(20.0),
                                  child: DropdownButton(
                                      value: _sure,
                                      items: [
                                        DropdownMenuItem(
                                          child: Text("Süresiz"),
                                          value: 0,
                                        ),
                                        DropdownMenuItem(
                                          child: Text("1 Dakika"),
                                          value: 60,
                                        ),
                                        DropdownMenuItem(
                                            child: Text("3 Dakika"), value: 180),
                                        DropdownMenuItem(
                                            child: Text("5 Dakika"), value: 300),
                                        DropdownMenuItem(
                                            child: Text("10 Dakika"), value: 600)
                                      ],
                                      onChanged: (value) {
                                        _sure = value;

                                        satrancController.update(['suresecim']);
                                      }));
                            }
                          ),
                          Container(
                            child: satrancController.basladimi
                                ? Center()
                                : TextButton(
                                    onPressed: () {
                                      if (_sure != 0) {
                                        satrancController.oyunaBasla(_sure);

                                      }
                                      else{
                                        satrancController.oyunaSuresizBasla();

                                      }
                                    },
                                    child: Text("Başla")),
                          )
                        ],
                      );
                    }
                  ),
                  Container(
                      width: Get.width / 4,
                      child: FittedBox(child: geriSayimSiyahWidget())),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Column geriSayimSiyahWidget() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("SİYAH"),
        ),
        CircularCountDownTimer(
          textStyle: TextStyle(fontSize: 22),
          controller: satrancController.siyahGeriSayim,
          width: 100,
          height: 100,
          duration: satrancController.sure,
          isReverse: true,
          fillColor: Theme.of(context).primaryColor,
          color: Colors.white,
          strokeWidth: 15,
          onComplete: () {
            if(satrancController.sureli){
              geriSayimKontrol("b");
            }

          },
        ),
      ],
    );
  }

  Column geriSayimBeyazWidget() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("BEYAZ"),
        ),
        CircularCountDownTimer(
          textStyle: TextStyle(fontSize: 22),
          controller: satrancController.beyazGeriSayim,
          width: 100,
          height: 100,
          duration: satrancController.sure,
          isReverse: true,
          fillColor: Theme.of(context).primaryColor,
          color: Colors.white,
          strokeWidth: 15,
          onComplete: () {
            if(satrancController.sureli){
              geriSayimKontrol("b");
            }


          },
        ),
      ],
    );
  }

  void geriSayimKontrol(String s){
    if(s=='b'){
      toastShow("Süre Bitti. Siyah Kazandı");
    }
    else{
      toastShow("Süre Bitti. Beyaz Kazandı");
    }
    satrancController.renk = "";


  }

}
