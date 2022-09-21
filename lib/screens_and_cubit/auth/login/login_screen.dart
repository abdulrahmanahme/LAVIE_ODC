import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lavie/screens_and_cubit/auth/login/cubit/cubit.dart';
import 'package:lavie/screens_and_cubit/profile_screen/profile_screen.dart';
import 'package:lavie/screens_and_cubit/reset_password/change_password.dart';

import 'package:lavie/screens_and_cubit/google_sign_in/google_sign_in.dart';

import '../../../layout/layout_screen.dart';
import '../../../network/local/shardpre.dart';
import '../../../responsive/respnsive.dart';
import '../../../widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../sginUp_screen.dart/signUp_screen.dart';
import 'cubit/states.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formkey = GlobalKey<FormState>();
  var controllerpasswordSginUp = TextEditingController();
  var controlleremailSginUp = TextEditingController();
  var controllerpasswordLogin = TextEditingController();
  var controlleremailLogin  = TextEditingController();
  var controllerlastname = TextEditingController();

  var controllerfirstname = TextEditingController();

  var controllerphone = TextEditingController();

  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
       create: (BuildContext context) => LoginCubit(),
  
      child: BlocConsumer<LoginCubit, LoginStatus>(
          listener: (context, state) {



             if (state is LoginErrorState ) {
            showToast(text: state.error, state: ToastStates.ERROR);
          
          }

          if (state is LoginSuccessState) {
            CacheHelper.setData(key:SharedKeys.token , value: '${state.userData!.data!.accessToken}');
            print('ssssssssssssssssssssssssssssssssssssssssssssssss');
              navigateAndFinish(context, LayoutScreen());

              showToast(text: '${state.userData!.message}', state: ToastStates.SUCCESS);
          }
////////////////////////////////////////Login with Google////////

            if (state is LoginErrorWithGoogleState ) {
            showToast(text: state.error, state: ToastStates.ERROR);
          
          }

          if (state is LoginSuccessWithGoogleState) {
            CacheHelper.setData(key:SharedKeys.token , value: '${state.userDatawithGoogle!.data!.accessToken}');
            print('ssssssssssssssssssssssssssssssssssssssssssssssss');
              navigateAndFinish(context, LayoutScreen());

              showToast(text: '${state.userDatawithGoogle!.message}', state: ToastStates.SUCCESS);
          }
            
    
        
          },
          builder: (context, state) {
            var cubit = LoginCubit.get(context);
    
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
                              labelColor: Colors.green,
                              indicatorColor: Colors.green,
                              indicatorWeight: 4,
                              indicatorSize: TabBarIndicatorSize.label,
                              tabs: [
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Container(
                                      child: const Text(
                                   'Login',
                                    style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Container(
                                      child: const Text(
                                         'Sign up',
                                    
                                    style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )),
                                ),
                              ]),
    ////////////////////////////////////// Second page////////
                          Container(
                            height: displayHeight(context) * .56,
                            child: TabBarView(children: [
                             
                              Container(
                                child: Expanded(
                                  child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        FormName(name: 'Email',),
                          defaultFormField(
                          
                                                 
                          controller: controlleremailLogin,
                          validate: (value) {
                            if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                            }
                            return null;
                          },
                          type: TextInputType.emailAddress,
                                                ),
                                
                                SizedBox(
                          height: 10,
                                ),
                                       
                                       FormName(name: 'password'),
                                         defaultFormField(
                                                 
                          suffixIcon: IconButton(
                                onPressed: () {
                                  cubit.changePasswordVisibility();
                                },
                                icon: Icon(
                                  cubit.suffix,
                                )),
                          isPassword: cubit.isPassword,
                          controller: controllerpasswordLogin,
                          validate: (value) {
                            if ( value == null || value.isEmpty) {
                                return 'Please enter your password';
                            }
                            return null;
                          },
                          type: TextInputType.visiblePassword,
                                                ),
                          
                                        // textform(
                                        //   controllerpassword: controllerpassword,
                                          
                                        //     //  obscureText: cubit.isPassword,
                                        //      onPressed: (){
                                        //       cubit.changePasswordVisibility();
                                        //      },
                                        //   validator: (value) {
                                        //     if (value == null || value.isEmpty) {
                                        //       return 'Please enter your password';
                                        //     }
                          
                                        //     return null;
                                        //   },
                                        // ),
                          
                                        // defaultFormField(
                                        //   // isPassword: cubit.isPassword,
                          
                                        //   controller: controllerpassword,
                          
                                        //   validate: (value) {
                                        //     if (value == null || value.isEmpty) {
                                        //       return 'Please enter your password';
                                        //     }
                          
                                        //     return null;
                                        //   },
                          
                                        //   type: TextInputType.visiblePassword,
                                        // ),
                          
                                        SizedBox(
                                          height: 20,
                                        ),
                          
                          state is LoginLoadingState?
            CircularProgressIndicator(
              color: Colors.green,
            ):

           
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
                      
                      cubit.userLogin(
                                                email: controlleremailLogin.text,
                                                password: controllerpasswordLogin .text,
                                              );
              
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
                              ),
                               SingUp(
                                  controllerfirstname: controllerfirstname,
                                  controlleremail: controlleremailSginUp,
                                  controllerpassword: controllerpasswordSginUp,
                                controllerlastName: controllerlastname ,
                                  formkey: formkey),
                            ]),
                          ),
    
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                    margin: const EdgeInsets.only(
                                        left: 10.0, right: 10.0),
                                    child: Divider(
                                      color: Colors.black,
                                      height: 36,
                                    )),
                              ),
                              Text(
                                "or Continue with",
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              Expanded(
                                child: Container(
                                    margin: const EdgeInsets.only(
                                        left: 10.0, right: 10.0),
                                    child: Divider(
                                      color: Colors.black,
                                      height: 36,
                                    )),
                              ),
                            ],
                          ),
        
    Row(
      children: [
          InkWell(
            onTap: (){
              navigateTo(context, ChangePassword());
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                                    "Did you forget your password ?",
                                    style: TextStyle(
                                      color: Colors.green,
                                    ),
                                  ),
            ),
          ),

      ],
    ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: (){
                                  cubit.signIn(context);
                                },
                                child: Container(
                                  height: 60,
                                  width: 50,
                                  child: Image.asset(
                                    'assets/image/Google.png',
                                  ),
                                ),
                              ),
                              SizedBox(
width: 20,
                              ),
                                 InkWell(
                                onTap: (){

                                 
                                },
                                child:  SizedBox(
                                height: 40,
                                width: 30,
                                child: Image.asset(
                                  'assets/image/Facebook(1).png',
                                ),
                              ),
                                 ),
                                
                             
                            ],
                          ),
                          // SizedBox(height: 1),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: 90,
                                width: 100,
                                child: Image.asset('assets/image/image2.png'),
                              ),
                            ],
                          ),
                        ]),
                  ),
                ),
              ),
            );
          }),
    );
    
  }
  
}

 
class FormName extends StatelessWidget {
  FormName({
   this.name
  }) ;
  String?name;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
              left: 23, top: 10, bottom: 5),
          child: Text(
            name!,
            style: TextStyle(
                // color: Color(0xff1A2552),

                fontSize: 18,
                color: Colors.grey[600],
                fontWeight: FontWeight.w700,
                fontFamily: 'jannah'),
          ),
        ),
      ],
    );
  }
}

class textform extends StatelessWidget {
  textform({
    required this.controllerpassword,
    this.validator,
  this.onPressed,
  this.suffix,
  // this.obscureText,

  }) ;

  final TextEditingController controllerpassword;
  String? Function(String?)? validator;
  IconData? suffix;
  void Function()? onPressed;
  //  bool? obscureText ; 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10,right: 10),
      child: TextFormField(
        controller: controllerpassword,

        keyboardType: TextInputType.visiblePassword,

        // onChanged: (value) {

        //   onChange!;

        // },
        // obscureText: obscureText!,
        validator: validator!,

        // style: style,

        decoration: InputDecoration(
          // labelText: label,

          // prefixIcon: Icon(

          //   prefix,

          //   color: Colors.black,

          // ),

          // suffixIcon: ,

          suffixIcon: IconButton(
              icon: Icon(
                suffix,
              ),
              onPressed: () {
                onPressed;
              }),

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
