
import 'package:lavie/model/forget_pass/forget_pass.dart';

import '../../../../model/user_data_model/user_data_model.dart';

abstract class ForgetPassworLavieStatus {}

class InitialForgetPasswordStatus extends ForgetPassworLavieStatus{}

class ForgetPasswordLoadingState extends ForgetPassworLavieStatus {}

class ForgetPasswordSuccessState extends ForgetPassworLavieStatus {
  // UserData? userData;
  ForgetPass? forgetPass;
  ForgetPasswordSuccessState({this.forgetPass});

}

class ForgetPasswordErrorState extends ForgetPassworLavieStatus {
  final String error;
 ForgetPasswordErrorState(this.error);
}


class OTPLoadingState extends ForgetPassworLavieStatus {}
class OTPSuccessState extends ForgetPassworLavieStatus {
   ForgetPass? forgetPass;
   OTPSuccessState({this.forgetPass});
}
class OTPErrorState extends ForgetPassworLavieStatus {
  String ?error;
  OTPErrorState(this.error);
}



class CreateNewPasswordLoadingState extends ForgetPassworLavieStatus {}
class CreateNewPasswordSuccesstate extends ForgetPassworLavieStatus {
   ForgetPass? forgetPass;
   CreateNewPasswordSuccesstate({this.forgetPass});
}
class CreateNewPasswordErroetate extends ForgetPassworLavieStatus {
  String ?error;
  CreateNewPasswordErroetate(this.error);
}



class ForgetPasswordVisibilityState extends ForgetPassworLavieStatus {}
