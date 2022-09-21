
import 'package:lavie/model/forget_pass/forget_pass.dart';

import '../../../../model/user_data_model/user_data_model.dart';
import 'package:lavie/model/plants_mdel/plants_model.dart';

abstract class RQCodeStatus {}

class InitialRQCodeStatus extends RQCodeStatus{}

class RQCodeLoadingState extends RQCodeStatus {}

class RQCodeSuccessState extends RQCodeStatus {
  // UserData? userData;
  PlantsModel? plantsModel;
  RQCodeSuccessState({this.plantsModel});

}

class RQCodeErrorState extends RQCodeStatus {
  final String error;
RQCodeErrorState(this.error);
}


