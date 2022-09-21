
// import 'package:lavie/screens_and_cubit/qr_screen/qr_code_design.dart';
// import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:flutter/material.dart';

// import '../../widgets/widgets.dart';
// class QRScanner extends StatefulWidget {
//   const QRScanner({Key? key}) : super(key: key);

//   @override
//   State<QRScanner> createState() => _QRScannerState();
// }

// class _QRScannerState extends State<QRScanner> {
//   MobileScannerController cameraController = MobileScannerController();
//   @override
 
//   Widget build(BuildContext context) {
//     return Scaffold(
//         // appBar: AppBar(
//         //   title: const Text('Mobile Scanner'),
//         //   actions: [
//         //     IconButton(
//         //       color: Colors.white,
//         //       icon: ValueListenableBuilder(
//         //         valueListenable: cameraController.torchState,
//         //         builder: (context, state, child) {
//         //           switch (state as TorchState) {
//         //             case TorchState.off:
//         //               return const Icon(Icons.flash_off, color: Colors.grey);
//         //             case TorchState.on:
//         //               return const Icon(Icons.flash_on, color: Colors.yellow);
//         //           }
//         //         },
//         //       ),
//         //       iconSize: 32.0,
//         //       onPressed: () => cameraController.toggleTorch(),
//         //     ),
//         //     IconButton(
//         //       color: Colors.white,
//         //       icon: ValueListenableBuilder(
//         //         valueListenable: cameraController.cameraFacingState,
//         //         builder: (context, state, child) {
//         //           switch (state as CameraFacing) {
//         //             case CameraFacing.front:
//         //               return const Icon(Icons.camera_front);
//         //             case CameraFacing.back:
//         //               return const Icon(Icons.camera_rear);
//         //           }
//         //         },
//         //       ),
//         //       iconSize: 32.0,
//         //       onPressed: () => cameraController.switchCamera(),
//         //     ),
//         //   ],
//         // ),
//         body: Stack(
//           children: [
//               MobileScanner(
//               allowDuplicates: false,
//               controller: cameraController,
//               onDetect: (barcode, args) {
//                 if (barcode.rawValue == null) {
//                   debugPrint('Failed to scan Barcode');
//                 } else {
//                   final String code = barcode.rawValue!;
//                   debugPrint('Barcode found! $code');
//                   print('qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq${code}');
//                 }
//               }),
              

// QRScannerOverlay(overlayColour: Colors.black.withOpacity(.1),),

// // Column(
// //   mainAxisAlignment:MainAxisAlignment.end,
// //   children: [
// //           Padding(
// //             padding: const EdgeInsets.all(8.0),
// //             child:Column(
// //       mainAxisAlignment: MainAxisAlignment.center,

// //       // crossAxisAlignment: CrossAxisAlignment.center,

// //       children: [
// //         Padding(
// //           padding:
// //               const EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 1),
// //           child: ElevatedButton(
// //             style: ElevatedButton.styleFrom(
// //               primary: Colors.grey,

// //               onPrimary: Colors.grey,
// //               // side: BorderSide(
// //               //     width: 1.0, color: Color.fromARGB(255, 158, 186, 235)),

// //               padding: EdgeInsets.only(
// //                 top: 20,
// //                 bottom: 9,
// //               ),

// //               // shadowColor: pressAttention ? Color(0xffFF4500) : Color(0xffE6E5E7),

// //               elevation: 6,

