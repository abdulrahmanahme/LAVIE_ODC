
abstract class HomeStatus {}

class InitialHomeStatus extends HomeStatus {}

class HomeLoadingState extends HomeStatus {}

class HomeSuccessState extends HomeStatus {

}

class HomeErrorState extends HomeStatus{
  final String error;
  HomeErrorState(this.error);
}