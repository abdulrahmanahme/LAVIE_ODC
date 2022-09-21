import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie/network/local/shardpre.dart';
import 'package:lavie/responsive/respnsive.dart';
import 'package:lavie/screens_and_cubit/reset_password/create_password.dart';
import 'package:lavie/screens_and_cubit/reset_password/cubit/cubit.dart';
import 'package:lavie/screens_and_cubit/reset_password/cubit/states.dart';
import 'package:lavie/screens_and_cubit/reset_password/reset_password.dart';
import 'package:lavie/widgets/widgets.dart';

class ChangePassword extends StatelessWidget {
  final formkey = GlobalKey<FormState>();
  var controllerEamil = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ForgetPassword>(
      create: (BuildContext context) => ForgetPassword(),
      child: BlocConsumer<ForgetPassword, ForgetPassworLavieStatus>(
          listener: (context, state) {
      

        if (state is ForgetPasswordSuccessState) {
         
          showToast(text: '${state.forgetPass!.message}', state: ToastStates.SUCCESS);
          navigateTo(context, ResetPassword());
        } else{
          if (state is ForgetPasswordErrorState) {
          showToast(text: state.error, state: ToastStates.ERROR);
        }

        }
      }, builder: (context, state) {
        var cubit = ForgetPassword.get(context);
        return Scaffold(
          backgroundColor: Color(0xffFFFFFF),
          appBar: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            title: Text(
              'Forgot Password',
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
          body: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Reset password',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'jannah'),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      ' Enter the email associated with your account and we\'ll send an email with instructions to reset your password',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'jannah'),
                    ),
                  ),

                  //                 SizedBox(
                  // height: displayHeight(context)*.1,
                  //                 ),
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
                      controller: controllerEamil,
                      validate: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email address';
                        }
                        return null;
                      },
                      type: TextInputType.emailAddress,
                    ),
                  ),

                  SizedBox(
                    height: 20,
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
                      'Send instructions',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        cubit.sendEmail(email: controllerEamil.text);

                      }

                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => LoginScreen()));
                      // if (formkey.currentState!.validate()) {
                      //   cubit.userLogin(
                      //     email: controlleremail.text,
                      //     password: controllerpassword.text,
                      //   );
                      // }
                    },
                  ),

                  SizedBox(
                    height: 20,
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
