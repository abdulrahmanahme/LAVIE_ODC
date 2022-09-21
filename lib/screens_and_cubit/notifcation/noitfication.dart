
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class NotifcationPage extends StatelessWidget {
  static const notifcation = 'notifcation';

  @override
  Widget build(BuildContext context, [int index = 3]) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                Text(
                  'notification',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Column(
              children:[
                 NotifcationCard(
              ),
                NotifcationCard(
              ),
                NotifcationCard(
              ),
                NotifcationCard(
              ),
                NotifcationCard(
              ),
              ]
            ),
          ],
        ),
      ),
    );
  }
}




class NotifcationCard extends StatefulWidget {
 


  @override
  _NotifcationCardState createState() => _NotifcationCardState();
}

class _NotifcationCardState extends State<NotifcationCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 3),
        child: Container(
        
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
             
                  blurRadius: 4,
                ),
              ],
              borderRadius: BorderRadius.circular(10),
            ),
          child: Row(children: [
            // Padding(
            //   padding: const EdgeInsets.all(4.0),
            //   child: Container(
            //     height: 100,
            //     width: 100,
            //     decoration: BoxDecoration(
            //       image: DecorationImage(
            //         image: AssetImage(burger[index].image),
            //         fit: BoxFit.fill,
            //       ),
            //       borderRadius: BorderRadius.all(Radius.circular(25)),
            //     ),
            //   ),
            // ),
            SizedBox(
              width: 1,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 6,top: 10 ,left: 5),
                      child: CircleAvatar(
                                        radius: 16.0,
                                        backgroundImage: NetworkImage(
                                            'https://as2.ftcdn.net/v2/jpg/00/67/20/79/1000_F_67207980_5jNk6I3KFlJjOXY73c3FlfvssaxY5N51.jpg'),
                                      ),
                    ),
                                    SizedBox(
                  height: 6,
                ),
                    Padding(
                      padding: const EdgeInsets.only(right: 30,bottom: 1,top: 10,left: 3),
                      child: Text(
                        'Joy Aronold left 6 comments on your post ',
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
               
                Padding(
                  padding: const EdgeInsets.only(right: 40,left: 2,),
                  child: Text(
                    "Yesterday at 11:42 pm",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                 SizedBox(
                  height: 10,
                ),
              ],
            ),
          ]),
              
        ));
  }
}