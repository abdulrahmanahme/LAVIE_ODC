import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie/screens_and_cubit/auth/sginUp_screen.dart/Cubit/states.dart';

import '../../../../model/user_data_model/user_data_model.dart';
import '../../../../network/remote/Dio_helper.dart';
import '../../../../network/remote/end_point/end_point.dart';
import 'package:dio/dio.dart';


class SginUpCubit extends Cubit<SginUpStatus> {
  SginUpCubit() : super(InitialSginUpStatus());
  static SginUpCubit get(context) => BlocProvider.of(context);

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = false;
  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(SginUpChangePasswordVisibilityState());
  }

  UserData? userData;

  void userSginUp({
    required String? firstName,
    required String? lastName,
    required String? email,
    required String? password,
  }) {
    emit(SginUpLoadingState());
    DioHelper.postData(url: REGISTER, data: {
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "password": password,
    }).then((value) {
      userData = UserData.fromJson(value.data);
      print('LLLLLL ${userData!.data!.accessToken!}  LL');
      print('LLLLLL ${userData!.data!.user!.email}  LL');
      print('LLLLLL ${userData!.data!.user!.firstName}  LL');
      print('LLLLLL ${userData!.data!.user!.lastName}  LL');

      emit(SginUpSuccessState());
    }).catchError((error) {
      if (error is DioError) {
        print(
            'eeeeeeeeeeeeeeeL${error.response!.data['message']}eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee');
      }
      emit(SginUpErrorState(error.response!.data['message']));
    });
  }
}
