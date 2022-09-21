
import 'package:flutter/material.dart';
import 'package:lavie/screens_and_cubit/auth/login/login_screen.dart';
import 'package:lavie/screens_and_cubit/reset_password/create_password.dart';
import 'package:lavie/screens_and_cubit/reset_password/cubit/cubit.dart';
import 'package:lavie/screens_and_cubit/reset_password/cubit/states.dart';
import 'package:lavie/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPassword extends StatelessWidget {
  // static const resetPassword = 'resetPassword';
  var controllerOTP = TextEditingController();
  var controllerEamil = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return   BlocProvider<ForgetPassword>(
       create: (BuildContext context) => ForgetPassword(),
  
      child: BlocConsumer<ForgetPassword, ForgetPassworLavieStatus>(
          listener: (context, state) {

             if (state is OTPSuccessState) {
         
          showToast(text: '${state.forgetPass!.message}', state: ToastStates.SUCCESS);
          navigateTo(context, CreatePassword());
        } else{
          if (state is OTPErrorState) {
          showToast(text: state.error, state: ToastStates.ERROR);
        }

        }

          },
          builder: (context, state) {
      var cubit = ForgetPassword.get(context);
    
            return Scaffold(
              backgroundColor: Colors.white,
              body: SingleChildScrollView(
                  child: Column(children: [
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                        iconSize: 30,
                        color: Colors.grey,
                        icon: Icon(Icons.arrow_back_ios_rounded),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                    SizedBox(
                      width: 50,
                    ),
                    //
                  ],
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Check your Email',
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'We have sent a OTP to your email',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Form(
                      key:formkey ,
                       child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                         children: [
                         Padding(
                                   padding: const EdgeInsets.all(10),
                                   child: Row(
                                     mainAxisAlignment: MainAxisAlignment.start,
                                     children: const [
                                       Text(
                        'Email address',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'jannah'),
                                       ),
                                     ],
                                   ),
                                 ),
                     
                                 Padding(
                                   padding: const EdgeInsets.only(
                                     left: 10,
                                     right: 15,
                                   ),
                                   child: defaultFormField(
                                     // suffixIcon: IconButton(
                                     //     onPressed: () {
                                     //       // cubit.changePasswordVisibility();
                                     //     },
                                     //     icon: Icon(
                                     //       cubit.suffix,
                                     //     )
                                     //     ),
                                     // isPassword: cubit.isPassword,
                                     controller: controllerOTP,
                                     validate: (value) {
                                       if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                                       }
                                       return null;
                                     },
                                     type: TextInputType.visiblePassword,
                                   ),
                                 ),
                     
                     
                     
                      Padding(
                                   padding: const EdgeInsets.all(10),
                                   child: Row(
                                     mainAxisAlignment: MainAxisAlignment.start,
                                     children: const [
                                       Text(
                        'OTP',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'jannah'),
                                       ),
                                     ],
                                   ),
                                 ),
                     
                                 Padding(
                                   padding: const EdgeInsets.only(
                                     left: 10,
                                     right: 15,
                                   ),
                                   child: defaultFormField(
                                   
                                     controller:controllerEamil,
                                     validate: (value) {
                                       if (value == null || value.isEmpty) {
                        return 'Please enter your OTP';
                                       }
                                       return null;
                                     },
                                     type: TextInputType.visiblePassword,
                                   ),
                                 ),
                     
                         ],
                       ),
                     ),
                   ),
                
                SizedBox(
                  height: 15,
                ),
                  ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  padding:
                      EdgeInsets.only(top: 20, bottom: 20, left: 100, right: 110),
                  // shadowColor: Color(0xffFF4500),
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  'Send OTP',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {


                    if (formkey.currentState!.validate()) {
                     cubit.sendEmailAndOTP(
                      oTP: controllerOTP.text,
                      email:controllerEamil.text, 
                     );
                     

                      }
                  
                },
              ),
    
              ])),
            );
          }),
    );
  }
}
