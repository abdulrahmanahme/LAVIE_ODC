


import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie/model/forget_pass/forget_pass.dart';
import 'package:lavie/model/plants_mdel/plants_model.dart';
import 'package:lavie/screens_and_cubit/auth/login/cubit/states.dart';
import 'package:lavie/screens_and_cubit/qr_screen/cubit/states.dart';
import 'package:lavie/screens_and_cubit/reset_password/cubit/states.dart';

import '../../../../layout/layout_screen.dart';
import '../../../../model/user_data_model/user_data_model.dart';
import '../../../../network/remote/Dio_helper.dart';
import '../../../../network/remote/end_point/end_point.dart';
import 'package:dio/dio.dart';
import 'package:lavie/network/local/shardpre.dart';

class RQCodeCubit extends Cubit<RQCodeStatus> {
  RQCodeCubit() : super(InitialRQCodeStatus());
  static RQCodeCubit get(context) => BlocProvider.of(context);

   
  
  List<PlantsData> plant=[];
  PlantsModel? plantsModel;

  void getPlantId({
    required String? plantId,
  }) {
    emit(RQCodeLoadingState());
    DioHelper.getData(url:"/api/v1/plants/$plantId",
    token: CacheHelper.getData(key:SharedKeys.token)
).then((value) {
      plantsModel = PlantsModel.fromJson(value.data);
   
      emit(RQCodeSuccessState());
    }).catchError((error) {
      // if (error is DioError) {
          print(
            'eeeeeeeeeeeeeeeL${error.response!.data['message']}eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee');
        emit(RQCodeErrorState(error.response!.data['message']));

      
      // }
    });
  }


}