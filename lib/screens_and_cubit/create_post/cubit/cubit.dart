

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie/model/form_model/form_model.dart';
import 'package:lavie/screens_and_cubit/auth/login/cubit/states.dart';
import 'package:lavie/screens_and_cubit/create_post/cubit/states.dart';
import 'package:lavie/screens_and_cubit/forurms_screen/cubit/states.dart';

import 'package:lavie/network/local/shardpre.dart';



import '../../../../layout/layout_screen.dart';
import '../../../../model/user_data_model/user_data_model.dart';
import '../../../../network/remote/Dio_helper.dart';
import '../../../../network/remote/end_point/end_point.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:convert';
import 'dart:io' as Io;
import 'dart:io';
import 'dart:async';
import 'dart:typed_data';
class CreatePostCubit extends Cubit<CreatePostStatus> {
  CreatePostCubit () : super(InitialCreatePostStatus());
  static CreatePostCubit  get(context) => BlocProvider.of(context);
          // var cubit = ForumCubit.get(context);


XFile? profileImage;
  List<int>? bytes;
  String? base64Image;
    File? postPhone;
  void removePostImage() {
    postPhone = null;
    emit(RemovePostImagePickedState());
  }

  Future<void> getPostImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      postPhone = File(pickedFile.path);
       bytes = postPhone!.readAsBytesSync();
      base64Image = base64Encode(bytes!);
      print("$base64Image");

       emit(GetImageSuccessState());
    } else {
      print('NO Image print');
            emit(GetImageErrorState());

    }
  }


void createPost({
    required String? title,
    required String? description,
    required String? imageBase64,

  }) {
    emit(CreatePostLoadingState());
    DioHelper.postData(url: create_a_Post, data: {
      "title": title,
        "description": description,
        "imageBase64": imageBase64,
    },
    token: CacheHelper.getData(key:SharedKeys.token),

    ).then((value) {   
      // getMyForums();

      emit(CreatePostSuccessState());

    }).catchError((error) {
      if (error is DioError) {
        print(
            'eeeeeeeeeeeeeeeL${error.response!.data['message']}eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee');
        emit(CreatePostErrorState(error.response!.data['message']));
      }
    });
  }


}