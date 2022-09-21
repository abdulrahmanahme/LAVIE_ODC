

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../responsive/respnsive.dart';
import '../../widgets/widgets.dart';
class SingleBlogsScreen extends StatefulWidget {
  @override
  _SingleBlogsScreenState createState() => _SingleBlogsScreenState();
}


class _SingleBlogsScreenState extends State<SingleBlogsScreen> {
  @override
  void initState() {
     SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
  ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(children: [
          Container(
              height: displayHeight(context)*.3,
              width: displayWidth(context)*1,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image:  AssetImage('assets/Rectangle15.png'),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
          
             Column(
                children: [
              
 Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: Text(
                  '5 simple taps to treet plants',
                    style: TextStyle(
                    fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: Text(
                  'leaf,in batany, any unsual leaf',
                    style: TextStyle(
                    fontSize: 25,
                      color: Colors.grey,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: Text(
                  'leaf,in batany, any unsual leaf',
                    style: TextStyle(
                    fontSize: 25,
                      color: Colors.grey,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                 Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: Text(
                  'leaf,in batany, any unsual leaf',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.grey,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                 Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: Text(
                  'leaf,in batany, any unsual leaf',
                    style: TextStyle(
                     fontSize: 25,
                      color: Colors.grey,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                 Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: Text(
                  'leaf,in batany, any unsual leaf',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.grey,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                  // CartProduct(),
                ],
              )
            
            
            
            
          ]),
        ),
      ),
    );
  }
}