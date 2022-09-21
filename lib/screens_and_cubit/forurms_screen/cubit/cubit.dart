import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie/model/form_model/form_model.dart';
import 'package:lavie/screens_and_cubit/auth/login/cubit/states.dart';
import 'package:lavie/screens_and_cubit/forurms_screen/cubit/states.dart';
import 'package:lavie/network/local/shardpre.dart';

import '../../../../layout/layout_screen.dart';
import '../../../../model/user_data_model/user_data_model.dart';
import '../../../../network/remote/Dio_helper.dart';
import '../../../../network/remote/end_point/end_point.dart';
import 'package:dio/dio.dart';

class ForumCubit extends Cubit<ForumLavieStatus> {
  ForumCubit() : super(InitialForumStatus());
  static ForumCubit get(context) => BlocProvider.of(context);


  FormModel? formModel;
  List<ForumData> fromDataList = [];

  List<ForumLikes> forumLikes = [];
  List<ForumComments> forumComments = [];
  // ForumLikes ?forumLikes;
  int index = 0;
  ForumData? forumData;
////////////////////
  FormModel? myformModel;
  ForumData? myforumData;

  List<ForumData> myfromDataList = [];

  List<ForumLikes> myforumLikes = [];
  List<ForumComments> myforumComments = [];

  void getForums() {
    emit(ForumLoadingState());
    DioHelper.getData(url: Forums, token:CacheHelper.getData(key:SharedKeys.token)
).then((value) {
      formModel = FormModel.fromJson(value.data);
      forumData = ForumData.fromJson(value.data);
      /////////////get all forums
      for (var element in formModel!.data!) {
        fromDataList.add(element);
      }
      /////////////get all forumLikes

      for (var element in forumData!.forumLikes!) {
        print(
            'llllllllllllllllllL  here ${forumData!.forumLikes!.length.toString()}e');

        forumLikes.add(element);
      }
      /////////////get all forumComments

      for (var element in forumData!.forumComments!) {
        forumComments.add(element);
      }

      emit(ForumSuccessState());
    }).catchError((error) {
      if (error is DioError) {
        print(
            'eeeeeeeeeeeeeeeL${error.response!.data['message']}eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee');
        emit(ForumErrorState(error.response!.data['message']));
      }
    });
  }

  void getMyForums() {
    emit(ForumLoadingState());
    DioHelper.getData(url: getMyPost, token:CacheHelper.getData(key:SharedKeys.token)
).then((value) {
      myformModel = FormModel.fromJson(value.data);
      myforumData = ForumData.fromJson(value.data);
      /////////////get my  all forums on my post forums
      for (var element in myformModel!.data!) {
        myfromDataList.add(element);
      }
      /////////////get my  all  forumLikes on my post

      for (var element in myforumData!.forumLikes!) {
        print(
            'llllllllllllllllllL  here ${forumData!.forumLikes!.length.toString()}e');

        myforumLikes.add(element);
      }
      /////////////get my  all forumComments on my post

      for (var element in myforumData!.forumComments!) {
        myforumComments.add(element);
      }

      emit(ForumSuccessState());
    }).catchError((error) {
      if (error is DioError) {
        print(
            'eeeeeeeeeeeeeeeL${error.response!.data['message']}eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee');
        emit(ForumErrorState(error.response!.data['message']));
      }
    });
  }
}
