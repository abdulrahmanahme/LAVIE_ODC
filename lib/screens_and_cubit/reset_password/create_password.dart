import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie/responsive/respnsive.dart';
import 'package:lavie/screens_and_cubit/auth/login/login_screen.dart';
import 'package:lavie/screens_and_cubit/reset_password/cubit/cubit.dart';
import 'package:lavie/screens_and_cubit/reset_password/cubit/states.dart';
import 'package:lavie/widgets/widgets.dart';

class CreatePassword extends StatelessWidget {
  final formkey = GlobalKey<FormState>();
  var controllerpassword = TextEditingController();
  var controlleremail = TextEditingController();
  var controllerOTP = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ForgetPassword>(
      create: (BuildContext context) => ForgetPassword(),
      child: BlocConsumer<ForgetPassword, ForgetPassworLavieStatus>(
          listener: (context, state) {
        if (state is CreateNewPasswordSuccesstate) {
          showToast(
              text: '${state.forgetPass!.message}', state: ToastStates.SUCCESS);
          navigateTo(context, LoginScreen());
        } else {
          if (state is CreateNewPasswordErroetate) {
            showToast(text: state.error, state: ToastStates.ERROR);
          }
        }
      }, builder: (context, state) {
        var cubit = ForgetPassword.get(context);

        return Scaffold(
          backgroundColor: Color(0xffFFFFFF),
          appBar: AppBar(
            backgroundColor: Colors.white,
            // centerTitle: true,
            title: Text(
              'Back',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'jannah'),
            ),
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, size: 20, color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            ),
            bottomOpacity: 0.0,
            elevation: 0,
          ),
          body: Form(
            key: formkey,
            child: SingleChildScrollView(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Create a new password',
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Your new password must be different from previous used passwords',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        FormName(
                          name: 'Email',
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                            right: 15,
                          ),
                          child: defaultFormField(
                            controller: controlleremail,
                            validate: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              }
                              return null;
                            },
                            type: TextInputType.emailAddress,
                          ),
                        ),
                        FormName(
                          name: 'OTP',
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
                  FormName(
                    name: 'Password',
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 15,
                    ),
                    child: defaultFormField(
                      suffixIcon: IconButton(
                          onPressed: () {
                            cubit.changePasswordVisibility();
                          },
                          icon: Icon(
                            cubit.suffix,
                          )),
                      isPassword: cubit.isPassword,
                      controller: controllerpassword,
                      validate: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                      type: TextInputType.visiblePassword,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      padding: EdgeInsets.only(
                          top: 20, bottom: 20, left: 100, right: 110),
                      // shadowColor: Color(0xffFF4500),
                      elevation: 6,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      'Create new Password',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        cubit.createNewPASS(email: controlleremail.text, oTP: controllerOTP.text, newPassword: controllerpassword.text);
                      }

                     
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
