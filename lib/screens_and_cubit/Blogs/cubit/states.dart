
abstract class BlogsStatus {}

class InitialBlogsStatus extends BlogsStatus {}

class BlogsLoadingState extends BlogsStatus {}

class BlogsSuccessState extends BlogsStatus {
  // UserData? userData;
  BlogsSuccessState();

}
  
class BlogsErrorState extends BlogsStatus {
  final String error;
  BlogsErrorState(this.error);
}