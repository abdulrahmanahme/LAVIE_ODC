import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie/model/peoduct_model/product_model.dart' as seedData;
import 'package:lavie/model/plants_mdel/plants_model.dart';
import 'package:lavie/model/seed_,model.dart/seed_model.dart';
import 'package:lavie/model/tool_model/tool_model.dart';
import 'package:lavie/screens_and_cubit/home/cubit.dart/status.dart';
import 'package:lavie/network/local/shardpre.dart';

import '../../../../layout/layout_screen.dart';
import '../../../../model/user_data_model/user_data_model.dart' as seed;
import '../../../../network/remote/end_point/end_point.dart';
import 'package:dio/dio.dart';

import '../../../model/peoduct_model/product_model.dart' as model;
import '../../../network/remote/Dio_helper.dart';

class HomeCubit extends Cubit<HomeStatus> {
  HomeCubit() : super(InitialHomeStatus());
  static HomeCubit get(context) => BlocProvider.of(context);

  model.ProductsModel? productsModel;
  SeedModel? seedModel;
  ToolsModel? toolsModel;
  PlantsModel? plantsModel;
  int index = 0;
  List<model.DataProduct> proudcts = [];
  List<SeedData> seed = [];
  List<ToolsData> tool = [];
  List<PlantsData> plant=[];


  void getProducts() {
    emit(HomeLoadingState());
    DioHelper.getData(url: PRODUCTS, token: CacheHelper.getData(key:SharedKeys.token)
).then((value) {
      productsModel = model.ProductsModel.fromJson(value.data);

      for (var elrment in productsModel!.data!) {
        proudcts.add(elrment);
      }

      emit(HomeSuccessState());
    }).catchError((error) {
      if (error is DioError) {
        print(
            'eeeeeeeeeeeeeeeL${error.response!.data['message']}eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee');
        emit(HomeErrorState(error.response!.data['message']));
      }
    });
  }

  void getSeeds() {
    emit(HomeLoadingState());
    DioHelper.getData(url: Seeds, token:CacheHelper.getData(key:SharedKeys.token)
).then((value) {
      seedModel = SeedModel.fromJson(value.data);

      for (var elrment in seedModel!.data!) {
        seed.add(elrment);
      }

      emit(HomeSuccessState());
    }).catchError((error) {
      if (error is DioError) {
        print(
            'eeeeeeeeeeeeeeeL${error.response!.data['message']}eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee');
        emit(HomeErrorState(error.response!.data['message']));
      }
    });
  }


void getPlants() {
    emit(HomeLoadingState());
    DioHelper.getData(url: Plants, token:CacheHelper.getData(key:SharedKeys.token)
).then((value) {
     
      plantsModel = PlantsModel.fromJson(value.data);
  
      for (var element in plantsModel!.data!) {
        plant.add(element);
      }

      emit(HomeSuccessState());
    }).catchError((error) {
      if (error is DioError) {
        print(
            'eeeeeeeeeeeeeeeL${error.response!.data['message']}eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee');
        emit(HomeErrorState(error.response!.data['message']));
      }
    });
  }
  void getTools() {
    emit(HomeLoadingState());
    DioHelper.getData(url: Tools, token:CacheHelper.getData(key:SharedKeys.token)
).then((value) {
      toolsModel = ToolsModel.fromJson(value.data);

      // toolsModel!.data!.forEach((element) {
      //    tool.add(element);

      // });

      for (var element in toolsModel!.data!) {
        tool.add(element);
      }

      emit(HomeSuccessState());
    }).catchError((error) {
      if (error is DioError) {
        print(
            'eeeeeeeeeeeeeeeL${error.response!.data['message']}eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee');
        emit(HomeErrorState(error.response!.data['message']));
      }
    });
  }
}
