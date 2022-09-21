
import '../../../../model/user_data_model/user_data_model.dart';

abstract class ForumLavieStatus {}

class InitialForumStatus extends ForumLavieStatus {}

class ForumLoadingState extends ForumLavieStatus {}

class ForumSuccessState extends ForumLavieStatus {
  // UserData? userData;
  ForumSuccessState();

}

class ForumErrorState extends ForumLavieStatus {
  final String error;
  ForumErrorState(this.error);
}