// //               shape: RoundedRectangleBorder(
// //                 borderRadius: BorderRadius.circular(10),
// //               ),
// //             ),
// //             child: Padding(
// //               padding: const EdgeInsets.only(
// //                 bottom: 1,
// //               ),
// //               child: Row(
// //                 mainAxisAlignment: MainAxisAlignment.start,
// //                 children: [
// //                  Padding(
// //                    padding: const EdgeInsets.only(left: 10),
// //                    child: Column(
// //                 // mainAxisAlignment: MainAxisAlignment.center,
// // crossAxisAlignment: CrossAxisAlignment.start,
// //                     children: [
// //   Text(
// //                       'SNAKE PLANTS (SANSEVIERIA)',
// //                       style: TextStyle(
// //                         fontSize: 15,
// //                         color: Colors.black,
// //                         fontWeight: FontWeight.w600,
// //                       ),
// //                       textAlign: TextAlign.center,
// //                     ),
// //                      Text(
// //                       'Native to southerm Africa',
// //                       style: TextStyle(
// //                         fontSize: 15,
// //                         color: Colors.black,
// //                         // fontWeight: FontWeight.w600,
// //                       ),
// //                       textAlign: TextAlign.center,
// //                     ),
// //                     ],
// //                    ),
// //                  ),
// // //                  SizedBox(
// // // width: displayWidth(context)*.1,
// // //                  ),
// //                  Container(
// //                 height: 50,
// //                 decoration: BoxDecoration(
// //                   color: Colors.green,
// //                   borderRadius: BorderRadius.all(Radius.circular(20)),
// //                 ),
// //                 width: double.infinity,
// //                  ),
// //                   // SizedBox(
// //                   //   width: MediaQuery.of(context).size.width * .40,
// //                   // ),
// //                 ],
// //               ),
// //             ),
// //             onPressed: () {},
// //           ),
// //         ),
// //       ],
// //     ),
// //           ),


// //   ],
// // ),

//           ],
       
//         ));
//   }
//   }


import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie/screens_and_cubit/Blogs/blogs_screen.dart';
import 'package:lavie/screens_and_cubit/qr_screen/cubit/cubit.dart';
import 'package:lavie/screens_and_cubit/qr_screen/cubit/states.dart';
import 'package:lavie/widgets/widgets.dart';

import 'package:qr_code_scanner/qr_code_scanner.dart';


  class Qrcode extends StatefulWidget {
  @override
  State<Qrcode> createState() => _QrcodeState();
}

class _QrcodeState extends State<Qrcode> {
  final qrKey=GlobalKey(debugLabel: 'QR');
  QRViewController?controller;
  Barcode?barcode;
  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
  @override
  void reassemble()async {
   if(Platform.isAndroid){
     await controller!.pauseCamera();
   }
   controller!.resumeCamera();
    super.reassemble();
  }
  Widget build(BuildContext context)=>SafeArea(child:
   BlocConsumer<RQCodeCubit,RQCodeStatus>(
  listener: (context, state) {},
  builder: (context, state) {
    var cubit=RQCodeCubit.get(context);

    return Scaffold(
      body: Stack(children: <Widget>[
        buildQrView(context),
        Positioned(child: buildResult(), bottom: 18,),
        if( barcode!=null)
        Positioned(bottom: 80,
          child:
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Container(
              width: 300,
              height: 70,
              decoration: BoxDecoration(
                  color: Colors.white54,
                  borderRadius: BorderRadius.circular(12)),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          "SNAKE PLANT (SANSEVIERIA)",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          "Native to southern Africa",
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  CircleAvatar(
                      minRadius: 10,
                      backgroundColor: Colors.green,
                      child: IconButton(
                          onPressed: () {
                            cubit.getPlantId(plantId: "${barcode!.code}");
                            navigateTo(context,BlogsScreen() );
                            // MainCubit.get(context).GetPlantsId(
                            //     plantId: "${barcode!.code}");
                            // NavigationUtils.navigateTo(context: context,
                            //     destinationScreen: ScanImp( ));
                          },
                          icon: Icon(
                            Icons.arrow_forward_rounded,
                            color: Colors.white,
                          )))
                ],
              ),
            ),
          ),),

      ],),
    );
  }));
  Widget buildResult()=>
      Container(
        width: 350,
        height: 40,
        decoration: BoxDecoration(border: Border.all(color: Colors.greenAccent)),
        child:
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: Text(
    barcode!=null?'Result:${describeEnum(barcode!.format)} Data:"${barcode!.code}"':'Scan a Code!',
    maxLines: 3,
            style: TextStyle(color: Colors.white),
  ),
        ),
      );

  Widget buildQrView(BuildContext context)=>QRView(key: qrKey, onQRViewCreated: onQRViewCreated,overlay:QrScannerOverlayShape(
    cutOutSize: MediaQuery.of(context).size.width*0.8,
    borderWidth: 10,
    borderRadius: 10,
  ) ,);

  Future<void> onQRViewCreated(QRViewController controller)async {
    setState(()=>this.controller=controller );
controller.scannedDataStream.listen((barcode) =>setState(()=>this.barcode=barcode) );
  }
}
