

import '../../../../model/user_data_model/user_data_model.dart';

abstract class CreatePostStatus {}

class InitialCreatePostStatus extends CreatePostStatus {}

class CreatePostLoadingState extends CreatePostStatus {}

class CreatePostSuccessState extends CreatePostStatus {
  // UserData? userData;
  CreatePostSuccessState();

}

class GetImageSuccessState extends CreatePostStatus {}


class GetImageErrorState extends CreatePostStatus {}

class RemovePostImagePickedState extends CreatePostStatus {}


  

class CreatePostErrorState extends CreatePostStatus {
  final String error;
  CreatePostErrorState(this.error);
}
