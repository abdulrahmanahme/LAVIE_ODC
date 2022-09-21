import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie/screens_and_cubit/auth/login/cubit/states.dart';
import 'package:lavie/screens_and_cubit/google_sign_in/google_sign_in.dart';
import 'package:lavie/widgets/widgets.dart';

import '../../../../layout/layout_screen.dart';
import '../../../../model/user_data_model/user_data_model.dart';
import '../../../../network/remote/Dio_helper.dart';
import '../../../../network/remote/end_point/end_point.dart';
import 'package:dio/dio.dart';

class LoginCubit extends Cubit<LoginStatus> {
  LoginCubit() : super(InitialLoginStatus());
  static LoginCubit get(context) => BlocProvider.of(context);

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = false;
  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(LoginChangePasswordVisibilityState());
  }

  UserData? userData;
  UserData? userDatawithGoogle;


  void userLogin({
    required String? email,
    required String? password,
  }) {
    emit(LoginLoadingState());
    DioHelper.postData(url: LOGIN, data: {
      "email": email,
      "password": password,
    }).then((value) {
      userData = UserData.fromJson(value.data);
      print('LLLLLL ${userData!.data!.accessToken!}  LL');
      print('LLLLLL ${userData!.data!.user!.email}  LL');
      print('LLLLLL ${userData!.data!.user!.firstName}  LL');
      emit(LoginSuccessState());
    }).catchError((error) {
      if (error is DioError) {
        print(
            'eeeeeeeeeeeeeeeL${error.response!.data['message']}eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee');
        emit(LoginErrorState(error.response!.data['message']));
      }
    });
  }

  void loginWithGoogle({
    required String? email,
    required String? id,
    required String? name,
    required String? image,
  }) {
    emit(LoginLoadinWithGooglegState());
    DioHelper.postData(url: googleLogin, data: {
      "id": id,
      "email": email,
      "firstName": name,
      "lastName": " ",
      "picture": image,
    }).then((value) {
      userDatawithGoogle = UserData.fromJson(value.data);
      print('LLLLLL ${userDatawithGoogle!.data!.accessToken!}  LL');
      print('LLLLLL ${userDatawithGoogle!.data!.user!.email}  LL');
      print('LLLLLL ${userDatawithGoogle!.data!.user!.firstName}  LL');
      emit(LoginSuccessWithGoogleState());
    }).catchError((error) {
      if (error is DioError) {
        print(
            'eeeeeeeeeeeeeeeL${error.response!.data['message']}eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee');
        emit(LoginErrorWithGoogleState(error.response!.data['message']));
      }
    });
  }

  Future signIn(  BuildContext context
) async {
    final user = await GoogleSignInApi.loginWithGoogle();

    if (user == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Sign in Failed')));
    } else {
      loginWithGoogle(
        email: user.email,
        id: user.id,
        name: user.displayName,
        image: user.photoUrl,
      );
      print('Name:${user.displayName}  NNNNNNNNNN');
      print('Email:${user.email} EEEEEEEEE');
      print('PHOTO:${user.photoUrl} PPPPPPPPPPPPPPP');
      print('ID:${user.id} PPPPPPPPPPPPPPP');

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Sign in Scucess')));

    }
  }

}
