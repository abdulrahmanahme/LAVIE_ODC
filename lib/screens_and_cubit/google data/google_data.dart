

import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:lavie/screens_and_cubit/profile_screen/cubit/cubit.dart';
import 'package:lavie/screens_and_cubit/profile_screen/cubit/states.dart';

import '../../responsive/respnsive.dart';
import '../../widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

var controllerBio = TextEditingController();
var controllertname = TextEditingController();
var controllertphone = TextEditingController();
var controllertEmail = TextEditingController();

final formkey = GlobalKey<FormState>();

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    
          return SafeArea(
              child: Scaffold(
                  body: SingleChildScrollView(
                      child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                        Stack(children: [
                          Container(
                            height: 300,
                            decoration: BoxDecoration(

                                // color: Colors.black,

                                ),
                            child: Stack(children: [
                              Align(
                                alignment: AlignmentDirectional.center,
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                        'https://image.freepik.com/free-photo/close-up-confident-male-employee-white-collar-shirt-smiling-camera-standing-self-assured-against-studio-background_1258-26761.jpg',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(.9),
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            IconButton(
                                              onPressed: () {},
                                              icon: Icon(
                                                Icons.arrow_back,
                                                color: Colors.white,
                                              ),
                                            ),
                                            IconButton(
                                              onPressed: () {},
                                              icon: Icon(
                                                Icons.more_horiz,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Stack(
                                          alignment: AlignmentDirectional.bottomCenter,
                                          children: [
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                //

                                                SizedBox(
                                                  height: 50,
                                                ),

                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    CircleAvatar(
                                                      // backgroundColor: Theme.of(context).backgroundColor,

                                                      backgroundColor: Colors.black,

                                                      radius: 63,

                                                      child: CircleAvatar(
                                                          radius: 60,
                                                          backgroundImage: NetworkImage(
                                                            'https://image.freepik.com/free-photo/close-up-confident-male-employee-white-collar-shirt-smiling-camera-standing-self-assured-against-studio-background_1258-26761.jpg',
                                                          )),
                                                    ),
                                                  ],
                                                ),

                                                SizedBox(
                                                  height: 35,
                                                ),

                                                Text(
                                                  'Abdo Ahmed',
                                                  style: TextStyle(
                                                    fontSize: 30,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ]),
                          ),
                        ]),
                        Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            width: double.infinity,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 8,
                                ),
                                ColorButton(),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Text(
                                        'Edit profile',
                                        style: TextStyle(
                                          fontSize: 20,
                            
                                          color: Colors.black,
                            
                                          // fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Profile_button(
                                  name: 'Change Name',
                            
                                  // side: BorderSide(width: 2.0, color: Colors.grey,),
                            
                                  primary: Colors.white,
                            
                                  onPrimary: Colors.grey,
                            
                                  press: () {
                                  
                                  },
                            
                                  width: MediaQuery.of(context).size.width * .40,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Profile_button(
                                  name: 'Change Email',
                            
                                  primary: Colors.white,
                            
                                  onPrimary: Colors.grey,
                            
                                  // side: BorderSide(width: 2.0, color: Colors.grey,),
                            
                                  press: () {
                                   
                                  },
                            
                                  width: MediaQuery.of(context).size.width * .40,
                                ),
                              ],
                            ))
                      ]))));
      
  }
}