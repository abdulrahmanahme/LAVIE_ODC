
import '../../../../model/user_data_model/user_data_model.dart';

abstract class LoginStatus {}

class InitialLoginStatus extends LoginStatus {}

class LoginLoadingState extends LoginStatus {}

class LoginSuccessState extends LoginStatus {
  UserData? userData;
  LoginSuccessState([this.userData]);

}

class LoginErrorState extends LoginStatus {
  final String error;
  LoginErrorState(this.error);
}


class LoginLoadinWithGooglegState extends LoginStatus {}

class LoginSuccessWithGoogleState extends LoginStatus {
  UserData? userDatawithGoogle;
 LoginSuccessWithGoogleState ({this.userDatawithGoogle});

}

class LoginErrorWithGoogleState extends LoginStatus {
  final String error;
  LoginErrorWithGoogleState(this.error);
}
class LoginChangePasswordVisibilityState extends LoginStatus {}





