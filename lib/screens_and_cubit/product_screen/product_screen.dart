
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProductScreen extends StatefulWidget {

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
     child:  Text(
                                        'GAREDNIA PLANT',
                                        style: TextStyle(
                                          // fontFamily: 'Lobster-Regular',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          // color:Colors.accents,
                                        ),
                                      ),
                                    
    );
  }
}