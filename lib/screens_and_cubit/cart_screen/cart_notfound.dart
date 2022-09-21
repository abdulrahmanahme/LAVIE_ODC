
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../responsive/respnsive.dart';
import '../../widgets/widgets.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
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
          ),
        ),
      ),
    );
  }
}
