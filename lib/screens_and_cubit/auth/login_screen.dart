
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:lavie/screens_and_cubit/auth/signUp_screen.dart';

import '../../responsive/respnsive.dart';
import '../../widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formkey = GlobalKey<FormState>();

  var controllerpassword = TextEditingController();

  var controlleremail = TextEditingController();

  var controllerconfirmpassword = TextEditingController();

  var controllerfullname = TextEditingController();

  var controllerphone = TextEditingController();
 void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
  ]);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // return BlocConsumer<LavieCubitApp, LoginLavieCubitStatus>(
    //   listener: (context, state) {},
    //   builder: (context, state) {
    //     // var cubit = LavieCubit.get(context);

        return DefaultTabController(
          length: 2,
          child: Scaffold(
            backgroundColor: Color(0xffFFFFFF),
          
            body: SingleChildScrollView(
              child: Form(
                key: formkey,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                height: 110,
                                width: 100,
                                // color:Colors.amber,
        child: Image.asset('assets/image/image1.png'),
                              ),
                            ],
                          ),
                          
                           Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 40,
                                width: 130,
                                // color:Colors.amber,
        child: Image.asset('assets/image/Group1.png'),
                              ),
                            ],
                          ),
                        
                      
                      
        
        
        SizedBox(
          height: 10,
        ),
                   
                   TabBar(
                     unselectedLabelColor: Colors.grey,
                      labelColor:  Colors.green,
                      indicatorColor: Colors.green,
                      indicatorWeight: 4,
                      indicatorSize:TabBarIndicatorSize.label,
                     tabs:[
                         Container(
                            child:const Text(
                          'Sign up',
                          style: TextStyle(
                            fontSize: 19,
                          
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                        Container(
                            child:const  Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 19,
                            
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                        
                     ]
                   ),
////////////////////////////////////// Second page////////
                     Container(
                      height:displayHeight(context)*.59,
                       child: TabBarView(children: [
Expanded(child: SingUp(controllerfullname: controllerfullname, controlleremail: controlleremail, controllerpassword: controllerpassword, controllerconfirmpassword: controllerconfirmpassword, formkey: formkey)),


                        Expanded(
                          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 23, top: 10, bottom: 5),
                                        child: Text(
                                          'Email',
                                          style: TextStyle(
                        
                          // color: Color(0xff1A2552),
                        
                          fontSize: 18,
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w700,
                          fontFamily: 'jannah'),
                                        ),
                                      ),
                                    ],
                                  ),
                        
                                  // SizedBox(
                        
                                  //   height: 8,
                        
                                  // ),
                        
                                  defaultFormField(
                                    // prefix: Icons.email,
                        
                                    controller: controlleremail,
                        
                                    validate: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your email';
                                      }
                        
                                      return null;
                                    },
                        
                                    type: TextInputType.emailAddress,
                                  ),
                        
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'Password',
                                          style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'jannah'),
                                        ),
                                      ),
                                    ],
                                  ),
                        
                                  defaultFormField(
                                    // isPassword: cubit.isPassword,
                        
                                    controller: controllerpassword,
                        
                                    validate: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your password';
                                      }
                        
                                      return null;
                                    },
                        
                                    type: TextInputType.visiblePassword,
                                  ),
                        
                                  SizedBox(
                                    height: 20,
                                  ),
                        
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Color(0XFF1ABC00),
                        
                                      padding:
                                          EdgeInsets.only(top: 20, bottom: 20, left: 140, right: 140),
                        
                                      // shadowColor: Color(0xffFF4500),
                        
                                      elevation: 6,
                        
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    child: Text(
                                      'Login',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    onPressed: () {
                                      if (formkey.currentState!.validate()) {
                                        // cubit.userLogin(
                        
                                        //   email: controlleremail.text,
                        
                                        //   password: controllerpassword.text,
                        
                                        // );
                        
                                      }
                        
                                      // Navigator.push(
                        
                                      //   context,
                        
                                      //   MaterialPageRoute(
                        
                                      //       builder: (context) => SocialLayout()),
                        
                                      // );
                                    },
                                  ),
                                ]),
                        ),
                       ]),
                     ),


                        Row(
                          children: [
                              Expanded(
                                      child:  Container(
                        margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                        child: Divider(
                          color: Colors.black,
                          height: 36,
                        )),
                                    ),
                                    Text("or Continue with" ,
                                    style:TextStyle(
                                    color:Colors.grey,
                            
                            
                                    ) ,
                                    ),
                                    Expanded(
                                      child:  Container(
                        margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                        child: Divider(
                          color: Colors.black,
                          height: 36,
                        )),
                            
                        
                            
                      ),
                                     
                                       
                                      ],
                                    ),
                            
                            
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 60,
                                  width: 60,
                            child: Image.asset('assets/image/Google.png',
                             
                            ),
                                ),
                                Container(
                                  height: 40,
                                  width: 40,
                            child: Image.asset('assets/image/Facebook(1).png',
                             
                            ),
                                ),
                               
                              
                              ],
                            ),
                             SizedBox(height: 1) ,
                            Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                              
                             height: 130,
                                width: 150,
                              
        child: Image.asset('assets/image/image2.png'),
                              ),
                            ],
                          ),
                        
                  
                
                    
                          
                        

                  ]
                      ),

              ),
            ),
          ),
        );
        
        
  }
}




