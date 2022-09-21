
// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';

// import '../../responsive/respnsive.dart';
// import '../../widgets/widgets.dart';

// class CartScreen extends StatefulWidget {
//   const CartScreen({Key? key}) : super(key: key);

//   @override
//   State<CartScreen> createState() => _CartScreenState();
// }

// class _CartScreenState extends State<CartScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//              SizedBox(
//               height: 20,
//              ),
            
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
                
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text(
//                       "My Cart",
//                       style: TextStyle(
//                         fontSize: 30,
//                         color: Colors.black,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: displayHeight(context) * .18,
//               ),
//               Container(
//                   child: Image.asset('assets/search_screen_icon/Frame.png')),
//               SizedBox(
//                 height: displayHeight(context) * .060,
//               ),
//               Text(
//                 "Not found",
//                 style: TextStyle(
//                   fontSize: 20,
//                   color: Colors.black,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(15.0),
//                 child: Container(
//                   child: Center(
//                     child: Text(
//                       "Sorry,the keyword you entered cannot be found, please check again or search with anthor keyword.",
//                       style: TextStyle(
//                         fontSize: 20,
//                         color: Colors.grey,
//                         //  fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),




//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lavie/screens_and_cubit/cart_screen/cart_notfound.dart';
import 'package:lavie/screens_and_cubit/home/cubit.dart/cubit.dart';
import 'package:lavie/screens_and_cubit/home/cubit.dart/status.dart';
import '../../responsive/respnsive.dart';
import '../../widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Cartpage extends StatefulWidget {
  static const String cartpage = 'cartpage';

  int numofItem = 1;
  @override
  _CartpageState createState() => _CartpageState();
}


  
class _CartpageState extends State<Cartpage> {
  @override
  void initState() {
     SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
  ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<HomeCubit, HomeStatus>(
        listener: (context, state) {},
        builder: (context, state) {

          var cubit = HomeCubit.get(context);
            cubit.getPlants();
            return cubit.plant.isEmpty ?
            Column(
            children: [
             SizedBox(
              height: 20,
             ),
            
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "My Cart",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: displayHeight(context) * .18,
              ),
              Container(
                  child: Image.asset('assets/search_screen_icon/Frame.png')),
              SizedBox(
                height: displayHeight(context) * .060,
              ),
              Text(
                "Not found",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  child: Center(
                    child: Text(
                      "Sorry,the keyword you entered cannot be found, please check again or search with anthor keyword.",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                        //  fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),




            ],
          ):
   SafeArea(
        child: Scaffold(
          backgroundColor:Colors.white,
          body: SingleChildScrollView(
            child: Column(children: [
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                      iconSize: 25,
                      color: Colors.black,
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                  SizedBox(
                    width: 100,
                  ),
                  Text(
                    'My Cart',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Container(
                height: displayHeight(context)*.7,
                decoration: BoxDecoration(
                  // color: Colors.red,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                width: double.infinity,
                child:  Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        cubit.plant.length > 0
                            ? SizedBox(
                                width: double.infinity,
                                child: ListView.separated(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) => CartProduct(model: cubit.plant[index]),
                                  separatorBuilder: (context, index) =>
                                      SizedBox(
                                    height: 8.0,
                                  ),
                                  itemCount:  3,
                                  // itemCount: cubit.fromDataList.length>20?cubit.fromDataList.length=8:cubit.fromDataList.length,
                                ),
                              )
                            : Center(child: CircularProgressIndicator()),
                      ],
                    ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Text(
                      'Total',
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 150,
                    ),
                    Text(
                    '629 EGP',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                    ),
                    SizedBox(
    height: 50,
                      ),
                    
                  ],
                ),
              ),
               SizedBox(
    height: 20,
                      ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    padding:
                        EdgeInsets.only(top: 20, bottom: 20, left: 10, right: 10),
                    // shadowColor: Color(0xffFF4500),
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                     
                      Text(
                        'Checkout',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      
                     
                    ],
                  ),
                  onPressed: () {},
                ),
              ),
            ]),
          ),
        ),
      );
        }
    );
  }
}