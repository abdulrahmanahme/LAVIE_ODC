import '../../../../model/user_data_model/user_data_model.dart';

abstract class SginUpStatus {}

class InitialSginUpStatus extends SginUpStatus {}

class SginUpLoadingState extends SginUpStatus {}

class SginUpSuccessState extends SginUpStatus {
UserData? userData;
SginUpSuccessState([this.userData]);
}

class SginUpErrorState extends SginUpStatus {
  final String error;
 SginUpErrorState(this.error);
}

class SginUpChangePasswordVisibilityState extends SginUpStatus {}


