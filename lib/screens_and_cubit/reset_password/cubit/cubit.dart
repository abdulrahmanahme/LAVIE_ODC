

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie/model/forget_pass/forget_pass.dart';
import 'package:lavie/screens_and_cubit/auth/login/cubit/states.dart';
import 'package:lavie/screens_and_cubit/reset_password/cubit/states.dart';

import '../../../../layout/layout_screen.dart';
import '../../../../model/user_data_model/user_data_model.dart';
import '../../../../network/remote/Dio_helper.dart';
import '../../../../network/remote/end_point/end_point.dart';
import 'package:dio/dio.dart';

class ForgetPassword extends Cubit<ForgetPassworLavieStatus> {
  ForgetPassword() : super(InitialForgetPasswordStatus());
  static ForgetPassword get(context) => BlocProvider.of(context);

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = false;
  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(ForgetPasswordVisibilityState());
  }

  
  ForgetPass ?forgetPass;

  void sendEmail({
    required String? email,
  }) {
    emit(ForgetPasswordLoadingState());
    DioHelper.postData(url:getpassword, data: {
      "email": email,
    }).then((value) {
    forgetPass = ForgetPass.fromJson(value.data);
   
      emit(ForgetPasswordSuccessState());
    }).catchError((error) {
      // if (error is DioError) {
          print(
            'eeeeeeeeeeeeeeeL${error.response!.data['message']}eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee');
        emit(ForgetPasswordErrorState(error.response!.data['message']));

      
      // }
    });
  }


  void sendEmailAndOTP({
    required String? email,
    required String? oTP,

  }) {
    emit(OTPLoadingState());
    DioHelper.postData(url:otpandEmail, data: {
      "email": email,
      "otp": oTP,
    }).then((value) {
    forgetPass = ForgetPass.fromJson(value.data);
   
      emit(OTPSuccessState());
    }).catchError((error) {
      // if (error is DioError) {
          print(
            'eeeeeeeeeeeeeeeL${error.response!.data['message']}eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee');
        emit(OTPErrorState(error.response!.data['message']));

      
      // }
    });
  }

   void createNewPASS({
    required String? email,
    required String? oTP,
    required String? newPassword,

  }) {
   
    emit(CreateNewPasswordLoadingState());
    DioHelper.postData(url:createNewPass, data: {
      "email": email,
      "otp": oTP,
      "password": newPassword,
    }).then((value) {
    forgetPass = ForgetPass.fromJson(value.data);
   
      emit(CreateNewPasswordSuccesstate());
    }).catchError((error) {
      // if (error is DioError) {
        
          print(
            'eeeeeeeeeeeeeeeL${error.response!.data['message']}eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee');
        emit(CreateNewPasswordErroetate(error.response!.data['message']));

      
      // }
    });
  }
}
