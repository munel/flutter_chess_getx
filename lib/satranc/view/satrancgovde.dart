import 'package:flutter/material.dart';
import 'package:flutter_chess/satranc/controller/satranccontroller.dart';
import 'package:get/get.dart';


class SatrancGovde extends StatelessWidget {
  SatrancController satrancController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 400,
      color: Colors.white,
      alignment: Alignment.center,
      child: Stack(
        children: [
          arkaplan(),
          GetBuilder<SatrancController>(
            id: "taslar",
            builder: (_) {
              return Stack(
                children: List.generate(_.taslar.length, (index){
                  return birinciTas(_.taslar[index]);
                })
              );
            }
          ),
          tiklamaYonlendirici()
        ],
      ),
    );
  }

  Container tiklamaYonlendirici() {
    return Container(
          width: 400,
          height: 400,
          child: Column(
            children: List.generate(8, (i){
              return Row(
                children: List.generate(8, (j){
                  int sira = (i * 8 + j);
                  return InkWell(
                    onTap: (){
                      satrancController.tiklandi(sira);


                    },
                    child: GetBuilder<SatrancController>(
                      id: "yanacak",
                      builder: (_) {
                        return Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: _.yanacakYerler[sira] == true ? Colors.green.withOpacity(0.5) :  Colors.green.withOpacity(0.1),

                          ),
                        );
                      }
                    ),
                  );
                }),
              );
            }).toList(),
          ),
        );
  }

  Container arkaplan() {
    return Container(
            width: 400,
            height: 400,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/satranc/chessboard.png"),
                fit: BoxFit.cover,
              ),
            ));
  }

  Positioned birinciTas(SatrancTaslari tas) {
    return Positioned(
      left: (tas.p.x-1)*50.toDouble(),
      top: (tas.p.y-1)*50.toDouble(),
      child: Container(
          width: 50,
          height: 50,
          alignment: Alignment.center,
          child: tas.i
      ),
    );
  }
}
