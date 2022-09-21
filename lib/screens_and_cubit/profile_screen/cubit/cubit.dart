import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie/model/form_model/form_model.dart';
import 'package:lavie/model/mdel_user.dart/my_data_model.dart';
import 'package:lavie/screens_and_cubit/auth/login/cubit/states.dart';
import 'package:lavie/screens_and_cubit/forurms_screen/cubit/states.dart';
import 'package:lavie/screens_and_cubit/profile_screen/cubit/states.dart';
import 'package:lavie/widgets/widgets.dart';
import 'package:lavie/network/local/shardpre.dart';

import '../../../../layout/layout_screen.dart';
import '../../../../model/user_data_model/user_data_model.dart';
import '../../../../network/remote/Dio_helper.dart';
import '../../../../network/remote/end_point/end_point.dart';
import 'package:dio/dio.dart';

class ProfileCubit extends Cubit<ProfileLavieStatus> {
  ProfileCubit() : super(InitialProfileStatus());
  static ProfileCubit get(context) => BlocProvider.of(context);

  

  MYDataModel? myDataModel;

  void changeMyData(
      {String? firstName,
      String? lastName,
      String? email,
      String? imageBase64}) {
    emit(ProfileLoadingState());
    DioHelper.patchData(
            url: changeData,
            data: {
              "firstName": firstName,
              "lastName": lastName,
              "email": email,
              "imageBase64": imageBase64,
            },
            token: CacheHelper.getData(key:SharedKeys.token)
)
        .then((value) {
      emit(ProfileSuccessState());
    }).catchError((error) {
      if (error is DioError) {
        print(
            'eeeeeeeeeeeeeeeL${error.response!.data['message']}eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee');
        emit(ProfileErrorState(error.response!.data['message']));
      }
    });
  }

  void getchangedDataa() {
    emit(ProfileLoadingState());
    DioHelper.getData(url: getchangedData, token: CacheHelper.getData(key:SharedKeys.token)
).then((value) {
      myDataModel = MYDataModel.fromJson(value.data);

      emit(ProfileSuccessState());
    }).catchError((error) {
      if (error is DioError) {
        print(
            'eeeeeeeeeeeeeeeL${error.response!.data['message']}eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee');
        emit(ProfileErrorState(error.response!.data['message']));
      }
    });
  }

  void changeNameAlertDialog(BuildContext context,
      {required String? firstName,
      required GlobalKey<FormState> formKey,
      required TextEditingController nameController,
      required bool loading}) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(15.0),
              ),
            ),
            content: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Text('Change Name'),
                    const SizedBox(
                      height: 16,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        defaultFormField(
                          controller: nameController,
                          validate: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                          type: TextInputType.emailAddress,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              loading
                  ? const Center(child: CircularProgressIndicator())
                  : ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          changeMyData(
                            firstName: nameController.text,
                          );
                        }
                        getchangedDataa();
                        debugPrint('Name ${nameController.text}');
                        Navigator.pop(context);
                      },
                      child: const Text('Change')),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cansel'),
              ),
            ],
          );
        });
  }

  void changeEmailAlertDialog(BuildContext context,
      {required String? email,
      required GlobalKey<FormState> formKey,
      required TextEditingController eamilController,
      required bool loading}) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(15.0),
              ),
            ),
            content: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Text('Change Email'),
                    const SizedBox(
                      height: 16,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        defaultFormField(
                          controller: eamilController,
                          validate: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                          type: TextInputType.emailAddress,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              loading
                  ? const Center(child: CircularProgressIndicator())
                  : ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          changeMyData(
                            email: eamilController.text,
                          );
                        }
                        getchangedDataa();
                        debugPrint('Email ${eamilController.text}');
                        Navigator.pop(context);
                      },
                      child: const Text('Change')),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cansel'),
              ),
            ],
          );
        });
  }
}
