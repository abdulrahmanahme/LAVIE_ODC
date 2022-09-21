
import '../../../../model/user_data_model/user_data_model.dart';

abstract class ProfileLavieStatus {}

class InitialProfileStatus extends ProfileLavieStatus {}

class ProfileLoadingState extends ProfileLavieStatus {}

class ProfileSuccessState extends ProfileLavieStatus {
  // UserData? userData;
  ProfileSuccessState();

}

class ProfileErrorState extends ProfileLavieStatus {
  final String error;
  ProfileErrorState(this.error);
}
